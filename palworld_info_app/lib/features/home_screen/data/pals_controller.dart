import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/domains/work_suitability_entity.dart';
import 'package:palworld_info_app/features/home_screen/data/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pals_controller.g.dart';

@Riverpod(keepAlive: true)
class PalController extends _$PalController {
  @override
  FutureOr<List<PalEntity>> build() {
    return getPals();
  }

  Future<List<PalEntity>> getPals() {
    final homeRepository = ref.watch(homeRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getPals(
      cancelToken: cancelToken,
    );
  }

}

@Riverpod(keepAlive: true)
class SelectingElement extends _$SelectingElement {
  @override
  List<ElementEntity> build() {
    return [];
  }

  add(ElementEntity element) {
    state = [...state, element];
  }

  remove(int elementID) {
    state = state.where((e) => e.id != elementID).toList();
  }
}

@Riverpod(keepAlive: true)
class SelectingWorkSuitability extends _$SelectingWorkSuitability {
  @override
  List<WorkSuitabilityEntity> build() {
    return [];
  }
  add(WorkSuitabilityEntity workSuitabilityEntity) {
    state = [...state, workSuitabilityEntity];
  }
  remove(int workSuitabilityEntityID) {
    state = state.where((e) => e.id != workSuitabilityEntityID).toList();
  }
}

@Riverpod(keepAlive: true)
class SelectingPal extends _$SelectingPal {
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

    state = AsyncValue.data(list);
  }
}
