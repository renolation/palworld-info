


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/domains/level_work_suitability_entity.dart';
import 'package:palworld_info_app/domains/partner_skill_entity.dart';

import '../utils/constants.dart';
import 'p_skill_pal_entity.dart';
part 'pal_entity.freezed.dart';
part 'pal_entity.g.dart';

@freezed
class PalEntity with _$PalEntity {
  const factory PalEntity({
    int? id,
    String? name,
    String? title,
    String? slug,
    String? iconUrl,
    String? summary,
    Size? size,
    int? rarity,
    int? hp,
    int? meleeAttack,
    int? magicAttack,
    int? defense,
    int? support,
    int? craftSpeed,
    int? captureRate,
    int? price,
    int? slowWalkSpeed,
    int? runSpeed,
    int? rideSprintSpeed,
    int? foodAmount,
    int? maleProbability,
    List<ElementEntity>? elements,
    List<LevelWorkSuitabilityEntity>? levelWorkSuitability,
    List<PSkillPalEntity>? pSkillPals,
    PartnerSkillEntity? partnerPal,
  }) = _PalEntity;
  factory PalEntity.fromJson(Map<String, dynamic> json) => _$PalEntityFromJson(json);
}

