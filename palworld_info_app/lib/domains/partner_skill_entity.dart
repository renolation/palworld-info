
import 'package:freezed_annotation/freezed_annotation.dart';

import 'pal_entity.dart';

part 'partner_skill_entity.freezed.dart';
part 'partner_skill_entity.g.dart';


@freezed
class PartnerSkillEntity with _$PartnerSkillEntity {
  const factory PartnerSkillEntity({
    required int id,
    String? name,
    String? description,
    PartnerEntity? partner,
    List<PalEntity>? pal,
}) = _PartnerSkillEntity;

  factory PartnerSkillEntity.fromJson(Map<String, dynamic> json) =>
      _$PartnerSkillEntityFromJson(json);
}


@freezed
class PartnerEntity with _$PartnerEntity {
  const factory PartnerEntity({
    required int id,
    String? name,
    String? iconUrl,
}) = _PartnerEntity;

  factory PartnerEntity.fromJson(Map<String, dynamic> json) =>
      _$PartnerEntityFromJson(json);
}