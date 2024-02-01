import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
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
class SelectingPal extends _$SelectingPal {
  @override
  FutureOr<List<PalEntity>> build() {
    final pals = ref.watch(palControllerProvider);
    return pals.value ?? [];
  }
  Future<void> updatePals() async {
    final selectingElements = ref.watch(selectingElementProvider);
    final pals = ref.watch(palControllerProvider);
    List<PalEntity> list = pals.value!
        .where((e) => selectingElements.every((element) => e.elements!.contains(element)))
        .toList();
    if(selectingElements.isEmpty){
      state = AsyncValue.data(pals.value!);
    } else {
      state = AsyncValue.data(list);
    }
  }
}
