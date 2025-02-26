// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LocationImpl',
      json,
      ($checkedConvert) {
        final val = _$LocationImpl(
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
          address: $checkedConvert('address', (v) => v as String),
          city: $checkedConvert('city', (v) => v as String?),
          state: $checkedConvert('state', (v) => v as String?),
          zipCode: $checkedConvert('zip_code', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
          placeId: $checkedConvert('place_id', (v) => v as String?),
          formattedAddress:
              $checkedConvert('formatted_address', (v) => v as String?),
          additionalDetails: $checkedConvert('additional_details',
              (v) => v as Map<String, dynamic>? ?? const {}),
        );
        return val;
      },
      fieldKeyMap: const {
        'zipCode': 'zip_code',
        'placeId': 'place_id',
        'formattedAddress': 'formatted_address',
        'additionalDetails': 'additional_details'
      },
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
      'country': instance.country,
      'place_id': instance.placeId,
      'formatted_address': instance.formattedAddress,
      'additional_details': instance.additionalDetails,
    };
