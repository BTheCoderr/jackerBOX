const admin = require('firebase-admin');
const serviceAccount = require('../service-account.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

async function initializeCollections() {
  // Initialize delivery options
  const deliveryOptions = [
    {
      id: 'standard-delivery',
      type: 'delivery',
      name: 'Standard Delivery',
      baseFee: 15.00,
      perKmFee: 2.00,
      maxDistance: 50,
      description: 'Standard delivery service within 50km',
    },
    {
      id: 'express-delivery',
      type: 'delivery',
      name: 'Express Delivery',
      baseFee: 25.00,
      perKmFee: 3.00,
      maxDistance: 30,
      description: 'Same-day delivery service within 30km',
    },
    {
      id: 'self-pickup',
      type: 'pickup',
      name: 'Self Pickup',
      baseFee: 0,
      perKmFee: 0,
      maxDistance: 0,
      description: 'Pick up the equipment yourself',
    }
  ];

  // Add delivery options
  for (const option of deliveryOptions) {
    await db.collection('delivery_options').doc(option.id).set(option);
    console.log(`Added delivery option: ${option.name}`);
  }

  console.log('Initialization complete!');
}

initializeCollections().then(() => {
  console.log('Done!');
  process.exit(0);
}).catch((error) => {
  console.error('Error:', error);
  process.exit(1);
}); 