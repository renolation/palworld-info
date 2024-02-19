
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/partner_skill_entity.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/skills_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_skill_controller.g.dart';

@Riverpod(keepAlive: true)
class PartnerSkillController extends _$PartnerSkillController {
  @override
  FutureOr<List<PartnerSkillEntity>> build() {
    return getPartnerSkills();
  }

  Future<List<PartnerSkillEntity>> getPartnerSkills(){
    final homeRepository = ref.watch(skillsRepositoryProvider);
    final cancelToken = CancelToken();
    return homeRepository.getPartnerSkillEntity(
      cancelToken: cancelToken,
    );
  }
}