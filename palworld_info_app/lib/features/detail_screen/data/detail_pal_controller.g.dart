// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_pal_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$detailPalControllerHash() =>
    r'b5e9f97eb4c9bc03ec1ac6278111c809baea2383';

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

abstract class _$DetailPalController
    extends BuildlessAutoDisposeAsyncNotifier<PalEntity> {
  late final String slug;

  FutureOr<PalEntity> build(
    String slug,
  );
}

/// See also [DetailPalController].
@ProviderFor(DetailPalController)
const detailPalControllerProvider = DetailPalControllerFamily();

/// See also [DetailPalController].
class DetailPalControllerFamily extends Family<AsyncValue<PalEntity>> {
  /// See also [DetailPalController].
  const DetailPalControllerFamily();

  /// See also [DetailPalController].
  DetailPalControllerProvider call(
    String slug,
  ) {
    return DetailPalControllerProvider(
      slug,
    );
  }

  @override
  DetailPalControllerProvider getProviderOverride(
    covariant DetailPalControllerProvider provider,
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
  String? get name => r'detailPalControllerProvider';
}

/// See also [DetailPalController].
class DetailPalControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DetailPalController, PalEntity> {
  /// See also [DetailPalController].
  DetailPalControllerProvider(
    String slug,
  ) : this._internal(
          () => DetailPalController()..slug = slug,
          from: detailPalControllerProvider,
          name: r'detailPalControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$detailPalControllerHash,
          dependencies: DetailPalControllerFamily._dependencies,
          allTransitiveDependencies:
              DetailPalControllerFamily._allTransitiveDependencies,
          slug: slug,
        );

  DetailPalControllerProvider._internal(
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
  FutureOr<PalEntity> runNotifierBuild(
    covariant DetailPalController notifier,
  ) {
    return notifier.build(
      slug,
    );
  }

  @override
  Override overrideWith(DetailPalController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DetailPalControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DetailPalController, PalEntity>
      createElement() {
    return _DetailPalControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DetailPalControllerProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DetailPalControllerRef on AutoDisposeAsyncNotifierProviderRef<PalEntity> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _DetailPalControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DetailPalController,
        PalEntity> with DetailPalControllerRef {
  _DetailPalControllerProviderElement(super.provider);

  @override
  String get slug => (origin as DetailPalControllerProvider).slug;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
