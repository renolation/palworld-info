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
    } else {
      list = pals.value!;
    }
    final sortType = ref.watch(palSortTypeProvider);
    final sortBy = ref.watch(palSortByProvider);
    state = AsyncValue.data(list);
    sortBySelectedType(sortBy,sortType);
  }


  Future<void> sortBySelectedType(SortBy sortBy, SortType sortType) async {
    List<PalEntity> list = [...state.value!];
    if(sortType == SortType.Asc) {
      if(sortBy == SortBy.Name) {
        list.sort((a, b) => a.name!.compareTo(b.name!));
      } else if(sortBy == SortBy.Hp) {
        list.sort((a, b) => a.hp!.compareTo(b.hp!));
      }
    } else {
      if(sortBy == SortBy.Name) {
        list.sort((a, b) => b.name!.compareTo(a.name!));
      } else if(sortBy == SortBy.Hp) {
        list.sort((a, b) => b.hp!.compareTo(a.hp!));
      }
    }

    state = AsyncValue.data(list);
  }
}
