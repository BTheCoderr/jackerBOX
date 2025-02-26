import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

enum BookingStatus {
  pending,
  approved,
  rejected,
  cancelled,
  completed;

  String get displayName {
    switch (this) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.approved:
        return 'Approved';
      case BookingStatus.rejected:
        return 'Rejected';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.completed:
        return 'Completed';
    }
  }
}

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String equipmentId,
    required String renterId,
    required String ownerId,
    required DateTime startDate,
    required DateTime endDate,
    required double totalPrice,
    @Default(BookingStatus.pending) BookingStatus status,
    String? declineReason,
    String? cancellationReason,
    @Default({}) Map<String, dynamic> metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
} 