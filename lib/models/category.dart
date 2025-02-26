import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
  });
}

class Categories {
  static const List<Category> all = [
    Category(id: 'construction', name: 'Construction', icon: Icons.construction),
    Category(id: 'photography', name: 'Photography', icon: Icons.camera_alt),
    Category(id: 'music', name: 'Music', icon: Icons.music_note),
    Category(id: 'sports', name: 'Sports', icon: Icons.sports),
    Category(id: 'gardening', name: 'Gardening', icon: Icons.yard),
    Category(id: 'electronics', name: 'Electronics', icon: Icons.devices),
    Category(id: 'camping', name: 'Camping', icon: Icons.forest),
    Category(id: 'party', name: 'Party & Events', icon: Icons.celebration),
    Category(id: 'tools', name: 'Tools', icon: Icons.handyman),
    Category(id: 'vehicles', name: 'Vehicles', icon: Icons.directions_car),
  ];

  static Category getById(String id) {
    return all.firstWhere(
      (category) => category.id == id,
      orElse: () => const Category(
        id: 'other',
        name: 'Other',
        icon: Icons.category,
      ),
    );
  }
} 