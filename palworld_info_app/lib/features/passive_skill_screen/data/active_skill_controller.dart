
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/active_skill_entity.dart';
import 'package:palworld_info_app/domains/partner_skill_entity.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/skills_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_skill_controller.g.dart';

@Riverpod(keepAlive: true)
class ActiveSkillController extends _$ActiveSkillController {
  @override
  FutureOr<List<ActiveSkillEntity>> build() {
    return getActiveSkills();
  }

  Future<List<ActiveSkillEntity>> getActiveSkills(){
    final homeRepository = ref.watch(skillsRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getActiveSkillEntity(
      cancelToken: cancelToken,
    );
  }
}