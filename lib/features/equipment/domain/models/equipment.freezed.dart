// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Equipment _$EquipmentFromJson(Map<String, dynamic> json) {
  return _Equipment.fromJson(json);
}

/// @nodoc
mixin _$Equipment {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  EquipmentCategory get category => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  Map<String, double> get coordinates => throw _privateConstructorUsedError;
  double get dailyRate => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  List<String> get requirements => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  Map<String, dynamic> get specifications => throw _privateConstructorUsedError;
  Insurance? get insurance => throw _privateConstructorUsedError;
  Availability? get availability => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Equipment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EquipmentCopyWith<Equipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentCopyWith<$Res> {
  factory $EquipmentCopyWith(Equipment value, $Res Function(Equipment) then) =
      _$EquipmentCopyWithImpl<$Res, Equipment>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String ownerName,
      String name,
      String description,
      EquipmentCategory category,
      Location location,
      Map<String, double> coordinates,
      double dailyRate,
      List<String> images,
      bool isAvailable,
      bool isActive,
      List<String> features,
      List<String> requirements,
      List<String> tags,
      double rating,
      int reviewCount,
      Map<String, dynamic> metadata,
      Map<String, dynamic> specifications,
      Insurance? insurance,
      Availability? availability,
      DateTime? createdAt,
      DateTime? updatedAt});

  $LocationCopyWith<$Res> get location;
  $InsuranceCopyWith<$Res>? get insurance;
  $AvailabilityCopyWith<$Res>? get availability;
}

