import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/domains/work_suitability_entity.dart';
import 'package:palworld_info_app/features/home_screen/data/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../providers/providers.dart';
import '../../../utils/constants.dart';

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

