import 'package:flutter/foundation.dart';
import 'dart:io';
import '../domain/models/equipment.dart';
import '../../../core/sample_data.dart';

class EquipmentProvider extends ChangeNotifier {
  List<Equipment> _equipment = [];
  Equipment? _selectedEquipment;
  bool _isLoading = false;
  String? _error;
  bool _hasMore = true;

  // Getters
  List<Equipment> get equipment => _equipment;
  Equipment? get selectedEquipment => _selectedEquipment;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasMore => _hasMore;

  // Load equipment with pagination
  Future<void> loadEquipment({
    String? query,
    EquipmentCategory? category,
    double? maxPrice,
    double? minRating,
    String? city,
    bool refresh = false,
  }) async {
    if (refresh) {
      _equipment = [];
      _hasMore = true;
    }

    if (!_hasMore) return;

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      var filteredEquipment = List<Equipment>.from(SampleData.sampleEquipment);

      // Apply filters
      if (category != null) {
        filteredEquipment = filteredEquipment
            .where((e) => e.category == category)
            .toList();
      }

      if (maxPrice != null) {
        filteredEquipment = filteredEquipment
            .where((e) => e.dailyRate <= maxPrice)
            .toList();
      }

      if (minRating != null) {
        filteredEquipment = filteredEquipment
            .where((e) => e.rating >= minRating)
            .toList();
      }

      if (city != null) {
        filteredEquipment = filteredEquipment
            .where((e) => e.location.city?.toLowerCase() == city.toLowerCase())
            .toList();
      }

      if (query != null && query.isNotEmpty) {
        final lowercaseQuery = query.toLowerCase();
        filteredEquipment = filteredEquipment
            .where((e) =>
                e.name.toLowerCase().contains(lowercaseQuery) ||
                e.description.toLowerCase().contains(lowercaseQuery))
            .toList();
      }

      _equipment = filteredEquipment;
      _hasMore = false; // No more pagination with sample data

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get equipment by ID
  Future<void> getEquipment(String id) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      _selectedEquipment = SampleData.sampleEquipment
          .firstWhere((e) => e.id == id);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Create equipment
  Future<void> createEquipment(Equipment equipment) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      final newEquipment = equipment.copyWith(
        id: 'equipment_${DateTime.now().millisecondsSinceEpoch}',
        createdAt: DateTime.now(),
      );

      _equipment.insert(0, newEquipment);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update equipment
  Future<void> updateEquipment(Equipment equipment) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      final index = _equipment.indexWhere((e) => e.id == equipment.id);
      if (index != -1) {
        _equipment[index] = equipment.copyWith(
          updatedAt: DateTime.now(),
        );
      }

      if (_selectedEquipment?.id == equipment.id) {
        _selectedEquipment = equipment;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete equipment
  Future<void> deleteEquipment(String id) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      _equipment.removeWhere((e) => e.id == id);
      if (_selectedEquipment?.id == id) {
        _selectedEquipment = null;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Upload image (mock implementation)
  Future<String> uploadImage(String equipmentId, File file) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Return a random Unsplash image URL
      return 'https://images.unsplash.com/photo-${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  // Toggle equipment status
  Future<void> toggleEquipmentStatus(String id, bool isActive) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      final index = _equipment.indexWhere((e) => e.id == id);
      if (index != -1) {
        _equipment[index] = _equipment[index].copyWith(
          isActive: isActive,
          updatedAt: DateTime.now(),
        );
      }

      if (_selectedEquipment?.id == id) {
        _selectedEquipment = _selectedEquipment?.copyWith(
          isActive: isActive,
          updatedAt: DateTime.now(),
        );
      }

      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Create sample equipment
  Future<void> createSampleEquipment() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Use sample data
      _equipment = List<Equipment>.from(SampleData.sampleEquipment);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
} 