import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../models/equipment.dart';

class EquipmentService {
  final FirebaseFirestore firestore;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String collection = 'equipment';

  EquipmentService({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  // Create new equipment
  Future<Equipment> createEquipment(Equipment equipment) async {
    final docRef = firestore.collection(collection).doc();
    final newEquipment = equipment.copyWith(
      id: docRef.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    await docRef.set(newEquipment.toJson());
    return newEquipment;
  }

  // Get equipment by ID
  Future<Equipment?> getEquipmentById(String id) async {
    final doc = await firestore.collection(collection).doc(id).get();
    if (!doc.exists) return null;
    return Equipment.fromJson(doc.data()!);
  }

  // Update equipment
  Future<void> updateEquipment(String id, Map<String, dynamic> data) async {
    await firestore.collection(collection).doc(id).update({
      ...data,
      'updatedAt': DateTime.now(),
    });
  }

  // Delete equipment
  Future<void> deleteEquipment(String id) async {
    // Delete equipment images from storage
    final equipment = await getEquipmentById(id);
    if (equipment != null) {
      for (final imageUrl in equipment.images) {
        try {
          final ref = _storage.refFromURL(imageUrl);
          await ref.delete();
        } catch (e) {
          print('Error deleting image: $e');
        }
      }
    }
    
    // Delete equipment document
    await firestore.collection(collection).doc(id).delete();
  }

  // Upload equipment image
  Future<String> uploadImage(String equipmentId, File file) async {
    final ref = _storage.ref()
        .child('equipment_images')
        .child(equipmentId)
        .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
    
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  // Search equipment
  Future<List<Equipment>> searchEquipment({
    String? query,
    EquipmentCategory? category,
    double? maxPrice,
    double? minRating,
    String? city,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    DocumentSnapshot? startAfter,
  }) async {
    Query equipmentQuery = firestore.collection(collection)
        .where('isActive', isEqualTo: true);

    if (category != null) {
      equipmentQuery = equipmentQuery.where('category', isEqualTo: category.toString().split('.').last);
    }

    if (maxPrice != null) {
      equipmentQuery = equipmentQuery.where('dailyRate', isLessThanOrEqualTo: maxPrice);
    }

    if (minRating != null) {
      equipmentQuery = equipmentQuery.where('rating', isGreaterThanOrEqualTo: minRating);
    }

    if (city != null) {
      equipmentQuery = equipmentQuery.where('location.city', isEqualTo: city);
    }

    if (limit != null) {
      equipmentQuery = equipmentQuery.limit(limit);
    }

    if (startAfter != null) {
      equipmentQuery = equipmentQuery.startAfterDocument(startAfter);
    }

    final snapshot = await equipmentQuery.get();
    final equipment = snapshot.docs.map((doc) => Equipment.fromJson(doc.data() as Map<String, dynamic>)).toList();

    // Filter by availability if dates are provided
    if (startDate != null && endDate != null) {
      return equipment.where((e) {
        if (e.availability == null) return false;
        
        final availability = e.availability!;
        if (startDate.isBefore(availability.availableFrom) ||
            endDate.isAfter(availability.availableTo)) {
          return false;
        }

        // Check if any unavailable dates overlap with the requested period
        for (final unavailableDate in availability.unavailableDates) {
          if (!unavailableDate.isBefore(startDate) &&
              !unavailableDate.isAfter(endDate)) {
            return false;
          }
        }

        return true;
      }).toList();
    }

    // Apply text search if query is provided
    if (query != null && query.isNotEmpty) {
      final lowercaseQuery = query.toLowerCase();
      return equipment.where((e) {
        return e.name.toLowerCase().contains(lowercaseQuery) ||
               e.description.toLowerCase().contains(lowercaseQuery) ||
               e.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery));
      }).toList();
    }

    return equipment;
  }

  // Get equipment by owner
  Future<List<Equipment>> getEquipmentByOwner(String ownerId) async {
    final snapshot = await firestore.collection(collection)
        .where('ownerId', isEqualTo: ownerId)
        .get();
    
    return snapshot.docs
        .map((doc) => Equipment.fromJson(doc.data()))
        .toList();
  }

  // Update equipment rating
  Future<void> updateEquipmentRating(String equipmentId, double newRating, int newReviewCount) async {
    await firestore.collection(collection).doc(equipmentId).update({
      'rating': newRating,
      'reviewCount': newReviewCount,
      'updatedAt': DateTime.now(),
    });
  }

  // Toggle equipment active status
  Future<void> toggleEquipmentStatus(String equipmentId, bool isActive) async {
    await firestore.collection(collection).doc(equipmentId).update({
      'isActive': isActive,
      'updatedAt': DateTime.now(),
    });
  }
} 