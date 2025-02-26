// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Availability _$AvailabilityFromJson(Map<String, dynamic> json) {
  return _Availability.fromJson(json);
}

/// @nodoc
mixin _$Availability {
  DateTime get availableFrom => throw _privateConstructorUsedError;
  DateTime get availableTo => throw _privateConstructorUsedError;
  List<DateTime> get unavailableDates => throw _privateConstructorUsedError;
  int get minimumRentalDays => throw _privateConstructorUsedError;
  int get maximumRentalDays => throw _privateConstructorUsedError;
  List<String> get unavailableDaysOfWeek => throw _privateConstructorUsedError;
  Map<String, dynamic> get seasonalPricing =>
      throw _privateConstructorUsedError;
  String? get advanceNotice => throw _privateConstructorUsedError;
  bool get autoApprove => throw _privateConstructorUsedError;

  /// Serializes this Availability to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityCopyWith<Availability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityCopyWith<$Res> {
  factory $AvailabilityCopyWith(
          Availability value, $Res Function(Availability) then) =
      _$AvailabilityCopyWithImpl<$Res, Availability>;
  @useResult
  $Res call(
      {DateTime availableFrom,
      DateTime availableTo,
      List<DateTime> unavailableDates,
      int minimumRentalDays,
      int maximumRentalDays,
      List<String> unavailableDaysOfWeek,
      Map<String, dynamic> seasonalPricing,
      String? advanceNotice,
      bool autoApprove});
}

