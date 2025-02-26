import 'package:freezed_annotation/freezed_annotation.dart';

part 'availability.freezed.dart';
part 'availability.g.dart';

@freezed
class Availability with _$Availability {
  const factory Availability({
    required DateTime availableFrom,
    required DateTime availableTo,
    required List<DateTime> unavailableDates,
    @Default(1) int minimumRentalDays,
    @Default(30) int maximumRentalDays,
    @Default([]) List<String> unavailableDaysOfWeek,
    @Default({}) Map<String, dynamic> seasonalPricing,
    String? advanceNotice,
    @Default(true) bool autoApprove,
  }) = _Availability;

  factory Availability.fromJson(Map<String, dynamic> json) => _$AvailabilityFromJson(json);
} 