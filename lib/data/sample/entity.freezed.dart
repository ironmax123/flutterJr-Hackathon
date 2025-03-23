// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SampleEntity _$SampleEntityFromJson(Map<String, dynamic> json) {
  return _SampleEntity.fromJson(json);
}

/// @nodoc
mixin _$SampleEntity {
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this SampleEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SampleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleEntityCopyWith<SampleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleEntityCopyWith<$Res> {
  factory $SampleEntityCopyWith(
          SampleEntity value, $Res Function(SampleEntity) then) =
      _$SampleEntityCopyWithImpl<$Res, SampleEntity>;
  @useResult
  $Res call({String postId, String userId, String? imageUrl});
}

/// @nodoc
class _$SampleEntityCopyWithImpl<$Res, $Val extends SampleEntity>
    implements $SampleEntityCopyWith<$Res> {
  _$SampleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SampleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? userId = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SampleEntityImplCopyWith<$Res>
    implements $SampleEntityCopyWith<$Res> {
  factory _$$SampleEntityImplCopyWith(
          _$SampleEntityImpl value, $Res Function(_$SampleEntityImpl) then) =
      __$$SampleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postId, String userId, String? imageUrl});
}

/// @nodoc
class __$$SampleEntityImplCopyWithImpl<$Res>
    extends _$SampleEntityCopyWithImpl<$Res, _$SampleEntityImpl>
    implements _$$SampleEntityImplCopyWith<$Res> {
  __$$SampleEntityImplCopyWithImpl(
      _$SampleEntityImpl _value, $Res Function(_$SampleEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SampleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? userId = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$SampleEntityImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleEntityImpl implements _SampleEntity {
  const _$SampleEntityImpl(
      {required this.postId, required this.userId, required this.imageUrl});

  factory _$SampleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleEntityImplFromJson(json);

  @override
  final String postId;
  @override
  final String userId;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'SampleEntity(postId: $postId, userId: $userId, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleEntityImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postId, userId, imageUrl);

  /// Create a copy of SampleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleEntityImplCopyWith<_$SampleEntityImpl> get copyWith =>
      __$$SampleEntityImplCopyWithImpl<_$SampleEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleEntityImplToJson(
      this,
    );
  }
}

abstract class _SampleEntity implements SampleEntity {
  const factory _SampleEntity(
      {required final String postId,
      required final String userId,
      required final String? imageUrl}) = _$SampleEntityImpl;

  factory _SampleEntity.fromJson(Map<String, dynamic> json) =
      _$SampleEntityImpl.fromJson;

  @override
  String get postId;
  @override
  String get userId;
  @override
  String? get imageUrl;

  /// Create a copy of SampleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleEntityImplCopyWith<_$SampleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
