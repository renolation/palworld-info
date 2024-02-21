// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_skill_pal_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveSkillPalEntityImpl _$$ActiveSkillPalEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ActiveSkillPalEntityImpl(
      id: json['id'] as int?,
      range: json['range'] as String?,
      level: json['level'] as int?,
      activeSkill: json['activeSkill'] == null
          ? null
          : ActiveSkillEntity.fromJson(
              json['activeSkill'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActiveSkillPalEntityImplToJson(
        _$ActiveSkillPalEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'range': instance.range,
      'level': instance.level,
      'activeSkill': instance.activeSkill,
    };
