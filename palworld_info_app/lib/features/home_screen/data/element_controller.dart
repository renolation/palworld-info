
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/features/home_screen/data/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'element_controller.g.dart';

@Riverpod(keepAlive: true)
class ElementController extends _$ElementController {
  @override
  FutureOr<List<ElementEntity>> build() {
    return getElements();
  }

  Future<List<ElementEntity>> getElements(){
    final homeRepository = ref.watch(homeRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getElements(
      cancelToken: cancelToken,
    );
  }
}
