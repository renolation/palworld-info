import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/item_screen/data/item_controller.dart';
import '../utils/constants.dart';
import 'ads_provider.dart';

part 'providers.g.dart';



@Riverpod(keepAlive: true)
class PalSortBy extends _$PalSortBy {
  @override
  SortBy build() {
    return SortBy.name;
  }

  void update(SortBy sortBy) {
    state = sortBy;
  }
}

@Riverpod(keepAlive: true)
class PalSortType extends _$PalSortType {
  @override
  SortType build() {
    return SortType.Asc;
  }

  void update(SortType sortType) {
    state = sortType;
  }
}

@Riverpod(keepAlive: true)
class CountAd extends _$CountAd {
  @override
  int build() {
    return 0;
  }

  void update() {
    state = state+1;
    if(state%3 ==0){
      ref.read(interstitialAdProvider).showInterstitialAd();
    }
  }
}

final nativeAdLoadStateProvider = StateProvider.autoDispose<bool>((ref) => false);

final filterPalTextState = StateProvider<String>((ref) => '');
final filterBreedingPalTextState = StateProvider<String>((ref) => '');

@Riverpod(keepAlive: true)
class ItemTypes extends _$ItemTypes {
  @override
  List<ItemType> build() {
    return [];
  }
  void toggle(ItemType itemType) {
    if(state.contains(itemType)){
      state = state.where((item) => item != itemType).toList();
    } else {
      state = [...state, itemType];
    }

  }
}

@Riverpod(keepAlive: true)
class StructuresType extends _$StructuresType {
  @override
  List<StructureType> build() {
    return [];
  }
  void toggle(StructureType structureType) {
    if(state.contains(structureType)){
      state = state.where((item) => item != structureType).toList();
    } else {
      state = [...state, structureType];
    }

  }
}
