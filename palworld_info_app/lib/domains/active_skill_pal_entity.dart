import 'package:freezed_annotation/freezed_annotation.dart';

import 'active_skill_entity.dart';

part 'active_skill_pal_entity.freezed.dart';
part 'active_skill_pal_entity.g.dart';

@freezed
class ActiveSkillPalEntity with _$ActiveSkillPalEntity {
  const factory ActiveSkillPalEntity({
    int? id,
    String? range,
    int? level,
    ActiveSkillEntity? activeSkill,
  }) = _ActiveSkillPalEntity;

  factory ActiveSkillPalEntity.fromJson(Map<String, dynamic> json) =>
      _$ActiveSkillPalEntityFromJson(json);
}