// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$BookingImpl',
      json,
      ($checkedConvert) {
        final val = _$BookingImpl(
          id: $checkedConvert('id', (v) => v as String),
          equipmentId: $checkedConvert('equipment_id', (v) => v as String),
          renterId: $checkedConvert('renter_id', (v) => v as String),
          ownerId: $checkedConvert('owner_id', (v) => v as String),
          startDate:
              $checkedConvert('start_date', (v) => DateTime.parse(v as String)),
          endDate:
              $checkedConvert('end_date', (v) => DateTime.parse(v as String)),
          totalPrice:
              $checkedConvert('total_price', (v) => (v as num).toDouble()),
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$BookingStatusEnumMap, v) ??
                  BookingStatus.pending),
          declineReason: $checkedConvert('decline_reason', (v) => v as String?),
          cancellationReason:
              $checkedConvert('cancellation_reason', (v) => v as String?),
          metadata: $checkedConvert(
              'metadata', (v) => v as Map<String, dynamic>? ?? const {}),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updated_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'equipmentId': 'equipment_id',
        'renterId': 'renter_id',
        'ownerId': 'owner_id',
        'startDate': 'start_date',
        'endDate': 'end_date',
        'totalPrice': 'total_price',
        'declineReason': 'decline_reason',
        'cancellationReason': 'cancellation_reason',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'equipment_id': instance.equipmentId,
      'renter_id': instance.renterId,
      'owner_id': instance.ownerId,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'total_price': instance.totalPrice,
      'status': _$BookingStatusEnumMap[instance.status]!,
      'decline_reason': instance.declineReason,
      'cancellation_reason': instance.cancellationReason,
      'metadata': instance.metadata,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.approved: 'approved',
  BookingStatus.rejected: 'rejected',
  BookingStatus.cancelled: 'cancelled',
  BookingStatus.completed: 'completed',
};
