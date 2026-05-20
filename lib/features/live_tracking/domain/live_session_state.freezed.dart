// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LiveSessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)
        active,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            int elapsedSec)
        paused,
    required TResult Function(WorkoutSummary summary) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult? Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult? Function(WorkoutSummary summary)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult Function(WorkoutSummary summary)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LiveIdle value) idle,
    required TResult Function(LiveActive value) active,
    required TResult Function(LivePaused value) paused,
    required TResult Function(LiveFinished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LiveIdle value)? idle,
    TResult? Function(LiveActive value)? active,
    TResult? Function(LivePaused value)? paused,
    TResult? Function(LiveFinished value)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LiveIdle value)? idle,
    TResult Function(LiveActive value)? active,
    TResult Function(LivePaused value)? paused,
    TResult Function(LiveFinished value)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveSessionStateCopyWith<$Res> {
  factory $LiveSessionStateCopyWith(
          LiveSessionState value, $Res Function(LiveSessionState) then) =
      _$LiveSessionStateCopyWithImpl<$Res, LiveSessionState>;
}

/// @nodoc
class _$LiveSessionStateCopyWithImpl<$Res, $Val extends LiveSessionState>
    implements $LiveSessionStateCopyWith<$Res> {
  _$LiveSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LiveIdleImplCopyWith<$Res> {
  factory _$$LiveIdleImplCopyWith(
          _$LiveIdleImpl value, $Res Function(_$LiveIdleImpl) then) =
      __$$LiveIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LiveIdleImplCopyWithImpl<$Res>
    extends _$LiveSessionStateCopyWithImpl<$Res, _$LiveIdleImpl>
    implements _$$LiveIdleImplCopyWith<$Res> {
  __$$LiveIdleImplCopyWithImpl(
      _$LiveIdleImpl _value, $Res Function(_$LiveIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LiveIdleImpl implements LiveIdle {
  const _$LiveIdleImpl();

  @override
  String toString() {
    return 'LiveSessionState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LiveIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)
        active,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            int elapsedSec)
        paused,
    required TResult Function(WorkoutSummary summary) finished,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult? Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult? Function(WorkoutSummary summary)? finished,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult Function(WorkoutSummary summary)? finished,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LiveIdle value) idle,
    required TResult Function(LiveActive value) active,
    required TResult Function(LivePaused value) paused,
    required TResult Function(LiveFinished value) finished,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LiveIdle value)? idle,
    TResult? Function(LiveActive value)? active,
    TResult? Function(LivePaused value)? paused,
    TResult? Function(LiveFinished value)? finished,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LiveIdle value)? idle,
    TResult Function(LiveActive value)? active,
    TResult Function(LivePaused value)? paused,
    TResult Function(LiveFinished value)? finished,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class LiveIdle implements LiveSessionState {
  const factory LiveIdle() = _$LiveIdleImpl;
}

/// @nodoc
abstract class _$$LiveActiveImplCopyWith<$Res> {
  factory _$$LiveActiveImplCopyWith(
          _$LiveActiveImpl value, $Res Function(_$LiveActiveImpl) then) =
      __$$LiveActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<WorkoutExercise> exercises,
      int currentExerciseIndex,
      int currentSeriesIndex,
      DateTime startedAt,
      bool isResting,
      int restSecondsRemaining,
      int elapsedSec});
}

/// @nodoc
class __$$LiveActiveImplCopyWithImpl<$Res>
    extends _$LiveSessionStateCopyWithImpl<$Res, _$LiveActiveImpl>
    implements _$$LiveActiveImplCopyWith<$Res> {
  __$$LiveActiveImplCopyWithImpl(
      _$LiveActiveImpl _value, $Res Function(_$LiveActiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
    Object? currentExerciseIndex = null,
    Object? currentSeriesIndex = null,
    Object? startedAt = null,
    Object? isResting = null,
    Object? restSecondsRemaining = null,
    Object? elapsedSec = null,
  }) {
    return _then(_$LiveActiveImpl(
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutExercise>,
      currentExerciseIndex: null == currentExerciseIndex
          ? _value.currentExerciseIndex
          : currentExerciseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentSeriesIndex: null == currentSeriesIndex
          ? _value.currentSeriesIndex
          : currentSeriesIndex // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isResting: null == isResting
          ? _value.isResting
          : isResting // ignore: cast_nullable_to_non_nullable
              as bool,
      restSecondsRemaining: null == restSecondsRemaining
          ? _value.restSecondsRemaining
          : restSecondsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      elapsedSec: null == elapsedSec
          ? _value.elapsedSec
          : elapsedSec // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LiveActiveImpl implements LiveActive {
  const _$LiveActiveImpl(
      {required final List<WorkoutExercise> exercises,
      required this.currentExerciseIndex,
      required this.currentSeriesIndex,
      required this.startedAt,
      required this.isResting,
      required this.restSecondsRemaining,
      required this.elapsedSec})
      : _exercises = exercises;

  final List<WorkoutExercise> _exercises;
  @override
  List<WorkoutExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final int currentExerciseIndex;
  @override
  final int currentSeriesIndex;
  @override
  final DateTime startedAt;
  @override
  final bool isResting;
  @override
  final int restSecondsRemaining;
  @override
  final int elapsedSec;

  @override
  String toString() {
    return 'LiveSessionState.active(exercises: $exercises, currentExerciseIndex: $currentExerciseIndex, currentSeriesIndex: $currentSeriesIndex, startedAt: $startedAt, isResting: $isResting, restSecondsRemaining: $restSecondsRemaining, elapsedSec: $elapsedSec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveActiveImpl &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.currentExerciseIndex, currentExerciseIndex) ||
                other.currentExerciseIndex == currentExerciseIndex) &&
            (identical(other.currentSeriesIndex, currentSeriesIndex) ||
                other.currentSeriesIndex == currentSeriesIndex) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.isResting, isResting) ||
                other.isResting == isResting) &&
            (identical(other.restSecondsRemaining, restSecondsRemaining) ||
                other.restSecondsRemaining == restSecondsRemaining) &&
            (identical(other.elapsedSec, elapsedSec) ||
                other.elapsedSec == elapsedSec));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_exercises),
      currentExerciseIndex,
      currentSeriesIndex,
      startedAt,
      isResting,
      restSecondsRemaining,
      elapsedSec);

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveActiveImplCopyWith<_$LiveActiveImpl> get copyWith =>
      __$$LiveActiveImplCopyWithImpl<_$LiveActiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)
        active,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            int elapsedSec)
        paused,
    required TResult Function(WorkoutSummary summary) finished,
  }) {
    return active(exercises, currentExerciseIndex, currentSeriesIndex,
        startedAt, isResting, restSecondsRemaining, elapsedSec);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult? Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult? Function(WorkoutSummary summary)? finished,
  }) {
    return active?.call(exercises, currentExerciseIndex, currentSeriesIndex,
        startedAt, isResting, restSecondsRemaining, elapsedSec);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult Function(WorkoutSummary summary)? finished,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(exercises, currentExerciseIndex, currentSeriesIndex,
          startedAt, isResting, restSecondsRemaining, elapsedSec);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LiveIdle value) idle,
    required TResult Function(LiveActive value) active,
    required TResult Function(LivePaused value) paused,
    required TResult Function(LiveFinished value) finished,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LiveIdle value)? idle,
    TResult? Function(LiveActive value)? active,
    TResult? Function(LivePaused value)? paused,
    TResult? Function(LiveFinished value)? finished,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LiveIdle value)? idle,
    TResult Function(LiveActive value)? active,
    TResult Function(LivePaused value)? paused,
    TResult Function(LiveFinished value)? finished,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class LiveActive implements LiveSessionState {
  const factory LiveActive(
      {required final List<WorkoutExercise> exercises,
      required final int currentExerciseIndex,
      required final int currentSeriesIndex,
      required final DateTime startedAt,
      required final bool isResting,
      required final int restSecondsRemaining,
      required final int elapsedSec}) = _$LiveActiveImpl;

  List<WorkoutExercise> get exercises;
  int get currentExerciseIndex;
  int get currentSeriesIndex;
  DateTime get startedAt;
  bool get isResting;
  int get restSecondsRemaining;
  int get elapsedSec;

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveActiveImplCopyWith<_$LiveActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LivePausedImplCopyWith<$Res> {
  factory _$$LivePausedImplCopyWith(
          _$LivePausedImpl value, $Res Function(_$LivePausedImpl) then) =
      __$$LivePausedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<WorkoutExercise> exercises,
      int currentExerciseIndex,
      int currentSeriesIndex,
      DateTime startedAt,
      int elapsedSec});
}

