// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analyticsRepositoryHash() =>
    r'69370ad60c90bd949bf4fb499af14b47dbf01bf7';

/// See also [analyticsRepository].
@ProviderFor(analyticsRepository)
final analyticsRepositoryProvider =
    AutoDisposeProvider<AnalyticsRepository>.internal(
  analyticsRepository,
  name: r'analyticsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analyticsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AnalyticsRepositoryRef = AutoDisposeProviderRef<AnalyticsRepository>;
String _$statsSnapshotHash() => r'8b8368ece616ed1b94df498faae53065ccee17e7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [statsSnapshot].
@ProviderFor(statsSnapshot)
const statsSnapshotProvider = StatsSnapshotFamily();

/// See also [statsSnapshot].
class StatsSnapshotFamily extends Family<AsyncValue<StatsSnapshot>> {
  /// See also [statsSnapshot].
  const StatsSnapshotFamily();

  /// See also [statsSnapshot].
  StatsSnapshotProvider call(
    String period,
  ) {
    return StatsSnapshotProvider(
      period,
    );
  }

  @override
  StatsSnapshotProvider getProviderOverride(
    covariant StatsSnapshotProvider provider,
  ) {
    return call(
      provider.period,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'statsSnapshotProvider';
}

/// See also [statsSnapshot].
class StatsSnapshotProvider extends AutoDisposeFutureProvider<StatsSnapshot> {
  /// See also [statsSnapshot].
  StatsSnapshotProvider(
    String period,
  ) : this._internal(
          (ref) => statsSnapshot(
            ref as StatsSnapshotRef,
            period,
          ),
          from: statsSnapshotProvider,
          name: r'statsSnapshotProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statsSnapshotHash,
          dependencies: StatsSnapshotFamily._dependencies,
          allTransitiveDependencies:
              StatsSnapshotFamily._allTransitiveDependencies,
          period: period,
        );

  StatsSnapshotProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final String period;

  @override
  Override overrideWith(
    FutureOr<StatsSnapshot> Function(StatsSnapshotRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StatsSnapshotProvider._internal(
        (ref) => create(ref as StatsSnapshotRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<StatsSnapshot> createElement() {
    return _StatsSnapshotProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatsSnapshotProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StatsSnapshotRef on AutoDisposeFutureProviderRef<StatsSnapshot> {
  /// The parameter `period` of this provider.
  String get period;
}

class _StatsSnapshotProviderElement
    extends AutoDisposeFutureProviderElement<StatsSnapshot>
    with StatsSnapshotRef {
  _StatsSnapshotProviderElement(super.provider);

  @override
  String get period => (origin as StatsSnapshotProvider).period;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