/// @nodoc
class _$AvailabilityCopyWithImpl<$Res, $Val extends Availability>
    implements $AvailabilityCopyWith<$Res> {
  _$AvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableFrom = null,
    Object? availableTo = null,
    Object? unavailableDates = null,
    Object? minimumRentalDays = null,
    Object? maximumRentalDays = null,
    Object? unavailableDaysOfWeek = null,
    Object? seasonalPricing = null,
    Object? advanceNotice = freezed,
    Object? autoApprove = null,
  }) {
    return _then(_value.copyWith(
      availableFrom: null == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      availableTo: null == availableTo
          ? _value.availableTo
          : availableTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unavailableDates: null == unavailableDates
          ? _value.unavailableDates
          : unavailableDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      minimumRentalDays: null == minimumRentalDays
          ? _value.minimumRentalDays
          : minimumRentalDays // ignore: cast_nullable_to_non_nullable
              as int,
      maximumRentalDays: null == maximumRentalDays
          ? _value.maximumRentalDays
          : maximumRentalDays // ignore: cast_nullable_to_non_nullable
              as int,
      unavailableDaysOfWeek: null == unavailableDaysOfWeek
          ? _value.unavailableDaysOfWeek
          : unavailableDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seasonalPricing: null == seasonalPricing
          ? _value.seasonalPricing
          : seasonalPricing // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      advanceNotice: freezed == advanceNotice
          ? _value.advanceNotice
          : advanceNotice // ignore: cast_nullable_to_non_nullable
              as String?,
      autoApprove: null == autoApprove
          ? _value.autoApprove
          : autoApprove // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilityImplCopyWith<$Res>
    implements $AvailabilityCopyWith<$Res> {
  factory _$$AvailabilityImplCopyWith(
          _$AvailabilityImpl value, $Res Function(_$AvailabilityImpl) then) =
      __$$AvailabilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime availableFrom,
      DateTime availableTo,
      List<DateTime> unavailableDates,
      int minimumRentalDays,
      int maximumRentalDays,
      List<String> unavailableDaysOfWeek,
      Map<String, dynamic> seasonalPricing,
      String? advanceNotice,
      bool autoApprove});
}

/// @nodoc
class __$$AvailabilityImplCopyWithImpl<$Res>
    extends _$AvailabilityCopyWithImpl<$Res, _$AvailabilityImpl>
    implements _$$AvailabilityImplCopyWith<$Res> {
  __$$AvailabilityImplCopyWithImpl(
      _$AvailabilityImpl _value, $Res Function(_$AvailabilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableFrom = null,
    Object? availableTo = null,
    Object? unavailableDates = null,
    Object? minimumRentalDays = null,
    Object? maximumRentalDays = null,
    Object? unavailableDaysOfWeek = null,
    Object? seasonalPricing = null,
    Object? advanceNotice = freezed,
    Object? autoApprove = null,
  }) {
    return _then(_$AvailabilityImpl(
      availableFrom: null == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      availableTo: null == availableTo
          ? _value.availableTo
          : availableTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unavailableDates: null == unavailableDates
          ? _value._unavailableDates
          : unavailableDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      minimumRentalDays: null == minimumRentalDays
          ? _value.minimumRentalDays
          : minimumRentalDays // ignore: cast_nullable_to_non_nullable
              as int,
      maximumRentalDays: null == maximumRentalDays
          ? _value.maximumRentalDays
          : maximumRentalDays // ignore: cast_nullable_to_non_nullable
              as int,
      unavailableDaysOfWeek: null == unavailableDaysOfWeek
          ? _value._unavailableDaysOfWeek
          : unavailableDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seasonalPricing: null == seasonalPricing
          ? _value._seasonalPricing
          : seasonalPricing // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      advanceNotice: freezed == advanceNotice
          ? _value.advanceNotice
          : advanceNotice // ignore: cast_nullable_to_non_nullable
              as String?,
      autoApprove: null == autoApprove
          ? _value.autoApprove
          : autoApprove // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailabilityImpl implements _Availability {
  const _$AvailabilityImpl(
      {required this.availableFrom,
      required this.availableTo,
      required final List<DateTime> unavailableDates,
      this.minimumRentalDays = 1,
      this.maximumRentalDays = 30,
      final List<String> unavailableDaysOfWeek = const [],
      final Map<String, dynamic> seasonalPricing = const {},
      this.advanceNotice,
      this.autoApprove = true})
      : _unavailableDates = unavailableDates,
        _unavailableDaysOfWeek = unavailableDaysOfWeek,
        _seasonalPricing = seasonalPricing;

  factory _$AvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityImplFromJson(json);

  @override
  final DateTime availableFrom;
  @override
  final DateTime availableTo;
  final List<DateTime> _unavailableDates;
  @override
  List<DateTime> get unavailableDates {
    if (_unavailableDates is EqualUnmodifiableListView)
      return _unavailableDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unavailableDates);
  }

  @override
  @JsonKey()
  final int minimumRentalDays;
  @override
  @JsonKey()
  final int maximumRentalDays;
  final List<String> _unavailableDaysOfWeek;
  @override
  @JsonKey()
  List<String> get unavailableDaysOfWeek {
    if (_unavailableDaysOfWeek is EqualUnmodifiableListView)
      return _unavailableDaysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unavailableDaysOfWeek);
  }

  final Map<String, dynamic> _seasonalPricing;
  @override
  @JsonKey()
  Map<String, dynamic> get seasonalPricing {
    if (_seasonalPricing is EqualUnmodifiableMapView) return _seasonalPricing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_seasonalPricing);
  }

  @override
  final String? advanceNotice;
  @override
  @JsonKey()
  final bool autoApprove;

  @override
  String toString() {
    return 'Availability(availableFrom: $availableFrom, availableTo: $availableTo, unavailableDates: $unavailableDates, minimumRentalDays: $minimumRentalDays, maximumRentalDays: $maximumRentalDays, unavailableDaysOfWeek: $unavailableDaysOfWeek, seasonalPricing: $seasonalPricing, advanceNotice: $advanceNotice, autoApprove: $autoApprove)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityImpl &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom) &&
            (identical(other.availableTo, availableTo) ||
                other.availableTo == availableTo) &&
            const DeepCollectionEquality()
                .equals(other._unavailableDates, _unavailableDates) &&
            (identical(other.minimumRentalDays, minimumRentalDays) ||
                other.minimumRentalDays == minimumRentalDays) &&
            (identical(other.maximumRentalDays, maximumRentalDays) ||
                other.maximumRentalDays == maximumRentalDays) &&
            const DeepCollectionEquality()
                .equals(other._unavailableDaysOfWeek, _unavailableDaysOfWeek) &&
            const DeepCollectionEquality()
                .equals(other._seasonalPricing, _seasonalPricing) &&
            (identical(other.advanceNotice, advanceNotice) ||
                other.advanceNotice == advanceNotice) &&
            (identical(other.autoApprove, autoApprove) ||
                other.autoApprove == autoApprove));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      availableFrom,
      availableTo,
      const DeepCollectionEquality().hash(_unavailableDates),
      minimumRentalDays,
      maximumRentalDays,
      const DeepCollectionEquality().hash(_unavailableDaysOfWeek),
      const DeepCollectionEquality().hash(_seasonalPricing),
      advanceNotice,
      autoApprove);

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityImplCopyWith<_$AvailabilityImpl> get copyWith =>
      __$$AvailabilityImplCopyWithImpl<_$AvailabilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityImplToJson(
      this,
    );
  }
}

abstract class _Availability implements Availability {
  const factory _Availability(
      {required final DateTime availableFrom,
      required final DateTime availableTo,
      required final List<DateTime> unavailableDates,
      final int minimumRentalDays,
      final int maximumRentalDays,
      final List<String> unavailableDaysOfWeek,
      final Map<String, dynamic> seasonalPricing,
      final String? advanceNotice,
      final bool autoApprove}) = _$AvailabilityImpl;

  factory _Availability.fromJson(Map<String, dynamic> json) =
      _$AvailabilityImpl.fromJson;

  @override
  DateTime get availableFrom;
  @override
  DateTime get availableTo;
  @override
  List<DateTime> get unavailableDates;
  @override
  int get minimumRentalDays;
  @override
  int get maximumRentalDays;
  @override
  List<String> get unavailableDaysOfWeek;
  @override
  Map<String, dynamic> get seasonalPricing;
  @override
  String? get advanceNotice;
  @override
  bool get autoApprove;

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityImplCopyWith<_$AvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
