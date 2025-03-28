// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserPostsScreenState {
  List<PostEntity>? get postEntity => throw _privateConstructorUsedError;

  /// Create a copy of UserPostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPostsScreenStateCopyWith<UserPostsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostsScreenStateCopyWith<$Res> {
  factory $UserPostsScreenStateCopyWith(UserPostsScreenState value,
          $Res Function(UserPostsScreenState) then) =
      _$UserPostsScreenStateCopyWithImpl<$Res, UserPostsScreenState>;
  @useResult
  $Res call({List<PostEntity>? postEntity});
}

/// @nodoc
class _$UserPostsScreenStateCopyWithImpl<$Res,
        $Val extends UserPostsScreenState>
    implements $UserPostsScreenStateCopyWith<$Res> {
  _$UserPostsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postEntity = freezed,
  }) {
    return _then(_value.copyWith(
      postEntity: freezed == postEntity
          ? _value.postEntity
          : postEntity // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPostsScreenStateImplCopyWith<$Res>
    implements $UserPostsScreenStateCopyWith<$Res> {
  factory _$$UserPostsScreenStateImplCopyWith(_$UserPostsScreenStateImpl value,
          $Res Function(_$UserPostsScreenStateImpl) then) =
      __$$UserPostsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PostEntity>? postEntity});
}

/// @nodoc
class __$$UserPostsScreenStateImplCopyWithImpl<$Res>
    extends _$UserPostsScreenStateCopyWithImpl<$Res, _$UserPostsScreenStateImpl>
    implements _$$UserPostsScreenStateImplCopyWith<$Res> {
  __$$UserPostsScreenStateImplCopyWithImpl(_$UserPostsScreenStateImpl _value,
      $Res Function(_$UserPostsScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postEntity = freezed,
  }) {
    return _then(_$UserPostsScreenStateImpl(
      postEntity: freezed == postEntity
          ? _value._postEntity
          : postEntity // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>?,
    ));
  }
}

/// @nodoc

@override
class _$UserPostsScreenStateImpl implements _UserPostsScreenState {
  const _$UserPostsScreenStateImpl(
      {required final List<PostEntity>? postEntity})
      : _postEntity = postEntity;

  final List<PostEntity>? _postEntity;
  @override
  List<PostEntity>? get postEntity {
    final value = _postEntity;
    if (value == null) return null;
    if (_postEntity is EqualUnmodifiableListView) return _postEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserPostsScreenState(postEntity: $postEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPostsScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._postEntity, _postEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_postEntity));

  /// Create a copy of UserPostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPostsScreenStateImplCopyWith<_$UserPostsScreenStateImpl>
      get copyWith =>
          __$$UserPostsScreenStateImplCopyWithImpl<_$UserPostsScreenStateImpl>(
              this, _$identity);
}

abstract class _UserPostsScreenState implements UserPostsScreenState {
  const factory _UserPostsScreenState(
          {required final List<PostEntity>? postEntity}) =
      _$UserPostsScreenStateImpl;

  @override
  List<PostEntity>? get postEntity;

  /// Create a copy of UserPostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPostsScreenStateImplCopyWith<_$UserPostsScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserInfoState {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoStateCopyWith<UserInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoStateCopyWith<$Res> {
  factory $UserInfoStateCopyWith(
          UserInfoState value, $Res Function(UserInfoState) then) =
      _$UserInfoStateCopyWithImpl<$Res, UserInfoState>;
  @useResult
  $Res call({String? imageUrl, String? userName});
}

/// @nodoc
class _$UserInfoStateCopyWithImpl<$Res, $Val extends UserInfoState>
    implements $UserInfoStateCopyWith<$Res> {
  _$UserInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoStateImplCopyWith<$Res>
    implements $UserInfoStateCopyWith<$Res> {
  factory _$$UserInfoStateImplCopyWith(
          _$UserInfoStateImpl value, $Res Function(_$UserInfoStateImpl) then) =
      __$$UserInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageUrl, String? userName});
}

/// @nodoc
class __$$UserInfoStateImplCopyWithImpl<$Res>
    extends _$UserInfoStateCopyWithImpl<$Res, _$UserInfoStateImpl>
    implements _$$UserInfoStateImplCopyWith<$Res> {
  __$$UserInfoStateImplCopyWithImpl(
      _$UserInfoStateImpl _value, $Res Function(_$UserInfoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$UserInfoStateImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserInfoStateImpl implements _UserInfoState {
  const _$UserInfoStateImpl({required this.imageUrl, required this.userName});

  @override
  final String? imageUrl;
  @override
  final String? userName;

  @override
  String toString() {
    return 'UserInfoState(imageUrl: $imageUrl, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoStateImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, userName);

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoStateImplCopyWith<_$UserInfoStateImpl> get copyWith =>
      __$$UserInfoStateImplCopyWithImpl<_$UserInfoStateImpl>(this, _$identity);
}

abstract class _UserInfoState implements UserInfoState {
  const factory _UserInfoState(
      {required final String? imageUrl,
      required final String? userName}) = _$UserInfoStateImpl;

  @override
  String? get imageUrl;
  @override
  String? get userName;

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoStateImplCopyWith<_$UserInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
