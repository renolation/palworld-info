import 'dart:async';

import 'package:palworld_info_app/features/home_screen/data/pals_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domains/element_entity.dart';
import '../../../domains/pal_entity.dart';
import '../../../providers/providers.dart';
import '../../../utils/constants.dart';

part 'selecting_pal_controller.g.dart';


@Riverpod(keepAlive: true)
class SelectingPalController extends _$SelectingPalController {
  

  @override
  FutureOr<List<PalEntity>> build() {
    final pals = ref.watch(palControllerProvider);
    return pals.value ?? [];
  }


  Future<void> updatePals() async {
    final selectingElements = ref.watch(selectingElementProvider);
    final selectingWorkSuitabilities = ref.watch(selectingWorkSuitabilityProvider);
    final pals = ref.watch(palControllerProvider);

    List<PalEntity> list = [];

    if(selectingElements.isEmpty && selectingWorkSuitabilities.isNotEmpty) {
      list = pals.value!
          .where((e) => e.levelWorkSuitability!
          .where((workSuitLevel) => selectingWorkSuitabilities.contains(workSuitLevel.workSuitability)).length >= selectingWorkSuitabilities.length)
          .toList();
    } else if(selectingWorkSuitabilities.isEmpty && selectingElements.isNotEmpty) {
      list = pals.value!
          .where((e) => selectingElements.every((element) => e.elements!.contains(element)))
          .toList();
    } else if(selectingElements.isNotEmpty && selectingWorkSuitabilities.isNotEmpty) {
      list = pals.value!
          .where((e) => selectingElements.every((element) => e.elements!.contains(element))
          && e.levelWorkSuitability!
              .where((workSuitLevel) => selectingWorkSuitabilities.contains(workSuitLevel.workSuitability)).length >= selectingWorkSuitabilities.length)
          .toList();
    }
    final sortType = ref.watch(palSortTypeProvider);
    sortBySelectedType(list, sortType);

    state = AsyncValue.data(list);
  }


  Future<void> sortBySelectedType(List<PalEntity> list, SortBy sortType) async {
    if(sortType == SortBy.Name) {
      list.sort((a, b) => a.name!.compareTo(b.name!));
    } else if(sortType == SortBy.Hp) {
      list.sort((a, b) => a.hp!.compareTo(b.hp!));
    }
    state = AsyncValue.data(list);
  }
}
