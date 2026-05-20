// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChartDataPoint _$ChartDataPointFromJson(Map<String, dynamic> json) {
  return _ChartDataPoint.fromJson(json);
}

/// @nodoc
mixin _$ChartDataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  /// Serializes this ChartDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartDataPointCopyWith<ChartDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataPointCopyWith<$Res> {
  factory $ChartDataPointCopyWith(
          ChartDataPoint value, $Res Function(ChartDataPoint) then) =
      _$ChartDataPointCopyWithImpl<$Res, ChartDataPoint>;
  @useResult
  $Res call({DateTime date, double value, String? label});
}

/// @nodoc
class _$ChartDataPointCopyWithImpl<$Res, $Val extends ChartDataPoint>
    implements $ChartDataPointCopyWith<$Res> {
  _$ChartDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartDataPointImplCopyWith<$Res>
    implements $ChartDataPointCopyWith<$Res> {
  factory _$$ChartDataPointImplCopyWith(_$ChartDataPointImpl value,
          $Res Function(_$ChartDataPointImpl) then) =
      __$$ChartDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double value, String? label});
}

/// @nodoc
class __$$ChartDataPointImplCopyWithImpl<$Res>
    extends _$ChartDataPointCopyWithImpl<$Res, _$ChartDataPointImpl>
    implements _$$ChartDataPointImplCopyWith<$Res> {
  __$$ChartDataPointImplCopyWithImpl(
      _$ChartDataPointImpl _value, $Res Function(_$ChartDataPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? label = freezed,
  }) {
    return _then(_$ChartDataPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartDataPointImpl implements _ChartDataPoint {
  const _$ChartDataPointImpl(
      {required this.date, required this.value, this.label});

  factory _$ChartDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartDataPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double value;
  @override
  final String? label;

  @override
  String toString() {
    return 'ChartDataPoint(date: $date, value: $value, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, value, label);

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      __$$ChartDataPointImplCopyWithImpl<_$ChartDataPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartDataPointImplToJson(
      this,
    );
  }
}

abstract class _ChartDataPoint implements ChartDataPoint {
  const factory _ChartDataPoint(
      {required final DateTime date,
      required final double value,
      final String? label}) = _$ChartDataPointImpl;

  factory _ChartDataPoint.fromJson(Map<String, dynamic> json) =
      _$ChartDataPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get value;
  @override
  String? get label;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsSnapshot _$StatsSnapshotFromJson(Map<String, dynamic> json) {
  return _StatsSnapshot.fromJson(json);
}

/// @nodoc
mixin _$StatsSnapshot {
  String get period => throw _privateConstructorUsedError;
  int get totalWorkouts => throw _privateConstructorUsedError;
  double get avgDurationMin => throw _privateConstructorUsedError;
  double get avgCalories => throw _privateConstructorUsedError;
  double get totalVolumeKg => throw _privateConstructorUsedError;
  List<ChartDataPoint> get volumeHistory => throw _privateConstructorUsedError;
  List<ChartDataPoint> get strengthProgress =>
      throw _privateConstructorUsedError;

  /// Serializes this StatsSnapshot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsSnapshotCopyWith<StatsSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsSnapshotCopyWith<$Res> {
  factory $StatsSnapshotCopyWith(
          StatsSnapshot value, $Res Function(StatsSnapshot) then) =
      _$StatsSnapshotCopyWithImpl<$Res, StatsSnapshot>;
  @useResult
  $Res call(
      {String period,
      int totalWorkouts,
      double avgDurationMin,
      double avgCalories,
      double totalVolumeKg,
      List<ChartDataPoint> volumeHistory,
      List<ChartDataPoint> strengthProgress});
}

/// @nodoc
class _$StatsSnapshotCopyWithImpl<$Res, $Val extends StatsSnapshot>
    implements $StatsSnapshotCopyWith<$Res> {
  _$StatsSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? totalWorkouts = null,
    Object? avgDurationMin = null,
    Object? avgCalories = null,
    Object? totalVolumeKg = null,
    Object? volumeHistory = null,
    Object? strengthProgress = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      totalWorkouts: null == totalWorkouts
          ? _value.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      avgDurationMin: null == avgDurationMin
          ? _value.avgDurationMin
          : avgDurationMin // ignore: cast_nullable_to_non_nullable
              as double,
      avgCalories: null == avgCalories
          ? _value.avgCalories
          : avgCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalVolumeKg: null == totalVolumeKg
          ? _value.totalVolumeKg
          : totalVolumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      volumeHistory: null == volumeHistory
          ? _value.volumeHistory
          : volumeHistory // ignore: cast_nullable_to_non_nullable
              as List<ChartDataPoint>,
      strengthProgress: null == strengthProgress
          ? _value.strengthProgress
          : strengthProgress // ignore: cast_nullable_to_non_nullable
              as List<ChartDataPoint>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsSnapshotImplCopyWith<$Res>
    implements $StatsSnapshotCopyWith<$Res> {
  factory _$$StatsSnapshotImplCopyWith(
          _$StatsSnapshotImpl value, $Res Function(_$StatsSnapshotImpl) then) =
      __$$StatsSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String period,
      int totalWorkouts,
      double avgDurationMin,
      double avgCalories,
      double totalVolumeKg,
      List<ChartDataPoint> volumeHistory,
      List<ChartDataPoint> strengthProgress});
}

/// @nodoc
class __$$StatsSnapshotImplCopyWithImpl<$Res>
    extends _$StatsSnapshotCopyWithImpl<$Res, _$StatsSnapshotImpl>
    implements _$$StatsSnapshotImplCopyWith<$Res> {
  __$$StatsSnapshotImplCopyWithImpl(
      _$StatsSnapshotImpl _value, $Res Function(_$StatsSnapshotImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? totalWorkouts = null,
    Object? avgDurationMin = null,
    Object? avgCalories = null,
    Object? totalVolumeKg = null,
    Object? volumeHistory = null,
    Object? strengthProgress = null,
  }) {
    return _then(_$StatsSnapshotImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      totalWorkouts: null == totalWorkouts
          ? _value.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      avgDurationMin: null == avgDurationMin
          ? _value.avgDurationMin
          : avgDurationMin // ignore: cast_nullable_to_non_nullable
              as double,
      avgCalories: null == avgCalories
          ? _value.avgCalories
          : avgCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalVolumeKg: null == totalVolumeKg
          ? _value.totalVolumeKg
          : totalVolumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      volumeHistory: null == volumeHistory
          ? _value._volumeHistory
          : volumeHistory // ignore: cast_nullable_to_non_nullable
              as List<ChartDataPoint>,
      strengthProgress: null == strengthProgress
          ? _value._strengthProgress
          : strengthProgress // ignore: cast_nullable_to_non_nullable
              as List<ChartDataPoint>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsSnapshotImpl implements _StatsSnapshot {
  const _$StatsSnapshotImpl(
      {required this.period,
      required this.totalWorkouts,
      required this.avgDurationMin,
      required this.avgCalories,
      required this.totalVolumeKg,
      required final List<ChartDataPoint> volumeHistory,
      required final List<ChartDataPoint> strengthProgress})
      : _volumeHistory = volumeHistory,
        _strengthProgress = strengthProgress;

  factory _$StatsSnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsSnapshotImplFromJson(json);

  @override
  final String period;
  @override
  final int totalWorkouts;
  @override
  final double avgDurationMin;
  @override
  final double avgCalories;
  @override
  final double totalVolumeKg;
  final List<ChartDataPoint> _volumeHistory;
  @override
  List<ChartDataPoint> get volumeHistory {
    if (_volumeHistory is EqualUnmodifiableListView) return _volumeHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_volumeHistory);
  }

  final List<ChartDataPoint> _strengthProgress;
  @override
  List<ChartDataPoint> get strengthProgress {
    if (_strengthProgress is EqualUnmodifiableListView)
      return _strengthProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengthProgress);
  }

  @override
  String toString() {
    return 'StatsSnapshot(period: $period, totalWorkouts: $totalWorkouts, avgDurationMin: $avgDurationMin, avgCalories: $avgCalories, totalVolumeKg: $totalVolumeKg, volumeHistory: $volumeHistory, strengthProgress: $strengthProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsSnapshotImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.avgDurationMin, avgDurationMin) ||
                other.avgDurationMin == avgDurationMin) &&
            (identical(other.avgCalories, avgCalories) ||
                other.avgCalories == avgCalories) &&
            (identical(other.totalVolumeKg, totalVolumeKg) ||
                other.totalVolumeKg == totalVolumeKg) &&
            const DeepCollectionEquality()
                .equals(other._volumeHistory, _volumeHistory) &&
            const DeepCollectionEquality()
                .equals(other._strengthProgress, _strengthProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      totalWorkouts,
      avgDurationMin,
      avgCalories,
      totalVolumeKg,
      const DeepCollectionEquality().hash(_volumeHistory),
      const DeepCollectionEquality().hash(_strengthProgress));

  /// Create a copy of StatsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsSnapshotImplCopyWith<_$StatsSnapshotImpl> get copyWith =>
      __$$StatsSnapshotImplCopyWithImpl<_$StatsSnapshotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsSnapshotImplToJson(
      this,
    );
  }
}

abstract class _StatsSnapshot implements StatsSnapshot {
  const factory _StatsSnapshot(
          {required final String period,
          required final int totalWorkouts,
          required final double avgDurationMin,
          required final double avgCalories,
          required final double totalVolumeKg,
          required final List<ChartDataPoint> volumeHistory,
          required final List<ChartDataPoint> strengthProgress}) =
      _$StatsSnapshotImpl;

  factory _StatsSnapshot.fromJson(Map<String, dynamic> json) =
      _$StatsSnapshotImpl.fromJson;

  @override
  String get period;
  @override
  int get totalWorkouts;
  @override
  double get avgDurationMin;
  @override
  double get avgCalories;
  @override
  double get totalVolumeKg;
  @override
  List<ChartDataPoint> get volumeHistory;
  @override
  List<ChartDataPoint> get strengthProgress;

  /// Create a copy of StatsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsSnapshotImplCopyWith<_$StatsSnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
