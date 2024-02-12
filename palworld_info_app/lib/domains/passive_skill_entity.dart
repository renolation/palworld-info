import 'package:freezed_annotation/freezed_annotation.dart';

part 'passive_skill_entity.freezed.dart';
part 'passive_skill_entity.g.dart';

@freezed
class PassiveSkillEntity with _$PassiveSkillEntity {

  const factory PassiveSkillEntity ({
    required int id,
    String? name,
    List<PassiveDescEntity>? passiveDesc,
}) = _PassiveSkillEntity;
  factory PassiveSkillEntity.fromJson(Map<String, dynamic> json) =>
 _$PassiveSkillEntityFromJson(json);
}

@freezed
class PassiveDescEntity with _$PassiveDescEntity {

  const factory PassiveDescEntity ({
    required int id,
    String? name,
    bool? isPositive,

  }) = _PassiveDescEntity;
  factory PassiveDescEntity.fromJson(Map<String, dynamic> json) =>
      _$PassiveDescEntityFromJson(json);
}



