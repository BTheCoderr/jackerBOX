import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { Client } from '@googlemaps/google-maps-services-js';

const mapsClient = new Client({});

export const calculateDeliveryFee = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to calculate delivery fee'
    );
  }

  const { address, pickupLocation, optionId } = data;

  try {
    // Get delivery option details
    const optionDoc = await admin.firestore()
      .collection('delivery_options')
      .doc(optionId)
      .get();

    if (!optionDoc.exists) {
      throw new functions.https.HttpsError(
        'not-found',
        'Delivery option not found'
      );
    }

    const option = optionDoc.data()!;

    // Calculate distance using Google Maps Distance Matrix API
    const response = await mapsClient.distancematrix({
      params: {
        origins: [{
          lat: pickupLocation.latitude,
          lng: pickupLocation.longitude,
        }],
        destinations: [address],
        key: functions.config().google.maps_key,
      },
    });

    if (response.data.rows[0].elements[0].status !== 'OK') {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'Could not calculate distance to delivery address'
      );
    }

    const distanceInMeters = response.data.rows[0].elements[0].distance.value;
    const distanceInKm = distanceInMeters / 1000;

    // Check if distance is within max distance
    if (distanceInKm > option.maxDistance) {
      throw new functions.https.HttpsError(
        'failed-precondition',
        'Delivery address is outside of delivery range'
      );
    }

    // Calculate fee
    const fee = option.baseFee + (distanceInKm * option.perKmFee);

    return {
      distance: distanceInKm,
      fee: Math.round(fee * 100) / 100, // Round to 2 decimal places
    };
  } catch (error) {
    console.error('Error calculating delivery fee:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to calculate delivery fee'
    );
  }
});

export const checkDeliveryAvailability = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to check delivery availability'
    );
  }

  const { address, pickupLocation, optionId } = data;

  try {
    // Get delivery option details
    const optionDoc = await admin.firestore()
      .collection('delivery_options')
      .doc(optionId)
      .get();

    if (!optionDoc.exists) {
      return { available: false };
    }

    const option = optionDoc.data()!;

    // Check distance
    const response = await mapsClient.distancematrix({
      params: {
        origins: [{
          lat: pickupLocation.latitude,
          lng: pickupLocation.longitude,
        }],
        destinations: [address],
        key: functions.config().google.maps_key,
      },
    });

    if (response.data.rows[0].elements[0].status !== 'OK') {
      return { available: false };
    }

    const distanceInMeters = response.data.rows[0].elements[0].distance.value;
    const distanceInKm = distanceInMeters / 1000;

    // Check if within max distance and any other restrictions
    const available = distanceInKm <= option.maxDistance;

    return { available };
  } catch (error) {
    console.error('Error checking delivery availability:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to check delivery availability'
    );
  }
});

export const getDeliverySlots = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to get delivery slots'
    );
  }

  const { optionId, date } = data;

  try {
    // Get delivery option details
    const optionDoc = await admin.firestore()
      .collection('delivery_options')
      .doc(optionId)
      .get();

    if (!optionDoc.exists) {
      throw new functions.https.HttpsError(
        'not-found',
        'Delivery option not found'
      );
    }

    const option = optionDoc.data()!;
    const requestedDate = new Date(date);

    // Get all deliveries for the requested date
    const deliveriesSnapshot = await admin.firestore()
      .collection('bookings')
      .where('deliveryDate', '>=', admin.firestore.Timestamp.fromDate(
        new Date(requestedDate.setHours(0, 0, 0, 0))
      ))
      .where('deliveryDate', '<=', admin.firestore.Timestamp.fromDate(
        new Date(requestedDate.setHours(23, 59, 59, 999))
      ))
      .get();

    // Get booked slots
    const bookedSlots = deliveriesSnapshot.docs.map(doc => {
      const data = doc.data();
      return data.deliveryDate.toDate();
    });

    // Generate available slots
    const slots = generateTimeSlots(requestedDate, option, bookedSlots);

    return { slots: slots.map(slot => slot.toISOString()) };
  } catch (error) {
    console.error('Error getting delivery slots:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to get delivery slots'
    );
  }
});

function generateTimeSlots(
  date: Date,
  option: FirebaseFirestore.DocumentData,
  bookedSlots: Date[]
): Date[] {
  const slots: Date[] = [];
  const startHour = 9; // 9 AM
  const endHour = 17; // 5 PM
  const slotDuration = 60; // 60 minutes per slot

  for (let hour = startHour; hour <= endHour; hour++) {
    for (let minute = 0; minute < 60; minute += slotDuration) {
      const slot = new Date(date);
      slot.setHours(hour, minute, 0, 0);

      // Skip if slot is already booked
      if (bookedSlots.some(bookedSlot => 
        Math.abs(bookedSlot.getTime() - slot.getTime()) < slotDuration * 60 * 1000
      )) {
        continue;
      }

      slots.push(slot);
    }
  }

  return slots;
}

// Trigger to update delivery status when booking status changes
export const updateDeliveryStatus = functions.firestore
  .document('bookings/{bookingId}')
  .onUpdate(async (change, context) => {
    const newData = change.after.data();
    const previousData = change.before.data();

    // Only process if status has changed
    if (newData.status === previousData.status) {
      return null;
    }

    // Only process bookings with delivery
    if (!newData.delivery) {
      return null;
    }

    try {
      const deliveryStatus = getDeliveryStatus(newData.status);
      if (deliveryStatus) {
        await change.after.ref.update({
          'delivery.status': deliveryStatus,
          'delivery.updatedAt': admin.firestore.FieldValue.serverTimestamp(),
        });
      }
    } catch (error) {
      console.error('Error updating delivery status:', error);
    }
  });

function getDeliveryStatus(bookingStatus: string): string | null {
  switch (bookingStatus) {
    case 'confirmed':
      return 'scheduled';
    case 'inProgress':
      return 'in_transit';
    case 'completed':
      return 'delivered';
    case 'cancelled':
    case 'declined':
      return 'cancelled';
    default:
      return null;
  }
} 