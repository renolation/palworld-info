
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

  Future<List<PalEntity>> getPals(){
    final homeRepository = ref.watch(homeRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getPals(
      cancelToken: cancelToken,
    );
  }
}
