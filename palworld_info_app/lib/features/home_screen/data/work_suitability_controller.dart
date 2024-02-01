
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/domains/work_suitability_entity.dart';
import 'package:palworld_info_app/features/home_screen/data/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_suitability_controller.g.dart';

@Riverpod(keepAlive: true)
class WorkSuitabilityController extends _$WorkSuitabilityController {
  @override
  FutureOr<List<WorkSuitabilityEntity>> build() {
    return getWorks();
  }

  Future<List<WorkSuitabilityEntity>> getWorks(){
    final homeRepository = ref.watch(homeRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getWorkSuitabilities(
      cancelToken: cancelToken,
    );
  }
}
