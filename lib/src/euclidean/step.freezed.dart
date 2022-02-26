// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EuclideanStepTearOff {
  const _$EuclideanStepTearOff();

  _EuclideanStep call(
      {int? q, required int a, required int x, required int y}) {
    return _EuclideanStep(
      q: q,
      a: a,
      x: x,
      y: y,
    );
  }
}

/// @nodoc
const $EuclideanStep = _$EuclideanStepTearOff();

/// @nodoc
mixin _$EuclideanStep {
  int? get q => throw _privateConstructorUsedError;
  int get a => throw _privateConstructorUsedError;
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EuclideanStepCopyWith<EuclideanStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EuclideanStepCopyWith<$Res> {
  factory $EuclideanStepCopyWith(
          EuclideanStep value, $Res Function(EuclideanStep) then) =
      _$EuclideanStepCopyWithImpl<$Res>;
  $Res call({int? q, int a, int x, int y});
}

/// @nodoc
class _$EuclideanStepCopyWithImpl<$Res>
    implements $EuclideanStepCopyWith<$Res> {
  _$EuclideanStepCopyWithImpl(this._value, this._then);

  final EuclideanStep _value;
  // ignore: unused_field
  final $Res Function(EuclideanStep) _then;

  @override
  $Res call({
    Object? q = freezed,
    Object? a = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      q: q == freezed
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as int?,
      a: a == freezed
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$EuclideanStepCopyWith<$Res>
    implements $EuclideanStepCopyWith<$Res> {
  factory _$EuclideanStepCopyWith(
          _EuclideanStep value, $Res Function(_EuclideanStep) then) =
      __$EuclideanStepCopyWithImpl<$Res>;
  @override
  $Res call({int? q, int a, int x, int y});
}

/// @nodoc
class __$EuclideanStepCopyWithImpl<$Res>
    extends _$EuclideanStepCopyWithImpl<$Res>
    implements _$EuclideanStepCopyWith<$Res> {
  __$EuclideanStepCopyWithImpl(
      _EuclideanStep _value, $Res Function(_EuclideanStep) _then)
      : super(_value, (v) => _then(v as _EuclideanStep));

  @override
  _EuclideanStep get _value => super._value as _EuclideanStep;

  @override
  $Res call({
    Object? q = freezed,
    Object? a = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_EuclideanStep(
      q: q == freezed
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as int?,
      a: a == freezed
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_EuclideanStep implements _EuclideanStep {
  const _$_EuclideanStep(
      {this.q, required this.a, required this.x, required this.y});

  @override
  final int? q;
  @override
  final int a;
  @override
  final int x;
  @override
  final int y;

  @override
  String toString() {
    return 'EuclideanStep(q: $q, a: $a, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EuclideanStep &&
            const DeepCollectionEquality().equals(other.q, q) &&
            const DeepCollectionEquality().equals(other.a, a) &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(q),
      const DeepCollectionEquality().hash(a),
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y));

  @JsonKey(ignore: true)
  @override
  _$EuclideanStepCopyWith<_EuclideanStep> get copyWith =>
      __$EuclideanStepCopyWithImpl<_EuclideanStep>(this, _$identity);
}

abstract class _EuclideanStep implements EuclideanStep {
  const factory _EuclideanStep(
      {int? q,
      required int a,
      required int x,
      required int y}) = _$_EuclideanStep;

  @override
  int? get q;
  @override
  int get a;
  @override
  int get x;
  @override
  int get y;
  @override
  @JsonKey(ignore: true)
  _$EuclideanStepCopyWith<_EuclideanStep> get copyWith =>
      throw _privateConstructorUsedError;
}
