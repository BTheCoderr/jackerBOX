import '../features/equipment/domain/models/equipment.dart';

class SampleData {
  static const String sampleUserId = 'sample_user_1';
  static const String sampleUserName = 'John Doe';

  static final List<Equipment> sampleEquipment = [
    Equipment(
      id: 'camera_kit_1',
      ownerId: sampleUserId,
      ownerName: sampleUserName,
      name: 'Professional Camera Kit',
      description: 'Complete professional camera kit including Canon EOS R5, tripod, and multiple lenses. Perfect for professional photography and videography.',
      dailyRate: 99.99,
      category: EquipmentCategory.photography,
      images: [
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32',
        'https://images.unsplash.com/photo-1502920917128-1aa500764cbd'
      ],
      location: const Location(
        latitude: 37.7749,
        longitude: -122.4194,
        address: '123 Market St',
        city: 'San Francisco',
        state: 'CA',
        country: 'USA',
      ),
      coordinates: {'lat': 37.7749, 'lng': -122.4194},
      features: ['4K Video', '45MP Photos', 'Weather Sealed', 'Multiple Lenses'],
      rating: 4.8,
      reviewCount: 12,
    ),
    Equipment(
      id: 'drone_kit_1',
      ownerId: sampleUserId,
      ownerName: sampleUserName,
      name: 'DJI Mavic 3 Pro Kit',
      description: 'Latest DJI Mavic 3 Pro drone with extra batteries, ND filters, and carrying case. Ideal for aerial photography and cinematography.',
      dailyRate: 149.99,
      category: EquipmentCategory.drones,
      images: [
        'https://images.unsplash.com/photo-1473968512647-3e447244af8f',
        'https://images.unsplash.com/photo-1524143986875-3b098d78b363'
      ],
      location: const Location(
        latitude: 37.7833,
        longitude: -122.4167,
        address: '456 Hayes St',
        city: 'San Francisco',
        state: 'CA',
        country: 'USA',
      ),
      coordinates: {'lat': 37.7833, 'lng': -122.4167},
      features: ['5.1K Video', '4/3 CMOS Sensor', '46min Flight Time', 'Omnidirectional Obstacle Sensing'],
      rating: 4.9,
      reviewCount: 8,
    ),
    Equipment(
      id: 'audio_kit_1',
      ownerId: sampleUserId,
      ownerName: sampleUserName,
      name: 'Podcast Recording Kit',
      description: 'Complete podcast recording setup with Shure SM7B microphone, audio interface, boom arm, and acoustic treatment.',
      dailyRate: 79.99,
      category: EquipmentCategory.audio,
      images: [
        'https://images.unsplash.com/photo-1590602847861-f357a9332bbc',
        'https://images.unsplash.com/photo-1615557960916-5f4791effe9d'
      ],
      location: const Location(
        latitude: 37.7694,
        longitude: -122.4862,
        address: '789 Sunset Blvd',
        city: 'San Francisco',
        state: 'CA',
        country: 'USA',
      ),
      coordinates: {'lat': 37.7694, 'lng': -122.4862},
      features: ['Studio Quality', 'XLR Connection', 'USB Interface', 'Pop Filter'],
      rating: 4.7,
      reviewCount: 15,
    ),
    Equipment(
      id: 'lighting_kit_1',
      ownerId: sampleUserId,
      ownerName: sampleUserName,
      name: 'Professional Lighting Kit',
      description: 'Godox studio lighting kit with 3 LED lights, softboxes, stands, and wireless control. Perfect for photography and video production.',
      dailyRate: 89.99,
      category: EquipmentCategory.lighting,
      images: [
        'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1',
        'https://images.unsplash.com/photo-1593359677879-a4bb92f829d2'
      ],
      location: const Location(
        latitude: 37.7858,
        longitude: -122.4065,
        address: '321 Mission St',
        city: 'San Francisco',
        state: 'CA',
        country: 'USA',
      ),
      coordinates: {'lat': 37.7858, 'lng': -122.4065},
      features: ['2800K-6500K', 'Wireless Control', 'Battery Powered', 'Travel Case'],
      rating: 4.6,
      reviewCount: 10,
    ),
    Equipment(
      id: 'tools_kit_1',
      ownerId: sampleUserId,
      ownerName: sampleUserName,
      name: 'Power Tool Set',
      description: 'Complete DeWalt 20V MAX power tool set including drill, impact driver, circular saw, and reciprocating saw with batteries and charger.',
      dailyRate: 69.99,
      category: EquipmentCategory.tools,
      images: [
        'https://images.unsplash.com/photo-1581147036324-c1c9bf853b62',
        'https://images.unsplash.com/photo-1581147036324-c1c9bf853b63'
      ],
      location: const Location(
        latitude: 37.7879,
        longitude: -122.4074,
        address: '987 Howard St',
        city: 'San Francisco',
        state: 'CA',
        country: 'USA',
      ),
      coordinates: {'lat': 37.7879, 'lng': -122.4074},
      features: ['20V MAX System', 'Brushless Motors', '4 Tools', '2 Batteries'],
      rating: 4.5,
      reviewCount: 20,
    ),
  ];

  static Map<String, dynamic> sampleUserData = {
    'id': sampleUserId,
    'name': sampleUserName,
    'email': 'john.doe@example.com',
    'profileImage': 'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
    'memberSince': DateTime(2024, 1, 1),
    'listings': 12,
    'rentals': 8,
    'rating': 4.8,
    'reviews': 25,
    'location': 'San Francisco, CA',
    'bio': 'Professional photographer and videographer with a passion for sharing quality equipment.',
    'verifiedId': true,
    'verifiedPhone': true,
    'verifiedEmail': true,
  };
} 