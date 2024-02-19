import 'package:freezed_annotation/freezed_annotation.dart';

import 'element_entity.dart';

part 'active_skill_entity.freezed.dart';
part 'active_skill_entity.g.dart';

@freezed
class ActiveSkillEntity with _$ActiveSkillEntity {
  const factory ActiveSkillEntity({
    int? id,
    String? name,
    int? power,
    int? cd,
    String? desc,
    ElementEntity? element,
}) = _ActiveSkillEntity;

  factory ActiveSkillEntity.fromJson(Map<String, dynamic> json) =>
      _$ActiveSkillEntityFromJson(json);
}