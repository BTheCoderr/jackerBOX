import '../../domain/models/booking.dart';
import '../../../equipment/domain/models/equipment.dart';

class BookingService {
  List<Booking> _bookings = [];

  BookingService();

  // Create a new booking
  Future<Booking> createBooking(Booking booking) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    final newBooking = booking.copyWith(
      id: 'booking_${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
    );

    _bookings.add(newBooking);
    return newBooking;
  }

  // Get booking by ID
  Future<Booking?> getBookingById(String id) async {
    return _bookings.firstWhere((booking) => booking.id == id);
  }

  // Get bookings for equipment
  Future<List<Booking>> getBookingsForEquipment(String equipmentId) async {
    return _bookings.where((booking) => booking.equipmentId == equipmentId).toList();
  }

  // Get bookings for renter
  Future<List<Booking>> getBookingsForRenter(String renterId) async {
    return _bookings.where((booking) => booking.renterId == renterId).toList();
  }

  // Get bookings for owner
  Future<List<Booking>> getBookingsForOwner(String ownerId) async {
    return _bookings.where((booking) => booking.ownerId == ownerId).toList();
  }

  // Update booking status
  Future<void> updateBookingStatus(
    String bookingId, 
    BookingStatus status, {
    String? reason,
  }) async {
    final booking = await getBookingById(bookingId);
    if (booking != null) {
      final updatedBooking = booking.copyWith(
        status: status,
        updatedAt: DateTime.now(),
      );
      _bookings.remove(booking);
      _bookings.add(updatedBooking);
    }
  }

  // Check if equipment is available for dates
  Future<bool> isEquipmentAvailable(
    String equipmentId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    // Simple availability check
    final conflictingBookings = _bookings.where((booking) =>
        booking.equipmentId == equipmentId &&
        booking.status != BookingStatus.cancelled &&
        booking.status != BookingStatus.rejected &&
        ((startDate.isBefore(booking.endDate) &&
            endDate.isAfter(booking.startDate))));

    return conflictingBookings.isEmpty;
  }

  // Calculate total price for booking
  double calculateTotalPrice(
    Equipment equipment,
    DateTime startDate,
    DateTime endDate,
  ) {
    final days = endDate.difference(startDate).inDays + 1;
    return equipment.dailyRate * days;
  }
} 