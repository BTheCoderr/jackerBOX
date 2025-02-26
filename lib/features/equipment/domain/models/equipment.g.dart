// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipmentImpl _$$EquipmentImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$EquipmentImpl',
      json,
      ($checkedConvert) {
        final val = _$EquipmentImpl(
          id: $checkedConvert('id', (v) => v as String),
          ownerId: $checkedConvert('owner_id', (v) => v as String),
          ownerName: $checkedConvert('owner_name', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          category: $checkedConvert(
              'category', (v) => $enumDecode(_$EquipmentCategoryEnumMap, v)),
          location: $checkedConvert(
              'location', (v) => Location.fromJson(v as Map<String, dynamic>)),
          coordinates: $checkedConvert(
              'coordinates',
              (v) => (v as Map<String, dynamic>).map(
                    (k, e) => MapEntry(k, (e as num).toDouble()),
                  )),
          dailyRate:
              $checkedConvert('daily_rate', (v) => (v as num).toDouble()),
          images: $checkedConvert('images',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          isAvailable:
              $checkedConvert('is_available', (v) => v as bool? ?? true),
          isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
          features: $checkedConvert(
              'features',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          requirements: $checkedConvert(
              'requirements',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          tags: $checkedConvert(
              'tags',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          rating:
              $checkedConvert('rating', (v) => (v as num?)?.toDouble() ?? 0.0),
          reviewCount:
              $checkedConvert('review_count', (v) => (v as num?)?.toInt() ?? 0),
          metadata: $checkedConvert(
              'metadata', (v) => v as Map<String, dynamic>? ?? const {}),
          specifications: $checkedConvert(
              'specifications', (v) => v as Map<String, dynamic>? ?? const {}),
          insurance: $checkedConvert(
              'insurance',
              (v) => v == null
                  ? null
                  : Insurance.fromJson(v as Map<String, dynamic>)),
          availability: $checkedConvert(
              'availability',
              (v) => v == null
                  ? null
                  : Availability.fromJson(v as Map<String, dynamic>)),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updated_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'ownerId': 'owner_id',
        'ownerName': 'owner_name',
        'dailyRate': 'daily_rate',
        'isAvailable': 'is_available',
        'isActive': 'is_active',
        'reviewCount': 'review_count',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$$EquipmentImplToJson(_$EquipmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'owner_name': instance.ownerName,
      'name': instance.name,
      'description': instance.description,
      'category': _$EquipmentCategoryEnumMap[instance.category]!,
      'location': instance.location.toJson(),
      'coordinates': instance.coordinates,
      'daily_rate': instance.dailyRate,
      'images': instance.images,
      'is_available': instance.isAvailable,
      'is_active': instance.isActive,
      'features': instance.features,
      'requirements': instance.requirements,
      'tags': instance.tags,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'metadata': instance.metadata,
      'specifications': instance.specifications,
      'insurance': instance.insurance?.toJson(),
      'availability': instance.availability?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$EquipmentCategoryEnumMap = {
  EquipmentCategory.photography: 'photography',
  EquipmentCategory.videography: 'videography',
  EquipmentCategory.audio: 'audio',
  EquipmentCategory.lighting: 'lighting',
  EquipmentCategory.drones: 'drones',
  EquipmentCategory.construction: 'construction',
  EquipmentCategory.tools: 'tools',
  EquipmentCategory.sports: 'sports',
  EquipmentCategory.music: 'music',
  EquipmentCategory.other: 'other',
};

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
          country: $checkedConvert('country', (v) => v as String?),
          postalCode: $checkedConvert('postal_code', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'postalCode': 'postal_code'},
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postal_code': instance.postalCode,
    };

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
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => DateTime.parse(e as String))
                      .toList() ??
                  const []),
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

_$InsuranceImpl _$$InsuranceImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$InsuranceImpl',
      json,
      ($checkedConvert) {
        final val = _$InsuranceImpl(
          isRequired: $checkedConvert('is_required', (v) => v as bool),
          coverage: $checkedConvert('coverage', (v) => (v as num).toDouble()),
          deductible:
              $checkedConvert('deductible', (v) => (v as num).toDouble()),
          provider: $checkedConvert('provider', (v) => v as String?),
          policyNumber: $checkedConvert('policy_number', (v) => v as String?),
          expiryDate: $checkedConvert('expiry_date',
              (v) => v == null ? null : DateTime.parse(v as String)),
          terms: $checkedConvert(
              'terms', (v) => v as Map<String, dynamic>? ?? const {}),
        );
        return val;
      },
      fieldKeyMap: const {
        'isRequired': 'is_required',
        'policyNumber': 'policy_number',
        'expiryDate': 'expiry_date'
      },
    );

Map<String, dynamic> _$$InsuranceImplToJson(_$InsuranceImpl instance) =>
    <String, dynamic>{
      'is_required': instance.isRequired,
      'coverage': instance.coverage,
      'deductible': instance.deductible,
      'provider': instance.provider,
      'policy_number': instance.policyNumber,
      'expiry_date': instance.expiryDate?.toIso8601String(),
      'terms': instance.terms,
    };
