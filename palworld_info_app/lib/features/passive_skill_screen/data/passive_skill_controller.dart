
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/domains/passive_skill_entity.dart';
import 'package:palworld_info_app/features/home_screen/data/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'passive_skill_controller.g.dart';

@Riverpod(keepAlive: true)
class PassiveSkillController extends _$PassiveSkillController {
  @override
  FutureOr<List<PassiveSkillEntity>> build() {
    return getElements();
  }

  Future<List<PassiveSkillEntity>> getElements(){
    final homeRepository = ref.watch(homeRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getPassiveSkillEntity(
      cancelToken: cancelToken,
    );
  }
}