/// @nodoc
class __$$LivePausedImplCopyWithImpl<$Res>
    extends _$LiveSessionStateCopyWithImpl<$Res, _$LivePausedImpl>
    implements _$$LivePausedImplCopyWith<$Res> {
  __$$LivePausedImplCopyWithImpl(
      _$LivePausedImpl _value, $Res Function(_$LivePausedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
    Object? currentExerciseIndex = null,
    Object? currentSeriesIndex = null,
    Object? startedAt = null,
    Object? elapsedSec = null,
  }) {
    return _then(_$LivePausedImpl(
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutExercise>,
      currentExerciseIndex: null == currentExerciseIndex
          ? _value.currentExerciseIndex
          : currentExerciseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentSeriesIndex: null == currentSeriesIndex
          ? _value.currentSeriesIndex
          : currentSeriesIndex // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      elapsedSec: null == elapsedSec
          ? _value.elapsedSec
          : elapsedSec // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LivePausedImpl implements LivePaused {
  const _$LivePausedImpl(
      {required final List<WorkoutExercise> exercises,
      required this.currentExerciseIndex,
      required this.currentSeriesIndex,
      required this.startedAt,
      required this.elapsedSec})
      : _exercises = exercises;

  final List<WorkoutExercise> _exercises;
  @override
  List<WorkoutExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final int currentExerciseIndex;
  @override
  final int currentSeriesIndex;
  @override
  final DateTime startedAt;
  @override
  final int elapsedSec;

  @override
  String toString() {
    return 'LiveSessionState.paused(exercises: $exercises, currentExerciseIndex: $currentExerciseIndex, currentSeriesIndex: $currentSeriesIndex, startedAt: $startedAt, elapsedSec: $elapsedSec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivePausedImpl &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.currentExerciseIndex, currentExerciseIndex) ||
                other.currentExerciseIndex == currentExerciseIndex) &&
            (identical(other.currentSeriesIndex, currentSeriesIndex) ||
                other.currentSeriesIndex == currentSeriesIndex) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.elapsedSec, elapsedSec) ||
                other.elapsedSec == elapsedSec));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_exercises),
      currentExerciseIndex,
      currentSeriesIndex,
      startedAt,
      elapsedSec);

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivePausedImplCopyWith<_$LivePausedImpl> get copyWith =>
      __$$LivePausedImplCopyWithImpl<_$LivePausedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)
        active,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            int elapsedSec)
        paused,
    required TResult Function(WorkoutSummary summary) finished,
  }) {
    return paused(exercises, currentExerciseIndex, currentSeriesIndex,
        startedAt, elapsedSec);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult? Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult? Function(WorkoutSummary summary)? finished,
  }) {
    return paused?.call(exercises, currentExerciseIndex, currentSeriesIndex,
        startedAt, elapsedSec);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult Function(WorkoutSummary summary)? finished,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(exercises, currentExerciseIndex, currentSeriesIndex,
          startedAt, elapsedSec);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LiveIdle value) idle,
    required TResult Function(LiveActive value) active,
    required TResult Function(LivePaused value) paused,
    required TResult Function(LiveFinished value) finished,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LiveIdle value)? idle,
    TResult? Function(LiveActive value)? active,
    TResult? Function(LivePaused value)? paused,
    TResult? Function(LiveFinished value)? finished,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LiveIdle value)? idle,
    TResult Function(LiveActive value)? active,
    TResult Function(LivePaused value)? paused,
    TResult Function(LiveFinished value)? finished,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class LivePaused implements LiveSessionState {
  const factory LivePaused(
      {required final List<WorkoutExercise> exercises,
      required final int currentExerciseIndex,
      required final int currentSeriesIndex,
      required final DateTime startedAt,
      required final int elapsedSec}) = _$LivePausedImpl;

  List<WorkoutExercise> get exercises;
  int get currentExerciseIndex;
  int get currentSeriesIndex;
  DateTime get startedAt;
  int get elapsedSec;

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivePausedImplCopyWith<_$LivePausedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LiveFinishedImplCopyWith<$Res> {
  factory _$$LiveFinishedImplCopyWith(
          _$LiveFinishedImpl value, $Res Function(_$LiveFinishedImpl) then) =
      __$$LiveFinishedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WorkoutSummary summary});

  $WorkoutSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$LiveFinishedImplCopyWithImpl<$Res>
    extends _$LiveSessionStateCopyWithImpl<$Res, _$LiveFinishedImpl>
    implements _$$LiveFinishedImplCopyWith<$Res> {
  __$$LiveFinishedImplCopyWithImpl(
      _$LiveFinishedImpl _value, $Res Function(_$LiveFinishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
  }) {
    return _then(_$LiveFinishedImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as WorkoutSummary,
    ));
  }

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutSummaryCopyWith<$Res> get summary {
    return $WorkoutSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value));
    });
  }
}

