import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import Stripe from 'stripe';

const stripe = new Stripe(functions.config().stripe.secret_key, {
  apiVersion: '2023-10-16',
});

export const createPaymentIntent = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to create payment intent'
    );
  }

  const { bookingId, amount, currency } = data;
  
  try {
    // Get the customer ID from Firestore
    const userDoc = await admin.firestore()
      .collection('users')
      .doc(context.auth.uid)
      .get();

    const stripeCustomerId = userDoc.data()?.stripeCustomerId;
    if (!stripeCustomerId) {
      throw new functions.https.HttpsError(
        'failed-precondition',
        'User does not have a Stripe customer ID'
      );
    }

    // Create payment intent
    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount,
      currency: currency,
      customer: stripeCustomerId,
      metadata: {
        bookingId,
        userId: context.auth.uid,
      },
    });

    return {
      clientSecret: paymentIntent.client_secret,
    };
  } catch (error) {
    console.error('Error creating payment intent:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to create payment intent'
    );
  }
});

export const setupStripeCustomer = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to setup customer'
    );
  }

  const { email } = data;

  try {
    // Create Stripe customer
    const customer = await stripe.customers.create({
      email,
      metadata: {
        firebaseUid: context.auth.uid,
      },
    });

    // Save customer ID to Firestore
    await admin.firestore()
      .collection('users')
      .doc(context.auth.uid)
      .update({
        stripeCustomerId: customer.id,
      });

    return { customerId: customer.id };
  } catch (error) {
    console.error('Error setting up customer:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to setup customer'
    );
  }
});

export const listPaymentMethods = functions.https.onCall(async (_, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to list payment methods'
    );
  }

  try {
    // Get customer ID from Firestore
    const userDoc = await admin.firestore()
      .collection('users')
      .doc(context.auth.uid)
      .get();

    const stripeCustomerId = userDoc.data()?.stripeCustomerId;
    if (!stripeCustomerId) {
      return { paymentMethods: [] };
    }

    // List payment methods
    const paymentMethods = await stripe.paymentMethods.list({
      customer: stripeCustomerId,
      type: 'card',
    });

    return {
      paymentMethods: paymentMethods.data.map(method => ({
        id: method.id,
        card: {
          brand: method.card?.brand,
          last4: method.card?.last4,
          exp_month: method.card?.exp_month,
          exp_year: method.card?.exp_year,
        },
      })),
    };
  } catch (error) {
    console.error('Error listing payment methods:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to list payment methods'
    );
  }
});

export const attachPaymentMethod = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to attach payment method'
    );
  }

  const { paymentMethodId } = data;

  try {
    // Get customer ID from Firestore
    const userDoc = await admin.firestore()
      .collection('users')
      .doc(context.auth.uid)
      .get();

    const stripeCustomerId = userDoc.data()?.stripeCustomerId;
    if (!stripeCustomerId) {
      throw new functions.https.HttpsError(
        'failed-precondition',
        'User does not have a Stripe customer ID'
      );
    }

    // Attach payment method to customer
    await stripe.paymentMethods.attach(paymentMethodId, {
      customer: stripeCustomerId,
    });

    return { success: true };
  } catch (error) {
    console.error('Error attaching payment method:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to attach payment method'
    );
  }
});

export const detachPaymentMethod = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to detach payment method'
    );
  }

  const { paymentMethodId } = data;

  try {
    await stripe.paymentMethods.detach(paymentMethodId);
    return { success: true };
  } catch (error) {
    console.error('Error detaching payment method:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to detach payment method'
    );
  }
});

// Webhook handler for payment events
export const handleStripeWebhook = functions.https.onRequest(async (req, res) => {
  const sig = req.headers['stripe-signature'];
  const webhookSecret = functions.config().stripe.webhook_secret;

  try {
    const event = stripe.webhooks.constructEvent(
      req.rawBody,
      sig as string,
      webhookSecret
    );

    switch (event.type) {
      case 'payment_intent.succeeded':
        await handlePaymentSuccess(event.data.object as Stripe.PaymentIntent);
        break;
      case 'payment_intent.payment_failed':
        await handlePaymentFailure(event.data.object as Stripe.PaymentIntent);
        break;
    }

    res.json({ received: true });
  } catch (err) {
    console.error('Error processing webhook:', err);
    res.status(400).send(`Webhook Error: ${err.message}`);
  }
});

async function handlePaymentSuccess(paymentIntent: Stripe.PaymentIntent) {
  const { bookingId } = paymentIntent.metadata;
  if (!bookingId) return;

  const bookingRef = admin.firestore().collection('bookings').doc(bookingId);
  
  await bookingRef.update({
    paymentStatus: 'paid',
    paymentId: paymentIntent.id,
    paidAmount: paymentIntent.amount / 100,
    paidAt: admin.firestore.FieldValue.serverTimestamp(),
  });
}

async function handlePaymentFailure(paymentIntent: Stripe.PaymentIntent) {
  const { bookingId } = paymentIntent.metadata;
  if (!bookingId) return;

  const bookingRef = admin.firestore().collection('bookings').doc(bookingId);
  
  await bookingRef.update({
    paymentStatus: 'failed',
    paymentError: paymentIntent.last_payment_error?.message,
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
  });
} 