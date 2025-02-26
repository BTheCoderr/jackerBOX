import 'package:flutter/foundation.dart';

enum EquipmentCategory {
  photography,
  videography,
  audio,
  lighting,
  drones,
  tools,
  other;

  String get displayName {
    switch (this) {
      case EquipmentCategory.photography:
        return 'Photography';
      case EquipmentCategory.videography:
        return 'Videography';
      case EquipmentCategory.audio:
        return 'Audio';
      case EquipmentCategory.lighting:
        return 'Lighting';
      case EquipmentCategory.drones:
        return 'Drones';
      case EquipmentCategory.tools:
        return 'Tools';
      case EquipmentCategory.other:
        return 'Other';
    }
  }
}

class Location {
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? city;
  final String? state;
  final String? country;

  const Location({
    this.latitude,
    this.longitude,
    this.address,
    this.city,
    this.state,
    this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
    );
  }
}

@immutable
class Equipment {
  final String id;
  final String ownerId;
  final String ownerName;
  final String name;
  final String description;
  final double dailyRate;
  final EquipmentCategory category;
  final List<String> images;
  final Location location;
  final Map<String, dynamic> coordinates;
  final List<String> features;
  final List<String> requirements;
  final double rating;
  final int reviewCount;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Equipment({
    required this.id,
    required this.ownerId,
    required this.ownerName,
    required this.name,
    required this.description,
    required this.dailyRate,
    required this.category,
    required this.images,
    required this.location,
    required this.coordinates,
    required this.features,
    this.requirements = const [],
    required this.rating,
    required this.reviewCount,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  Equipment copyWith({
    String? id,
    String? ownerId,
    String? ownerName,
    String? name,
    String? description,
    double? dailyRate,
    EquipmentCategory? category,
    List<String>? images,
    Location? location,
    Map<String, dynamic>? coordinates,
    List<String>? features,
    List<String>? requirements,
    double? rating,
    int? reviewCount,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Equipment(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      name: name ?? this.name,
      description: description ?? this.description,
      dailyRate: dailyRate ?? this.dailyRate,
      category: category ?? this.category,
      images: images ?? this.images,
      location: location ?? this.location,
      coordinates: coordinates ?? this.coordinates,
      features: features ?? this.features,
      requirements: requirements ?? this.requirements,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'name': name,
      'description': description,
      'dailyRate': dailyRate,
      'category': category.toString(),
      'images': images,
      'location': location.toJson(),
      'coordinates': coordinates,
      'features': features,
      'requirements': requirements,
      'rating': rating,
      'reviewCount': reviewCount,
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      ownerName: json['ownerName'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      dailyRate: json['dailyRate'] as double,
      category: EquipmentCategory.values.firstWhere(
        (e) => e.toString() == json['category'],
        orElse: () => EquipmentCategory.other,
      ),
      images: List<String>.from(json['images'] as List),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      coordinates: json['coordinates'] as Map<String, dynamic>,
      features: List<String>.from(json['features'] as List),
      requirements: List<String>.from(json['requirements'] as List? ?? []),
      rating: json['rating'] as double,
      reviewCount: json['reviewCount'] as int,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }
} 