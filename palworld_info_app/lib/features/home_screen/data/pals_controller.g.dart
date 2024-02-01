// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pals_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$palControllerHash() => r'11f0c4053c54fb1fcecf9104da4d1d39911677d4';

/// See also [PalController].
@ProviderFor(PalController)
final palControllerProvider =
    AsyncNotifierProvider<PalController, List<PalEntity>>.internal(
  PalController.new,
  name: r'palControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$palControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PalController = AsyncNotifier<List<PalEntity>>;
String _$selectingElementHash() => r'7880e418d1fb680da8a2617ca0fa406a10aa75c5';

/// See also [SelectingElement].
@ProviderFor(SelectingElement)
final selectingElementProvider =
    NotifierProvider<SelectingElement, List<ElementEntity>>.internal(
  SelectingElement.new,
  name: r'selectingElementProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectingElementHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectingElement = Notifier<List<ElementEntity>>;
String _$selectingPalHash() => r'c222f6f164b7f61c0167b53feed7cc2018d3d464';

/// See also [SelectingPal].
@ProviderFor(SelectingPal)
final selectingPalProvider =
    AsyncNotifierProvider<SelectingPal, List<PalEntity>>.internal(
  SelectingPal.new,
  name: r'selectingPalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectingPalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectingPal = AsyncNotifier<List<PalEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
