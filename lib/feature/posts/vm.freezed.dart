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
mixin _$PostsScreenState {
  List<PostEntity>? get postEntity => throw _privateConstructorUsedError;

  /// Create a copy of PostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsScreenStateCopyWith<PostsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsScreenStateCopyWith<$Res> {
  factory $PostsScreenStateCopyWith(
          PostsScreenState value, $Res Function(PostsScreenState) then) =
      _$PostsScreenStateCopyWithImpl<$Res, PostsScreenState>;
  @useResult
  $Res call({List<PostEntity>? postEntity});
}

/// @nodoc
class _$PostsScreenStateCopyWithImpl<$Res, $Val extends PostsScreenState>
    implements $PostsScreenStateCopyWith<$Res> {
  _$PostsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsScreenState
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
abstract class _$$PostsScreenStateImplCopyWith<$Res>
    implements $PostsScreenStateCopyWith<$Res> {
  factory _$$PostsScreenStateImplCopyWith(_$PostsScreenStateImpl value,
          $Res Function(_$PostsScreenStateImpl) then) =
      __$$PostsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PostEntity>? postEntity});
}

/// @nodoc
class __$$PostsScreenStateImplCopyWithImpl<$Res>
    extends _$PostsScreenStateCopyWithImpl<$Res, _$PostsScreenStateImpl>
    implements _$$PostsScreenStateImplCopyWith<$Res> {
  __$$PostsScreenStateImplCopyWithImpl(_$PostsScreenStateImpl _value,
      $Res Function(_$PostsScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postEntity = freezed,
  }) {
    return _then(_$PostsScreenStateImpl(
      postEntity: freezed == postEntity
          ? _value._postEntity
          : postEntity // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>?,
    ));
  }
}

/// @nodoc

@override
class _$PostsScreenStateImpl implements _PostsScreenState {
  const _$PostsScreenStateImpl({required final List<PostEntity>? postEntity})
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
    return 'PostsScreenState(postEntity: $postEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._postEntity, _postEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_postEntity));

  /// Create a copy of PostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsScreenStateImplCopyWith<_$PostsScreenStateImpl> get copyWith =>
      __$$PostsScreenStateImplCopyWithImpl<_$PostsScreenStateImpl>(
          this, _$identity);
}

abstract class _PostsScreenState implements PostsScreenState {
  const factory _PostsScreenState(
      {required final List<PostEntity>? postEntity}) = _$PostsScreenStateImpl;

  @override
  List<PostEntity>? get postEntity;

  /// Create a copy of PostsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsScreenStateImplCopyWith<_$PostsScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
