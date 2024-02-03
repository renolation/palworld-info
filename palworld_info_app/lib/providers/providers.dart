import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/constants.dart';

part 'providers.g.dart';



@Riverpod(keepAlive: true)
class PalSortBy extends _$PalSortBy {
  @override
  SortBy build() {
    return SortBy.Name;
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

final nativeAdLoadStateProvider = StateProvider.autoDispose<bool>((ref) => false);