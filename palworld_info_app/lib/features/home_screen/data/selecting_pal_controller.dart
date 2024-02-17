import 'dart:async';

import 'package:dio/dio.dart';
import 'package:palworld_info_app/features/home_screen/data/pals_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domains/element_entity.dart';
import '../../../domains/pal_entity.dart';
import '../../../providers/providers.dart';
import '../../../utils/constants.dart';
import 'home_repository.dart';

part 'selecting_pal_controller.g.dart';


@Riverpod(keepAlive: true)
class SelectingPalController extends _$SelectingPalController {

  @override
  FutureOr<List<PalEntity>> build() {
    // return getPals();
    final pals = ref.watch(palControllerProvider);
    return pals.value ?? [];
  }

  Future<List<PalEntity>> getPals() async {
    final homeRepository = ref.watch(homeRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getPals(
      cancelToken: cancelToken,
    );
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
      if(sortBy == SortBy.name) {
        list.sort((a, b) => a.name!.compareTo(b.name!));
      } else if(sortBy == SortBy.size) {
        list.sort((a, b) => a.size!.index.compareTo(b.size!.index));
      } else if(sortBy == SortBy.hp) {
        list.sort((a, b) => a.hp!.compareTo(b.hp!));
      } else if(sortBy == SortBy.rarity) {
        list.sort((a, b) => a.rarity!.compareTo(b.rarity!));
      } else if(sortBy == SortBy.meleeAttack) {
        list.sort((a, b) => a.meleeAttack!.compareTo(b.meleeAttack!));
      } else if(sortBy == SortBy.magicAttack) {
        list.sort((a, b) => a.magicAttack!.compareTo(b.magicAttack!));
      } else if(sortBy == SortBy.defense) {
        list.sort((a, b) => a.defense!.compareTo(b.defense!));
      } else if(sortBy == SortBy.rideSprintSpeed) {
        list.sort((a, b) => a.rideSprintSpeed!.compareTo(b.rideSprintSpeed!));
      }
    } else {
      if(sortBy == SortBy.name) {
        list.sort((a, b) => b.name!.compareTo(a.name!));
      } else if(sortBy == SortBy.size) {
        list.sort((a, b) => b.size!.index.compareTo(a.size!.index));
      } else if(sortBy == SortBy.hp) {
        list.sort((a, b) => b.hp!.compareTo(a.hp!));
      } else if(sortBy == SortBy.rarity) {
        list.sort((a, b) => b.rarity!.compareTo(a.rarity!));
      } else if(sortBy == SortBy.meleeAttack) {
        list.sort((a, b) => b.meleeAttack!.compareTo(a.meleeAttack!));
      } else if(sortBy == SortBy.magicAttack) {
        list.sort((a, b) => b.magicAttack!.compareTo(a.magicAttack!));
      } else if(sortBy == SortBy.defense) {
        list.sort((a, b) => b.defense!.compareTo(a.defense!));
      } else if(sortBy == SortBy.rideSprintSpeed) {
        list.sort((a, b) => b.rideSprintSpeed!.compareTo(a.rideSprintSpeed!));
      }
    }
    state = AsyncValue.data(list);
  }
}
