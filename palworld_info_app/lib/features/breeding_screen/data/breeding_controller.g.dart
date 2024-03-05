// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeding_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$breedingParentControllerHash() =>
    r'f4b9e1171e92441bc68532b4b8cf7618c915d001';

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

abstract class _$BreedingParentController
    extends BuildlessAsyncNotifier<List<BreedingEntity>> {
  late final String slug;

  FutureOr<List<BreedingEntity>> build(
    String slug,
  );
}

/// See also [BreedingParentController].
@ProviderFor(BreedingParentController)
const breedingParentControllerProvider = BreedingParentControllerFamily();

/// See also [BreedingParentController].
class BreedingParentControllerFamily
    extends Family<AsyncValue<List<BreedingEntity>>> {
  /// See also [BreedingParentController].
  const BreedingParentControllerFamily();

  /// See also [BreedingParentController].
  BreedingParentControllerProvider call(
    String slug,
  ) {
    return BreedingParentControllerProvider(
      slug,
    );
  }

  @override
  BreedingParentControllerProvider getProviderOverride(
    covariant BreedingParentControllerProvider provider,
  ) {
    return call(
      provider.slug,
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
  String? get name => r'breedingParentControllerProvider';
}

/// See also [BreedingParentController].
class BreedingParentControllerProvider extends AsyncNotifierProviderImpl<
    BreedingParentController, List<BreedingEntity>> {
  /// See also [BreedingParentController].
  BreedingParentControllerProvider(
    String slug,
  ) : this._internal(
          () => BreedingParentController()..slug = slug,
          from: breedingParentControllerProvider,
          name: r'breedingParentControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$breedingParentControllerHash,
          dependencies: BreedingParentControllerFamily._dependencies,
          allTransitiveDependencies:
              BreedingParentControllerFamily._allTransitiveDependencies,
          slug: slug,
        );

  BreedingParentControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  FutureOr<List<BreedingEntity>> runNotifierBuild(
    covariant BreedingParentController notifier,
  ) {
    return notifier.build(
      slug,
    );
  }

  @override
  Override overrideWith(BreedingParentController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BreedingParentControllerProvider._internal(
        () => create()..slug = slug,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<BreedingParentController, List<BreedingEntity>>
      createElement() {
    return _BreedingParentControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BreedingParentControllerProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BreedingParentControllerRef
    on AsyncNotifierProviderRef<List<BreedingEntity>> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _BreedingParentControllerProviderElement
    extends AsyncNotifierProviderElement<BreedingParentController,
        List<BreedingEntity>> with BreedingParentControllerRef {
  _BreedingParentControllerProviderElement(super.provider);

  @override
  String get slug => (origin as BreedingParentControllerProvider).slug;
}

String _$breedingChildControllerHash() =>
    r'ef8705fda24ff65be469ec5559237cc14be022f4';

abstract class _$BreedingChildController
    extends BuildlessAsyncNotifier<List<BreedingEntity>> {
  late final String slug;

  FutureOr<List<BreedingEntity>> build(
    String slug,
  );
}

/// See also [BreedingChildController].
@ProviderFor(BreedingChildController)
const breedingChildControllerProvider = BreedingChildControllerFamily();

/// See also [BreedingChildController].
class BreedingChildControllerFamily
    extends Family<AsyncValue<List<BreedingEntity>>> {
  /// See also [BreedingChildController].
  const BreedingChildControllerFamily();

  /// See also [BreedingChildController].
  BreedingChildControllerProvider call(
    String slug,
  ) {
    return BreedingChildControllerProvider(
      slug,
    );
  }

  @override
  BreedingChildControllerProvider getProviderOverride(
    covariant BreedingChildControllerProvider provider,
  ) {
    return call(
      provider.slug,
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
  String? get name => r'breedingChildControllerProvider';
}

/// See also [BreedingChildController].
class BreedingChildControllerProvider extends AsyncNotifierProviderImpl<
    BreedingChildController, List<BreedingEntity>> {
  /// See also [BreedingChildController].
  BreedingChildControllerProvider(
    String slug,
  ) : this._internal(
          () => BreedingChildController()..slug = slug,
          from: breedingChildControllerProvider,
          name: r'breedingChildControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$breedingChildControllerHash,
          dependencies: BreedingChildControllerFamily._dependencies,
          allTransitiveDependencies:
              BreedingChildControllerFamily._allTransitiveDependencies,
          slug: slug,
        );

  BreedingChildControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  FutureOr<List<BreedingEntity>> runNotifierBuild(
    covariant BreedingChildController notifier,
  ) {
    return notifier.build(
      slug,
    );
  }

  @override
  Override overrideWith(BreedingChildController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BreedingChildControllerProvider._internal(
        () => create()..slug = slug,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<BreedingChildController, List<BreedingEntity>>
      createElement() {
    return _BreedingChildControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BreedingChildControllerProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BreedingChildControllerRef
    on AsyncNotifierProviderRef<List<BreedingEntity>> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _BreedingChildControllerProviderElement
    extends AsyncNotifierProviderElement<BreedingChildController,
        List<BreedingEntity>> with BreedingChildControllerRef {
  _BreedingChildControllerProviderElement(super.provider);

  @override
  String get slug => (origin as BreedingChildControllerProvider).slug;
}

String _$breedingControllerHash() =>
    r'fe75c33ae26c913599a9926be16fe93210fad9c9';

abstract class _$BreedingController
    extends BuildlessAsyncNotifier<ParentChildEntity> {
  late final String slug;

  FutureOr<ParentChildEntity> build(
    String slug,
  );
}

/// See also [BreedingController].
@ProviderFor(BreedingController)
const breedingControllerProvider = BreedingControllerFamily();

/// See also [BreedingController].
class BreedingControllerFamily extends Family<AsyncValue<ParentChildEntity>> {
  /// See also [BreedingController].
  const BreedingControllerFamily();

  /// See also [BreedingController].
  BreedingControllerProvider call(
    String slug,
  ) {
    return BreedingControllerProvider(
      slug,
    );
  }

  @override
  BreedingControllerProvider getProviderOverride(
    covariant BreedingControllerProvider provider,
  ) {
    return call(
      provider.slug,
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
  String? get name => r'breedingControllerProvider';
}

/// See also [BreedingController].
class BreedingControllerProvider
    extends AsyncNotifierProviderImpl<BreedingController, ParentChildEntity> {
  /// See also [BreedingController].
  BreedingControllerProvider(
    String slug,
  ) : this._internal(
          () => BreedingController()..slug = slug,
          from: breedingControllerProvider,
          name: r'breedingControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$breedingControllerHash,
          dependencies: BreedingControllerFamily._dependencies,
          allTransitiveDependencies:
              BreedingControllerFamily._allTransitiveDependencies,
          slug: slug,
        );

  BreedingControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  FutureOr<ParentChildEntity> runNotifierBuild(
    covariant BreedingController notifier,
  ) {
    return notifier.build(
      slug,
    );
  }

  @override
  Override overrideWith(BreedingController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BreedingControllerProvider._internal(
        () => create()..slug = slug,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<BreedingController, ParentChildEntity>
      createElement() {
    return _BreedingControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BreedingControllerProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BreedingControllerRef on AsyncNotifierProviderRef<ParentChildEntity> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _BreedingControllerProviderElement
    extends AsyncNotifierProviderElement<BreedingController, ParentChildEntity>
    with BreedingControllerRef {
  _BreedingControllerProviderElement(super.provider);

  @override
  String get slug => (origin as BreedingControllerProvider).slug;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