/// @nodoc
class _$EquipmentCopyWithImpl<$Res, $Val extends Equipment>
    implements $EquipmentCopyWith<$Res> {
  _$EquipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? ownerName = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? location = null,
    Object? coordinates = null,
    Object? dailyRate = null,
    Object? images = null,
    Object? isAvailable = null,
    Object? isActive = null,
    Object? features = null,
    Object? requirements = null,
    Object? tags = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? metadata = null,
    Object? specifications = null,
    Object? insurance = freezed,
    Object? availability = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EquipmentCategory,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      dailyRate: null == dailyRate
          ? _value.dailyRate
          : dailyRate // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      specifications: null == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as Insurance?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Availability?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InsuranceCopyWith<$Res>? get insurance {
    if (_value.insurance == null) {
      return null;
    }

    return $InsuranceCopyWith<$Res>(_value.insurance!, (value) {
      return _then(_value.copyWith(insurance: value) as $Val);
    });
  }

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityCopyWith<$Res>? get availability {
    if (_value.availability == null) {
      return null;
    }

    return $AvailabilityCopyWith<$Res>(_value.availability!, (value) {
      return _then(_value.copyWith(availability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EquipmentImplCopyWith<$Res>
    implements $EquipmentCopyWith<$Res> {
  factory _$$EquipmentImplCopyWith(
          _$EquipmentImpl value, $Res Function(_$EquipmentImpl) then) =
      __$$EquipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String ownerName,
      String name,
      String description,
      EquipmentCategory category,
      Location location,
      Map<String, double> coordinates,
      double dailyRate,
      List<String> images,
      bool isAvailable,
      bool isActive,
      List<String> features,
      List<String> requirements,
      List<String> tags,
      double rating,
      int reviewCount,
      Map<String, dynamic> metadata,
      Map<String, dynamic> specifications,
      Insurance? insurance,
      Availability? availability,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $LocationCopyWith<$Res> get location;
  @override
  $InsuranceCopyWith<$Res>? get insurance;
  @override
  $AvailabilityCopyWith<$Res>? get availability;
}

/// @nodoc
class __$$EquipmentImplCopyWithImpl<$Res>
    extends _$EquipmentCopyWithImpl<$Res, _$EquipmentImpl>
    implements _$$EquipmentImplCopyWith<$Res> {
  __$$EquipmentImplCopyWithImpl(
      _$EquipmentImpl _value, $Res Function(_$EquipmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? ownerName = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? location = null,
    Object? coordinates = null,
    Object? dailyRate = null,
    Object? images = null,
    Object? isAvailable = null,
    Object? isActive = null,
    Object? features = null,
    Object? requirements = null,
    Object? tags = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? metadata = null,
    Object? specifications = null,
    Object? insurance = freezed,
    Object? availability = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EquipmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EquipmentCategory,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      dailyRate: null == dailyRate
          ? _value.dailyRate
          : dailyRate // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requirements: null == requirements
          ? _value._requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      specifications: null == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as Insurance?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Availability?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentImpl implements _Equipment {
  const _$EquipmentImpl(
      {required this.id,
      required this.ownerId,
      required this.ownerName,
      required this.name,
      required this.description,
      required this.category,
      required this.location,
      required final Map<String, double> coordinates,
      required this.dailyRate,
      required final List<String> images,
      this.isAvailable = true,
      this.isActive = true,
      final List<String> features = const [],
      final List<String> requirements = const [],
      final List<String> tags = const [],
      this.rating = 0.0,
      this.reviewCount = 0,
      final Map<String, dynamic> metadata = const {},
      final Map<String, dynamic> specifications = const {},
      this.insurance,
      this.availability,
      this.createdAt,
      this.updatedAt})
      : _coordinates = coordinates,
        _images = images,
        _features = features,
        _requirements = requirements,
        _tags = tags,
        _metadata = metadata,
        _specifications = specifications;

  factory _$EquipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipmentImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String ownerName;
  @override
  final String name;
  @override
  final String description;
  @override
  final EquipmentCategory category;
  @override
  final Location location;
  final Map<String, double> _coordinates;
  @override
  Map<String, double> get coordinates {
    if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_coordinates);
  }

  @override
  final double dailyRate;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final bool isActive;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  final List<String> _requirements;
  @override
  @JsonKey()
  List<String> get requirements {
    if (_requirements is EqualUnmodifiableListView) return _requirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requirements);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  final Map<String, dynamic> _specifications;
  @override
  @JsonKey()
  Map<String, dynamic> get specifications {
    if (_specifications is EqualUnmodifiableMapView) return _specifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_specifications);
  }

  @override
  final Insurance? insurance;
  @override
  final Availability? availability;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Equipment(id: $id, ownerId: $ownerId, ownerName: $ownerName, name: $name, description: $description, category: $category, location: $location, coordinates: $coordinates, dailyRate: $dailyRate, images: $images, isAvailable: $isAvailable, isActive: $isActive, features: $features, requirements: $requirements, tags: $tags, rating: $rating, reviewCount: $reviewCount, metadata: $metadata, specifications: $specifications, insurance: $insurance, availability: $availability, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EquipmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.dailyRate, dailyRate) ||
                other.dailyRate == dailyRate) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality()
                .equals(other._requirements, _requirements) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        ownerId,
        ownerName,
        name,
        description,
        category,
        location,
        const DeepCollectionEquality().hash(_coordinates),
        dailyRate,
        const DeepCollectionEquality().hash(_images),
        isAvailable,
        isActive,
        const DeepCollectionEquality().hash(_features),
        const DeepCollectionEquality().hash(_requirements),
        const DeepCollectionEquality().hash(_tags),
        rating,
        reviewCount,
        const DeepCollectionEquality().hash(_metadata),
        const DeepCollectionEquality().hash(_specifications),
        insurance,
        availability,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentImplCopyWith<_$EquipmentImpl> get copyWith =>
      __$$EquipmentImplCopyWithImpl<_$EquipmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentImplToJson(
      this,
    );
  }
}

abstract class _Equipment implements Equipment {
  const factory _Equipment(
      {required final String id,
      required final String ownerId,
      required final String ownerName,
      required final String name,
      required final String description,
      required final EquipmentCategory category,
      required final Location location,
      required final Map<String, double> coordinates,
      required final double dailyRate,
      required final List<String> images,
      final bool isAvailable,
      final bool isActive,
      final List<String> features,
      final List<String> requirements,
      final List<String> tags,
      final double rating,
      final int reviewCount,
      final Map<String, dynamic> metadata,
      final Map<String, dynamic> specifications,
      final Insurance? insurance,
      final Availability? availability,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$EquipmentImpl;

  factory _Equipment.fromJson(Map<String, dynamic> json) =
      _$EquipmentImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get ownerName;
  @override
  String get name;
  @override
  String get description;
  @override
  EquipmentCategory get category;
  @override
  Location get location;
  @override
  Map<String, double> get coordinates;
  @override
  double get dailyRate;
  @override
  List<String> get images;
  @override
  bool get isAvailable;
  @override
  bool get isActive;
  @override
  List<String> get features;
  @override
  List<String> get requirements;
  @override
  List<String> get tags;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  Map<String, dynamic> get metadata;
  @override
  Map<String, dynamic> get specifications;
  @override
  Insurance? get insurance;
  @override
  Availability? get availability;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Equipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EquipmentImplCopyWith<_$EquipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String address,
      String? city,
      String? state,
      String? country,
      String? postalCode});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String address,
      String? city,
      String? state,
      String? country,
      String? postalCode});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_$LocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {required this.latitude,
      required this.longitude,
      required this.address,
      this.city,
      this.state,
      this.country,
      this.postalCode});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? postalCode;

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude, address: $address, city: $city, state: $state, country: $country, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, state, country, postalCode);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final double latitude,
      required final double longitude,
      required final String address,
      final String? city,
      final String? state,
      final String? country,
      final String? postalCode}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get address;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get postalCode;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
      final List<DateTime> unavailableDates = const [],
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
  @JsonKey()
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
      final List<DateTime> unavailableDates,
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

Insurance _$InsuranceFromJson(Map<String, dynamic> json) {
  return _Insurance.fromJson(json);
}

