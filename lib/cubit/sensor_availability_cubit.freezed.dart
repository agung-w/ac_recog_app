// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_availability_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SensorAvailabilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String>? sensors) unavailable,
    required TResult Function() available,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? sensors)? unavailable,
    TResult? Function()? available,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? sensors)? unavailable,
    TResult Function()? available,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Available value) available,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Available value)? available,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Available value)? available,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorAvailabilityStateCopyWith<$Res> {
  factory $SensorAvailabilityStateCopyWith(SensorAvailabilityState value,
          $Res Function(SensorAvailabilityState) then) =
      _$SensorAvailabilityStateCopyWithImpl<$Res, SensorAvailabilityState>;
}

/// @nodoc
class _$SensorAvailabilityStateCopyWithImpl<$Res,
        $Val extends SensorAvailabilityState>
    implements $SensorAvailabilityStateCopyWith<$Res> {
  _$SensorAvailabilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnavailableCopyWith<$Res> {
  factory _$$_UnavailableCopyWith(
          _$_Unavailable value, $Res Function(_$_Unavailable) then) =
      __$$_UnavailableCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String>? sensors});
}

/// @nodoc
class __$$_UnavailableCopyWithImpl<$Res>
    extends _$SensorAvailabilityStateCopyWithImpl<$Res, _$_Unavailable>
    implements _$$_UnavailableCopyWith<$Res> {
  __$$_UnavailableCopyWithImpl(
      _$_Unavailable _value, $Res Function(_$_Unavailable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensors = freezed,
  }) {
    return _then(_$_Unavailable(
      sensors: freezed == sensors
          ? _value._sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_Unavailable implements _Unavailable {
  const _$_Unavailable({final List<String>? sensors}) : _sensors = sensors;

  final List<String>? _sensors;
  @override
  List<String>? get sensors {
    final value = _sensors;
    if (value == null) return null;
    if (_sensors is EqualUnmodifiableListView) return _sensors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SensorAvailabilityState.unavailable(sensors: $sensors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unavailable &&
            const DeepCollectionEquality().equals(other._sensors, _sensors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sensors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnavailableCopyWith<_$_Unavailable> get copyWith =>
      __$$_UnavailableCopyWithImpl<_$_Unavailable>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String>? sensors) unavailable,
    required TResult Function() available,
    required TResult Function() initial,
  }) {
    return unavailable(sensors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? sensors)? unavailable,
    TResult? Function()? available,
    TResult? Function()? initial,
  }) {
    return unavailable?.call(sensors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? sensors)? unavailable,
    TResult Function()? available,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(sensors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Available value) available,
    required TResult Function(_Initial value) initial,
  }) {
    return unavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Available value)? available,
    TResult? Function(_Initial value)? initial,
  }) {
    return unavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Available value)? available,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(this);
    }
    return orElse();
  }
}

abstract class _Unavailable implements SensorAvailabilityState {
  const factory _Unavailable({final List<String>? sensors}) = _$_Unavailable;

  List<String>? get sensors;
  @JsonKey(ignore: true)
  _$$_UnavailableCopyWith<_$_Unavailable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AvailableCopyWith<$Res> {
  factory _$$_AvailableCopyWith(
          _$_Available value, $Res Function(_$_Available) then) =
      __$$_AvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AvailableCopyWithImpl<$Res>
    extends _$SensorAvailabilityStateCopyWithImpl<$Res, _$_Available>
    implements _$$_AvailableCopyWith<$Res> {
  __$$_AvailableCopyWithImpl(
      _$_Available _value, $Res Function(_$_Available) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Available implements _Available {
  const _$_Available();

  @override
  String toString() {
    return 'SensorAvailabilityState.available()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Available);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String>? sensors) unavailable,
    required TResult Function() available,
    required TResult Function() initial,
  }) {
    return available();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? sensors)? unavailable,
    TResult? Function()? available,
    TResult? Function()? initial,
  }) {
    return available?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? sensors)? unavailable,
    TResult Function()? available,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Available value) available,
    required TResult Function(_Initial value) initial,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Available value)? available,
    TResult? Function(_Initial value)? initial,
  }) {
    return available?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Available value)? available,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available implements SensorAvailabilityState {
  const factory _Available() = _$_Available;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SensorAvailabilityStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SensorAvailabilityState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String>? sensors) unavailable,
    required TResult Function() available,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String>? sensors)? unavailable,
    TResult? Function()? available,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String>? sensors)? unavailable,
    TResult Function()? available,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Available value) available,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Available value)? available,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Available value)? available,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SensorAvailabilityState {
  const factory _Initial() = _$_Initial;
}
