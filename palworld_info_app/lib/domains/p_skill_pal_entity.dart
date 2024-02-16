import 'package:freezed_annotation/freezed_annotation.dart';

part 'p_skill_pal_entity.freezed.dart';

part 'p_skill_pal_entity.g.dart';

@freezed
class PSkillPalEntity with _$PSkillPalEntity {
  const factory PSkillPalEntity({
    int? id,
    int? rank,
    PassiveSkill? passiveSkill,
  }) = _PSkillPalEntity;

  factory PSkillPalEntity.fromJson(Map<String, dynamic> json) =>
      _$PSkillPalEntityFromJson(json);
}

@freezed
class PassiveSkill with _$PassiveSkill {
  const factory PassiveSkill({
    int? id,
    String? name,
    List<PassiveDesc>? passiveDesc,
  }) = _PassiveSkill;

  factory PassiveSkill.fromJson(Map<String, dynamic> json) =>
      _$PassiveSkillFromJson(json);
}

@freezed
class PassiveDesc with _$PassiveDesc {
  const factory PassiveDesc({
    int? id,
    String? name,
    bool? isPositive,
  }) = _PassiveDesc;

  factory PassiveDesc.fromJson(Map<String, dynamic> json) =>
      _$PassiveDescFromJson(json);
}