/// @nodoc
mixin _$Insurance {
  bool get isRequired => throw _privateConstructorUsedError;
  double get coverage => throw _privateConstructorUsedError;
  double get deductible => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get policyNumber => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  Map<String, dynamic> get terms => throw _privateConstructorUsedError;

  /// Serializes this Insurance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Insurance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsuranceCopyWith<Insurance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsuranceCopyWith<$Res> {
  factory $InsuranceCopyWith(Insurance value, $Res Function(Insurance) then) =
      _$InsuranceCopyWithImpl<$Res, Insurance>;
  @useResult
  $Res call(
      {bool isRequired,
      double coverage,
      double deductible,
      String? provider,
      String? policyNumber,
      DateTime? expiryDate,
      Map<String, dynamic> terms});
}

/// @nodoc
class _$InsuranceCopyWithImpl<$Res, $Val extends Insurance>
    implements $InsuranceCopyWith<$Res> {
  _$InsuranceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Insurance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRequired = null,
    Object? coverage = null,
    Object? deductible = null,
    Object? provider = freezed,
    Object? policyNumber = freezed,
    Object? expiryDate = freezed,
    Object? terms = null,
  }) {
    return _then(_value.copyWith(
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      coverage: null == coverage
          ? _value.coverage
          : coverage // ignore: cast_nullable_to_non_nullable
              as double,
      deductible: null == deductible
          ? _value.deductible
          : deductible // ignore: cast_nullable_to_non_nullable
              as double,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      policyNumber: freezed == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terms: null == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsuranceImplCopyWith<$Res>
    implements $InsuranceCopyWith<$Res> {
  factory _$$InsuranceImplCopyWith(
          _$InsuranceImpl value, $Res Function(_$InsuranceImpl) then) =
      __$$InsuranceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isRequired,
      double coverage,
      double deductible,
      String? provider,
      String? policyNumber,
      DateTime? expiryDate,
      Map<String, dynamic> terms});
}

/// @nodoc
class __$$InsuranceImplCopyWithImpl<$Res>
    extends _$InsuranceCopyWithImpl<$Res, _$InsuranceImpl>
    implements _$$InsuranceImplCopyWith<$Res> {
  __$$InsuranceImplCopyWithImpl(
      _$InsuranceImpl _value, $Res Function(_$InsuranceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Insurance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRequired = null,
    Object? coverage = null,
    Object? deductible = null,
    Object? provider = freezed,
    Object? policyNumber = freezed,
    Object? expiryDate = freezed,
    Object? terms = null,
  }) {
    return _then(_$InsuranceImpl(
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      coverage: null == coverage
          ? _value.coverage
          : coverage // ignore: cast_nullable_to_non_nullable
              as double,
      deductible: null == deductible
          ? _value.deductible
          : deductible // ignore: cast_nullable_to_non_nullable
              as double,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      policyNumber: freezed == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terms: null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsuranceImpl implements _Insurance {
  const _$InsuranceImpl(
      {required this.isRequired,
      required this.coverage,
      required this.deductible,
      this.provider,
      this.policyNumber,
      this.expiryDate,
      final Map<String, dynamic> terms = const {}})
      : _terms = terms;

  factory _$InsuranceImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsuranceImplFromJson(json);

  @override
  final bool isRequired;
  @override
  final double coverage;
  @override
  final double deductible;
  @override
  final String? provider;
  @override
  final String? policyNumber;
  @override
  final DateTime? expiryDate;
  final Map<String, dynamic> _terms;
  @override
  @JsonKey()
  Map<String, dynamic> get terms {
    if (_terms is EqualUnmodifiableMapView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_terms);
  }

  @override
  String toString() {
    return 'Insurance(isRequired: $isRequired, coverage: $coverage, deductible: $deductible, provider: $provider, policyNumber: $policyNumber, expiryDate: $expiryDate, terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsuranceImpl &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.coverage, coverage) ||
                other.coverage == coverage) &&
            (identical(other.deductible, deductible) ||
                other.deductible == deductible) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.policyNumber, policyNumber) ||
                other.policyNumber == policyNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isRequired,
      coverage,
      deductible,
      provider,
      policyNumber,
      expiryDate,
      const DeepCollectionEquality().hash(_terms));

  /// Create a copy of Insurance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsuranceImplCopyWith<_$InsuranceImpl> get copyWith =>
      __$$InsuranceImplCopyWithImpl<_$InsuranceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsuranceImplToJson(
      this,
    );
  }
}

abstract class _Insurance implements Insurance {
  const factory _Insurance(
      {required final bool isRequired,
      required final double coverage,
      required final double deductible,
      final String? provider,
      final String? policyNumber,
      final DateTime? expiryDate,
      final Map<String, dynamic> terms}) = _$InsuranceImpl;

  factory _Insurance.fromJson(Map<String, dynamic> json) =
      _$InsuranceImpl.fromJson;

  @override
  bool get isRequired;
  @override
  double get coverage;
  @override
  double get deductible;
  @override
  String? get provider;
  @override
  String? get policyNumber;
  @override
  DateTime? get expiryDate;
  @override
  Map<String, dynamic> get terms;

  /// Create a copy of Insurance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsuranceImplCopyWith<_$InsuranceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
