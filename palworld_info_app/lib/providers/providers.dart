import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
      // ref.read(interstitialAdProvider).showInterstitialAd();
    }
  }
}

final nativeAdLoadStateProvider = StateProvider.autoDispose<bool>((ref) => false);

final filterPalTextState = StateProvider<String>((ref) => '');
