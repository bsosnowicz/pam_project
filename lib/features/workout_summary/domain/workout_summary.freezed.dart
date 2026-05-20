// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSummary _$WorkoutSummaryFromJson(Map<String, dynamic> json) {
  return _WorkoutSummary.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSummary {
  int get durationSec => throw _privateConstructorUsedError;
  double get totalVolumeKg => throw _privateConstructorUsedError;
  int get totalSets => throw _privateConstructorUsedError;
  int get totalReps => throw _privateConstructorUsedError;
  int get totalRestSec => throw _privateConstructorUsedError;
  int get caloriesBurned => throw _privateConstructorUsedError;
  List<WorkoutExercise> get exercises => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSummaryCopyWith<WorkoutSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSummaryCopyWith<$Res> {
  factory $WorkoutSummaryCopyWith(
          WorkoutSummary value, $Res Function(WorkoutSummary) then) =
      _$WorkoutSummaryCopyWithImpl<$Res, WorkoutSummary>;
  @useResult
  $Res call(
      {int durationSec,
      double totalVolumeKg,
      int totalSets,
      int totalReps,
      int totalRestSec,
      int caloriesBurned,
      List<WorkoutExercise> exercises,
      DateTime startedAt,
      String? title,
      String? notes});
}

/// @nodoc
class _$WorkoutSummaryCopyWithImpl<$Res, $Val extends WorkoutSummary>
    implements $WorkoutSummaryCopyWith<$Res> {
  _$WorkoutSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durationSec = null,
    Object? totalVolumeKg = null,
    Object? totalSets = null,
    Object? totalReps = null,
    Object? totalRestSec = null,
    Object? caloriesBurned = null,
    Object? exercises = null,
    Object? startedAt = null,
    Object? title = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      durationSec: null == durationSec
          ? _value.durationSec
          : durationSec // ignore: cast_nullable_to_non_nullable
              as int,
      totalVolumeKg: null == totalVolumeKg
          ? _value.totalVolumeKg
          : totalVolumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      totalSets: null == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int,
      totalReps: null == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int,
      totalRestSec: null == totalRestSec
          ? _value.totalRestSec
          : totalRestSec // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutExercise>,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSummaryImplCopyWith<$Res>
    implements $WorkoutSummaryCopyWith<$Res> {
  factory _$$WorkoutSummaryImplCopyWith(_$WorkoutSummaryImpl value,
          $Res Function(_$WorkoutSummaryImpl) then) =
      __$$WorkoutSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int durationSec,
      double totalVolumeKg,
      int totalSets,
      int totalReps,
      int totalRestSec,
      int caloriesBurned,
      List<WorkoutExercise> exercises,
      DateTime startedAt,
      String? title,
      String? notes});
}

/// @nodoc
class __$$WorkoutSummaryImplCopyWithImpl<$Res>
    extends _$WorkoutSummaryCopyWithImpl<$Res, _$WorkoutSummaryImpl>
    implements _$$WorkoutSummaryImplCopyWith<$Res> {
  __$$WorkoutSummaryImplCopyWithImpl(
      _$WorkoutSummaryImpl _value, $Res Function(_$WorkoutSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durationSec = null,
    Object? totalVolumeKg = null,
    Object? totalSets = null,
    Object? totalReps = null,
    Object? totalRestSec = null,
    Object? caloriesBurned = null,
    Object? exercises = null,
    Object? startedAt = null,
    Object? title = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$WorkoutSummaryImpl(
      durationSec: null == durationSec
          ? _value.durationSec
          : durationSec // ignore: cast_nullable_to_non_nullable
              as int,
      totalVolumeKg: null == totalVolumeKg
          ? _value.totalVolumeKg
          : totalVolumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      totalSets: null == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int,
      totalReps: null == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int,
      totalRestSec: null == totalRestSec
          ? _value.totalRestSec
          : totalRestSec // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutExercise>,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSummaryImpl implements _WorkoutSummary {
  const _$WorkoutSummaryImpl(
      {required this.durationSec,
      required this.totalVolumeKg,
      required this.totalSets,
      required this.totalReps,
      required this.totalRestSec,
      required this.caloriesBurned,
      required final List<WorkoutExercise> exercises,
      required this.startedAt,
      this.title,
      this.notes})
      : _exercises = exercises;

  factory _$WorkoutSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSummaryImplFromJson(json);

  @override
  final int durationSec;
  @override
  final double totalVolumeKg;
  @override
  final int totalSets;
  @override
  final int totalReps;
  @override
  final int totalRestSec;
  @override
  final int caloriesBurned;
  final List<WorkoutExercise> _exercises;
  @override
  List<WorkoutExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final DateTime startedAt;
  @override
  final String? title;
  @override
  final String? notes;

  @override
  String toString() {
    return 'WorkoutSummary(durationSec: $durationSec, totalVolumeKg: $totalVolumeKg, totalSets: $totalSets, totalReps: $totalReps, totalRestSec: $totalRestSec, caloriesBurned: $caloriesBurned, exercises: $exercises, startedAt: $startedAt, title: $title, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSummaryImpl &&
            (identical(other.durationSec, durationSec) ||
                other.durationSec == durationSec) &&
            (identical(other.totalVolumeKg, totalVolumeKg) ||
                other.totalVolumeKg == totalVolumeKg) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets) &&
            (identical(other.totalReps, totalReps) ||
                other.totalReps == totalReps) &&
            (identical(other.totalRestSec, totalRestSec) ||
                other.totalRestSec == totalRestSec) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      durationSec,
      totalVolumeKg,
      totalSets,
      totalReps,
      totalRestSec,
      caloriesBurned,
      const DeepCollectionEquality().hash(_exercises),
      startedAt,
      title,
      notes);

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSummaryImplCopyWith<_$WorkoutSummaryImpl> get copyWith =>
      __$$WorkoutSummaryImplCopyWithImpl<_$WorkoutSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSummaryImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSummary implements WorkoutSummary {
  const factory _WorkoutSummary(
      {required final int durationSec,
      required final double totalVolumeKg,
      required final int totalSets,
      required final int totalReps,
      required final int totalRestSec,
      required final int caloriesBurned,
      required final List<WorkoutExercise> exercises,
      required final DateTime startedAt,
      final String? title,
      final String? notes}) = _$WorkoutSummaryImpl;

  factory _WorkoutSummary.fromJson(Map<String, dynamic> json) =
      _$WorkoutSummaryImpl.fromJson;

  @override
  int get durationSec;
  @override
  double get totalVolumeKg;
  @override
  int get totalSets;
  @override
  int get totalReps;
  @override
  int get totalRestSec;
  @override
  int get caloriesBurned;
  @override
  List<WorkoutExercise> get exercises;
  @override
  DateTime get startedAt;
  @override
  String? get title;
  @override
  String? get notes;

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSummaryImplCopyWith<_$WorkoutSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
