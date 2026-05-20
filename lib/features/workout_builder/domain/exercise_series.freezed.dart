// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseSeries _$ExerciseSeriesFromJson(Map<String, dynamic> json) {
  return _ExerciseSeries.fromJson(json);
}

/// @nodoc
mixin _$ExerciseSeries {
  String get id => throw _privateConstructorUsedError;
  int get setNumber => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  double get weightKg => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  int? get durationSec => throw _privateConstructorUsedError;

  /// Serializes this ExerciseSeries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseSeriesCopyWith<ExerciseSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseSeriesCopyWith<$Res> {
  factory $ExerciseSeriesCopyWith(
          ExerciseSeries value, $Res Function(ExerciseSeries) then) =
      _$ExerciseSeriesCopyWithImpl<$Res, ExerciseSeries>;
  @useResult
  $Res call(
      {String id,
      int setNumber,
      int reps,
      double weightKg,
      bool completed,
      int? durationSec});
}

/// @nodoc
class _$ExerciseSeriesCopyWithImpl<$Res, $Val extends ExerciseSeries>
    implements $ExerciseSeriesCopyWith<$Res> {
  _$ExerciseSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? setNumber = null,
    Object? reps = null,
    Object? weightKg = null,
    Object? completed = null,
    Object? durationSec = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: null == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      durationSec: freezed == durationSec
          ? _value.durationSec
          : durationSec // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseSeriesImplCopyWith<$Res>
    implements $ExerciseSeriesCopyWith<$Res> {
  factory _$$ExerciseSeriesImplCopyWith(_$ExerciseSeriesImpl value,
          $Res Function(_$ExerciseSeriesImpl) then) =
      __$$ExerciseSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int setNumber,
      int reps,
      double weightKg,
      bool completed,
      int? durationSec});
}

/// @nodoc
class __$$ExerciseSeriesImplCopyWithImpl<$Res>
    extends _$ExerciseSeriesCopyWithImpl<$Res, _$ExerciseSeriesImpl>
    implements _$$ExerciseSeriesImplCopyWith<$Res> {
  __$$ExerciseSeriesImplCopyWithImpl(
      _$ExerciseSeriesImpl _value, $Res Function(_$ExerciseSeriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? setNumber = null,
    Object? reps = null,
    Object? weightKg = null,
    Object? completed = null,
    Object? durationSec = freezed,
  }) {
    return _then(_$ExerciseSeriesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      setNumber: null == setNumber
          ? _value.setNumber
          : setNumber // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: null == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      durationSec: freezed == durationSec
          ? _value.durationSec
          : durationSec // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseSeriesImpl implements _ExerciseSeries {
  const _$ExerciseSeriesImpl(
      {required this.id,
      required this.setNumber,
      required this.reps,
      required this.weightKg,
      this.completed = false,
      this.durationSec});

  factory _$ExerciseSeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseSeriesImplFromJson(json);

  @override
  final String id;
  @override
  final int setNumber;
  @override
  final int reps;
  @override
  final double weightKg;
  @override
  @JsonKey()
  final bool completed;
  @override
  final int? durationSec;

  @override
  String toString() {
    return 'ExerciseSeries(id: $id, setNumber: $setNumber, reps: $reps, weightKg: $weightKg, completed: $completed, durationSec: $durationSec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseSeriesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.setNumber, setNumber) ||
                other.setNumber == setNumber) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.durationSec, durationSec) ||
                other.durationSec == durationSec));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, setNumber, reps, weightKg, completed, durationSec);

  /// Create a copy of ExerciseSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseSeriesImplCopyWith<_$ExerciseSeriesImpl> get copyWith =>
      __$$ExerciseSeriesImplCopyWithImpl<_$ExerciseSeriesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseSeriesImplToJson(
      this,
    );
  }
}

abstract class _ExerciseSeries implements ExerciseSeries {
  const factory _ExerciseSeries(
      {required final String id,
      required final int setNumber,
      required final int reps,
      required final double weightKg,
      final bool completed,
      final int? durationSec}) = _$ExerciseSeriesImpl;

  factory _ExerciseSeries.fromJson(Map<String, dynamic> json) =
      _$ExerciseSeriesImpl.fromJson;

  @override
  String get id;
  @override
  int get setNumber;
  @override
  int get reps;
  @override
  double get weightKg;
  @override
  bool get completed;
  @override
  int? get durationSec;

  /// Create a copy of ExerciseSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseSeriesImplCopyWith<_$ExerciseSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
