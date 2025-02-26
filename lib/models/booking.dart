import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

enum BookingStatus {
  pending,
  confirmed,
  completed,
  cancelled
}

@JsonSerializable()
class Booking {
  final String id;
  final String equipmentId;
  final String renterId;
  final DateTime startDate;
  final DateTime endDate;
  final double totalPrice;
  final BookingStatus status;

  Booking({
    required this.id,
    required this.equipmentId,
    required this.renterId,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);
} 