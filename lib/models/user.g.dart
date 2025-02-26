// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
      json,
      ($checkedConvert) {
        final val = User(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          phone: $checkedConvert('phone', (v) => v as String),
          isVerified: $checkedConvert('is_verified', (v) => v as bool),
          ratings: $checkedConvert('ratings', (v) => (v as num).toDouble()),
          reviews: $checkedConvert(
              'reviews',
              (v) => (v as List<dynamic>)
                  .map((e) => Review.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'isVerified': 'is_verified'},
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'is_verified': instance.isVerified,
      'ratings': instance.ratings,
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Review',
      json,
      ($checkedConvert) {
        final val = Review(
          id: $checkedConvert('id', (v) => v as String),
          reviewerId: $checkedConvert('reviewer_id', (v) => v as String),
          revieweeId: $checkedConvert('reviewee_id', (v) => v as String),
          rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
          comment: $checkedConvert('comment', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'reviewerId': 'reviewer_id',
        'revieweeId': 'reviewee_id',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'reviewer_id': instance.reviewerId,
      'reviewee_id': instance.revieweeId,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt.toIso8601String(),
    };
