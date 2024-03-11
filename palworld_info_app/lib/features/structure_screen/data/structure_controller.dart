
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/structure_entity.dart';
import 'package:palworld_info_app/features/structure_screen/data/structure_repository.dart';
import 'package:palworld_info_app/providers/providers.dart';
import 'package:palworld_info_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'structure_controller.g.dart';

@Riverpod(keepAlive: true)
class StructureController extends _$StructureController {
  @override
  FutureOr<List<StructureEntity>> build() async {
    return getStructures();
  }

  FutureOr<List<StructureEntity>> getStructures() async {
    final structureRepository = ref.watch(structureRepositoryProvider);
    final cancelToken = CancelToken();
    return structureRepository.getStructures(
      cancelToken: cancelToken,
    );
  }

}