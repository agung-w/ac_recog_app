// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SensorState {
  List<ModelOutput> get outputHistories => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ModelOutput> outputHistories) initial,
    required TResult Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)
        tracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ModelOutput> outputHistories)? initial,
    TResult? Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)?
        tracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ModelOutput> outputHistories)? initial,
    TResult Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)?
        tracking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Tracking value) tracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Tracking value)? tracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Tracking value)? tracking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SensorStateCopyWith<SensorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorStateCopyWith<$Res> {
  factory $SensorStateCopyWith(
          SensorState value, $Res Function(SensorState) then) =
      _$SensorStateCopyWithImpl<$Res, SensorState>;
  @useResult
  $Res call({List<ModelOutput> outputHistories});
}

/// @nodoc
class _$SensorStateCopyWithImpl<$Res, $Val extends SensorState>
    implements $SensorStateCopyWith<$Res> {
  _$SensorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputHistories = null,
  }) {
    return _then(_value.copyWith(
      outputHistories: null == outputHistories
          ? _value.outputHistories
          : outputHistories // ignore: cast_nullable_to_non_nullable
              as List<ModelOutput>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $SensorStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ModelOutput> outputHistories});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SensorStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputHistories = null,
  }) {
    return _then(_$_Initial(
      outputHistories: null == outputHistories
          ? _value._outputHistories
          : outputHistories // ignore: cast_nullable_to_non_nullable
              as List<ModelOutput>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required final List<ModelOutput> outputHistories})
      : _outputHistories = outputHistories;

  final List<ModelOutput> _outputHistories;
  @override
  List<ModelOutput> get outputHistories {
    if (_outputHistories is EqualUnmodifiableListView) return _outputHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputHistories);
  }

  @override
  String toString() {
    return 'SensorState.initial(outputHistories: $outputHistories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._outputHistories, _outputHistories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_outputHistories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ModelOutput> outputHistories) initial,
    required TResult Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)
        tracking,
  }) {
    return initial(outputHistories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ModelOutput> outputHistories)? initial,
    TResult? Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)?
        tracking,
  }) {
    return initial?.call(outputHistories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ModelOutput> outputHistories)? initial,
    TResult Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)?
        tracking,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(outputHistories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Tracking value) tracking,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Tracking value)? tracking,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Tracking value)? tracking,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SensorState {
  const factory _Initial({required final List<ModelOutput> outputHistories}) =
      _$_Initial;

  @override
  List<ModelOutput> get outputHistories;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TrackingCopyWith<$Res>
    implements $SensorStateCopyWith<$Res> {
  factory _$$_TrackingCopyWith(
          _$_Tracking value, $Res Function(_$_Tracking) then) =
      __$$_TrackingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StreamSubscription> streamSubsriptions,
      List<ModelOutput> outputHistories});
}

/// @nodoc
class __$$_TrackingCopyWithImpl<$Res>
    extends _$SensorStateCopyWithImpl<$Res, _$_Tracking>
    implements _$$_TrackingCopyWith<$Res> {
  __$$_TrackingCopyWithImpl(
      _$_Tracking _value, $Res Function(_$_Tracking) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streamSubsriptions = null,
    Object? outputHistories = null,
  }) {
    return _then(_$_Tracking(
      streamSubsriptions: null == streamSubsriptions
          ? _value._streamSubsriptions
          : streamSubsriptions // ignore: cast_nullable_to_non_nullable
              as List<StreamSubscription>,
      outputHistories: null == outputHistories
          ? _value._outputHistories
          : outputHistories // ignore: cast_nullable_to_non_nullable
              as List<ModelOutput>,
    ));
  }
}

/// @nodoc

class _$_Tracking implements _Tracking {
  const _$_Tracking(
      {required final List<StreamSubscription> streamSubsriptions,
      required final List<ModelOutput> outputHistories})
      : _streamSubsriptions = streamSubsriptions,
        _outputHistories = outputHistories;

  final List<StreamSubscription> _streamSubsriptions;
  @override
  List<StreamSubscription> get streamSubsriptions {
    if (_streamSubsriptions is EqualUnmodifiableListView)
      return _streamSubsriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_streamSubsriptions);
  }

  final List<ModelOutput> _outputHistories;
  @override
  List<ModelOutput> get outputHistories {
    if (_outputHistories is EqualUnmodifiableListView) return _outputHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputHistories);
  }

  @override
  String toString() {
    return 'SensorState.tracking(streamSubsriptions: $streamSubsriptions, outputHistories: $outputHistories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tracking &&
            const DeepCollectionEquality()
                .equals(other._streamSubsriptions, _streamSubsriptions) &&
            const DeepCollectionEquality()
                .equals(other._outputHistories, _outputHistories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_streamSubsriptions),
      const DeepCollectionEquality().hash(_outputHistories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrackingCopyWith<_$_Tracking> get copyWith =>
      __$$_TrackingCopyWithImpl<_$_Tracking>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ModelOutput> outputHistories) initial,
    required TResult Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)
        tracking,
  }) {
    return tracking(streamSubsriptions, outputHistories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ModelOutput> outputHistories)? initial,
    TResult? Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)?
        tracking,
  }) {
    return tracking?.call(streamSubsriptions, outputHistories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ModelOutput> outputHistories)? initial,
    TResult Function(List<StreamSubscription> streamSubsriptions,
            List<ModelOutput> outputHistories)?
        tracking,
    required TResult orElse(),
  }) {
    if (tracking != null) {
      return tracking(streamSubsriptions, outputHistories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Tracking value) tracking,
  }) {
    return tracking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Tracking value)? tracking,
  }) {
    return tracking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Tracking value)? tracking,
    required TResult orElse(),
  }) {
    if (tracking != null) {
      return tracking(this);
    }
    return orElse();
  }
}

abstract class _Tracking implements SensorState {
  const factory _Tracking(
      {required final List<StreamSubscription> streamSubsriptions,
      required final List<ModelOutput> outputHistories}) = _$_Tracking;

  List<StreamSubscription> get streamSubsriptions;
  @override
  List<ModelOutput> get outputHistories;
  @override
  @JsonKey(ignore: true)
  _$$_TrackingCopyWith<_$_Tracking> get copyWith =>
      throw _privateConstructorUsedError;
}
