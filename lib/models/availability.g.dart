// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailabilityImpl _$$AvailabilityImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AvailabilityImpl',
      json,
      ($checkedConvert) {
        final val = _$AvailabilityImpl(
          availableFrom: $checkedConvert(
              'available_from', (v) => DateTime.parse(v as String)),
          availableTo: $checkedConvert(
              'available_to', (v) => DateTime.parse(v as String)),
          unavailableDates: $checkedConvert(
              'unavailable_dates',
              (v) => (v as List<dynamic>)
                  .map((e) => DateTime.parse(e as String))
                  .toList()),
          minimumRentalDays: $checkedConvert(
              'minimum_rental_days', (v) => (v as num?)?.toInt() ?? 1),
          maximumRentalDays: $checkedConvert(
              'maximum_rental_days', (v) => (v as num?)?.toInt() ?? 30),
          unavailableDaysOfWeek: $checkedConvert(
              'unavailable_days_of_week',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          seasonalPricing: $checkedConvert('seasonal_pricing',
              (v) => v as Map<String, dynamic>? ?? const {}),
          advanceNotice: $checkedConvert('advance_notice', (v) => v as String?),
          autoApprove:
              $checkedConvert('auto_approve', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {
        'availableFrom': 'available_from',
        'availableTo': 'available_to',
        'unavailableDates': 'unavailable_dates',
        'minimumRentalDays': 'minimum_rental_days',
        'maximumRentalDays': 'maximum_rental_days',
        'unavailableDaysOfWeek': 'unavailable_days_of_week',
        'seasonalPricing': 'seasonal_pricing',
        'advanceNotice': 'advance_notice',
        'autoApprove': 'auto_approve'
      },
    );

Map<String, dynamic> _$$AvailabilityImplToJson(_$AvailabilityImpl instance) =>
    <String, dynamic>{
      'available_from': instance.availableFrom.toIso8601String(),
      'available_to': instance.availableTo.toIso8601String(),
      'unavailable_dates':
          instance.unavailableDates.map((e) => e.toIso8601String()).toList(),
      'minimum_rental_days': instance.minimumRentalDays,
      'maximum_rental_days': instance.maximumRentalDays,
      'unavailable_days_of_week': instance.unavailableDaysOfWeek,
      'seasonal_pricing': instance.seasonalPricing,
      'advance_notice': instance.advanceNotice,
      'auto_approve': instance.autoApprove,
    };