/// @nodoc

class _$LiveFinishedImpl implements LiveFinished {
  const _$LiveFinishedImpl({required this.summary});

  @override
  final WorkoutSummary summary;

  @override
  String toString() {
    return 'LiveSessionState.finished(summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveFinishedImpl &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveFinishedImplCopyWith<_$LiveFinishedImpl> get copyWith =>
      __$$LiveFinishedImplCopyWithImpl<_$LiveFinishedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)
        active,
    required TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            int elapsedSec)
        paused,
    required TResult Function(WorkoutSummary summary) finished,
  }) {
    return finished(summary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult? Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult? Function(WorkoutSummary summary)? finished,
  }) {
    return finished?.call(summary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            List<WorkoutExercise> exercises,
            int currentExerciseIndex,
            int currentSeriesIndex,
            DateTime startedAt,
            bool isResting,
            int restSecondsRemaining,
            int elapsedSec)?
        active,
    TResult Function(List<WorkoutExercise> exercises, int currentExerciseIndex,
            int currentSeriesIndex, DateTime startedAt, int elapsedSec)?
        paused,
    TResult Function(WorkoutSummary summary)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(summary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LiveIdle value) idle,
    required TResult Function(LiveActive value) active,
    required TResult Function(LivePaused value) paused,
    required TResult Function(LiveFinished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LiveIdle value)? idle,
    TResult? Function(LiveActive value)? active,
    TResult? Function(LivePaused value)? paused,
    TResult? Function(LiveFinished value)? finished,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LiveIdle value)? idle,
    TResult Function(LiveActive value)? active,
    TResult Function(LivePaused value)? paused,
    TResult Function(LiveFinished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class LiveFinished implements LiveSessionState {
  const factory LiveFinished({required final WorkoutSummary summary}) =
      _$LiveFinishedImpl;

  WorkoutSummary get summary;

  /// Create a copy of LiveSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveFinishedImplCopyWith<_$LiveFinishedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
