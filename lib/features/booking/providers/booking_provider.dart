import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../domain/models/booking.dart';
import '../domain/services/booking_service.dart';
import '../../equipment/domain/models/equipment.dart';

class BookingProvider extends ChangeNotifier {
  static const String _bookingsKey = 'bookings';
  
  final SharedPreferences _prefs;
  final BookingService _bookingService;
  
  List<Booking> _bookings = [];
  Booking? _selectedBooking;
  bool _isLoading = false;
  String? _error;

  BookingProvider._({required SharedPreferences prefs, BookingService? bookingService})
      : _prefs = prefs,
        _bookingService = bookingService ?? BookingService();

  static Future<BookingProvider> create() async {
    final prefs = await SharedPreferences.getInstance();
    return BookingProvider._(prefs: prefs);
  }

  // Getters
  List<Booking> get bookings => _bookings;
  Booking? get selectedBooking => _selectedBooking;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void _loadSavedBookings() {
    final bookingsJson = _prefs.getStringList(_bookingsKey);
    if (bookingsJson != null) {
      _bookings = bookingsJson
          .map((json) => Booking.fromJson(jsonDecode(json)))
          .toList();
      notifyListeners();
    }
  }

  Future<void> _saveBookings() async {
    final bookingsJson = _bookings
        .map((booking) => jsonEncode(booking.toJson()))
        .toList();
    await _prefs.setStringList(_bookingsKey, bookingsJson);
  }

  // Create booking
  Future<void> createBooking({
    required Equipment equipment,
    required String renterId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Check availability
      final isAvailable = await _bookingService.isEquipmentAvailable(
        equipment.id,
        startDate,
        endDate,
      );

      if (!isAvailable) {
        throw Exception('Equipment is not available for selected dates');
      }

      // Calculate total price
      final totalPrice = _bookingService.calculateTotalPrice(
        equipment,
        startDate,
        endDate,
      );

      // Create booking
      final booking = Booking(
        id: '',
        equipmentId: equipment.id,
        renterId: renterId,
        ownerId: equipment.ownerId,
        startDate: startDate,
        endDate: endDate,
        totalPrice: totalPrice,
        status: BookingStatus.pending,
      );

      final newBooking = await _bookingService.createBooking(booking);
      _bookings.insert(0, newBooking);
      _selectedBooking = newBooking;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  // Load bookings for equipment
  Future<void> loadBookingsForEquipment(String equipmentId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _bookings = await _bookingService.getBookingsForEquipment(equipmentId);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Load bookings for renter
  Future<void> loadBookingsForRenter(String renterId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _bookings = await _bookingService.getBookingsForRenter(renterId);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Load bookings for owner
  Future<void> loadBookingsForOwner(String ownerId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _bookings = await _bookingService.getBookingsForOwner(ownerId);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get booking by ID
  Future<void> getBooking(String id) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _selectedBooking = await _bookingService.getBookingById(id);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update booking status
  Future<void> updateBookingStatus(
    String bookingId,
    BookingStatus status, {
    String? reason,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _bookingService.updateBookingStatus(bookingId, status, reason: reason);

      final index = _bookings.indexWhere((b) => b.id == bookingId);
      if (index != -1) {
        _bookings[index] = _bookings[index].copyWith(
          status: status,
          declineReason: status == BookingStatus.rejected ? reason : null,
          cancellationReason: status == BookingStatus.cancelled ? reason : null,
        );
      }

      if (_selectedBooking?.id == bookingId) {
        _selectedBooking = _selectedBooking?.copyWith(
          status: status,
          declineReason: status == BookingStatus.rejected ? reason : null,
          cancellationReason: status == BookingStatus.cancelled ? reason : null,
        );
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
} 