// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Booking',
      json,
      ($checkedConvert) {
        final val = Booking(
          id: $checkedConvert('id', (v) => v as String),
          equipmentId: $checkedConvert('equipment_id', (v) => v as String),
          renterId: $checkedConvert('renter_id', (v) => v as String),
          startDate:
              $checkedConvert('start_date', (v) => DateTime.parse(v as String)),
          endDate:
              $checkedConvert('end_date', (v) => DateTime.parse(v as String)),
          totalPrice:
              $checkedConvert('total_price', (v) => (v as num).toDouble()),
          status: $checkedConvert(
              'status', (v) => $enumDecode(_$BookingStatusEnumMap, v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'equipmentId': 'equipment_id',
        'renterId': 'renter_id',
        'startDate': 'start_date',
        'endDate': 'end_date',
        'totalPrice': 'total_price'
      },
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'equipment_id': instance.equipmentId,
      'renter_id': instance.renterId,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'total_price': instance.totalPrice,
      'status': _$BookingStatusEnumMap[instance.status]!,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.completed: 'completed',
  BookingStatus.cancelled: 'cancelled',
};
