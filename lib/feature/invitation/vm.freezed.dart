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
mixin _$InvitationState {
  UserEntity? get userEntity => throw _privateConstructorUsedError;

  /// Create a copy of InvitationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvitationStateCopyWith<InvitationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationStateCopyWith<$Res> {
  factory $InvitationStateCopyWith(
          InvitationState value, $Res Function(InvitationState) then) =
      _$InvitationStateCopyWithImpl<$Res, InvitationState>;
  @useResult
  $Res call({UserEntity? userEntity});

  $UserEntityCopyWith<$Res>? get userEntity;
}

/// @nodoc
class _$InvitationStateCopyWithImpl<$Res, $Val extends InvitationState>
    implements $InvitationStateCopyWith<$Res> {
  _$InvitationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvitationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntity = freezed,
  }) {
    return _then(_value.copyWith(
      userEntity: freezed == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ) as $Val);
  }

  /// Create a copy of InvitationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get userEntity {
    if (_value.userEntity == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.userEntity!, (value) {
      return _then(_value.copyWith(userEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvitationStateImplCopyWith<$Res>
    implements $InvitationStateCopyWith<$Res> {
  factory _$$InvitationStateImplCopyWith(_$InvitationStateImpl value,
          $Res Function(_$InvitationStateImpl) then) =
      __$$InvitationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserEntity? userEntity});

  @override
  $UserEntityCopyWith<$Res>? get userEntity;
}

/// @nodoc
class __$$InvitationStateImplCopyWithImpl<$Res>
    extends _$InvitationStateCopyWithImpl<$Res, _$InvitationStateImpl>
    implements _$$InvitationStateImplCopyWith<$Res> {
  __$$InvitationStateImplCopyWithImpl(
      _$InvitationStateImpl _value, $Res Function(_$InvitationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvitationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntity = freezed,
  }) {
    return _then(_$InvitationStateImpl(
      userEntity: freezed == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }
}

/// @nodoc

class _$InvitationStateImpl implements _InvitationState {
  const _$InvitationStateImpl({required this.userEntity});

  @override
  final UserEntity? userEntity;

  @override
  String toString() {
    return 'InvitationState(userEntity: $userEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationStateImpl &&
            (identical(other.userEntity, userEntity) ||
                other.userEntity == userEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userEntity);

  /// Create a copy of InvitationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationStateImplCopyWith<_$InvitationStateImpl> get copyWith =>
      __$$InvitationStateImplCopyWithImpl<_$InvitationStateImpl>(
          this, _$identity);
}

abstract class _InvitationState implements InvitationState {
  const factory _InvitationState({required final UserEntity? userEntity}) =
      _$InvitationStateImpl;

  @override
  UserEntity? get userEntity;

  /// Create a copy of InvitationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvitationStateImplCopyWith<_$InvitationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
