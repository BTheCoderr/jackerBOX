import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    required String address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? placeId,
    String? formattedAddress,
    @Default({}) Map<String, dynamic> additionalDetails,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
} 