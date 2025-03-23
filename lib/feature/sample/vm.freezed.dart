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
mixin _$SampleScreenState {
  List<SampleEntity>? get sampleEntity => throw _privateConstructorUsedError;

  /// Create a copy of SampleScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleScreenStateCopyWith<SampleScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleScreenStateCopyWith<$Res> {
  factory $SampleScreenStateCopyWith(
          SampleScreenState value, $Res Function(SampleScreenState) then) =
      _$SampleScreenStateCopyWithImpl<$Res, SampleScreenState>;
  @useResult
  $Res call({List<SampleEntity>? sampleEntity});
}

/// @nodoc
class _$SampleScreenStateCopyWithImpl<$Res, $Val extends SampleScreenState>
    implements $SampleScreenStateCopyWith<$Res> {
  _$SampleScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SampleScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleEntity = freezed,
  }) {
    return _then(_value.copyWith(
      sampleEntity: freezed == sampleEntity
          ? _value.sampleEntity
          : sampleEntity // ignore: cast_nullable_to_non_nullable
              as List<SampleEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SampleScreenStateImplCopyWith<$Res>
    implements $SampleScreenStateCopyWith<$Res> {
  factory _$$SampleScreenStateImplCopyWith(_$SampleScreenStateImpl value,
          $Res Function(_$SampleScreenStateImpl) then) =
      __$$SampleScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SampleEntity>? sampleEntity});
}

/// @nodoc
class __$$SampleScreenStateImplCopyWithImpl<$Res>
    extends _$SampleScreenStateCopyWithImpl<$Res, _$SampleScreenStateImpl>
    implements _$$SampleScreenStateImplCopyWith<$Res> {
  __$$SampleScreenStateImplCopyWithImpl(_$SampleScreenStateImpl _value,
      $Res Function(_$SampleScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SampleScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleEntity = freezed,
  }) {
    return _then(_$SampleScreenStateImpl(
      sampleEntity: freezed == sampleEntity
          ? _value._sampleEntity
          : sampleEntity // ignore: cast_nullable_to_non_nullable
              as List<SampleEntity>?,
    ));
  }
}

/// @nodoc

class _$SampleScreenStateImpl implements _SampleScreenState {
  const _$SampleScreenStateImpl(
      {required final List<SampleEntity>? sampleEntity})
      : _sampleEntity = sampleEntity;

  final List<SampleEntity>? _sampleEntity;
  @override
  List<SampleEntity>? get sampleEntity {
    final value = _sampleEntity;
    if (value == null) return null;
    if (_sampleEntity is EqualUnmodifiableListView) return _sampleEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SampleScreenState(sampleEntity: $sampleEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._sampleEntity, _sampleEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_sampleEntity));

  /// Create a copy of SampleScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleScreenStateImplCopyWith<_$SampleScreenStateImpl> get copyWith =>
      __$$SampleScreenStateImplCopyWithImpl<_$SampleScreenStateImpl>(
          this, _$identity);
}

abstract class _SampleScreenState implements SampleScreenState {
  const factory _SampleScreenState(
          {required final List<SampleEntity>? sampleEntity}) =
      _$SampleScreenStateImpl;

  @override
  List<SampleEntity>? get sampleEntity;

  /// Create a copy of SampleScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleScreenStateImplCopyWith<_$SampleScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
