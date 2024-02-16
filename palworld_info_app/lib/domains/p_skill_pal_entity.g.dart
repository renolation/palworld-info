// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_skill_pal_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PSkillPalEntityImpl _$$PSkillPalEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PSkillPalEntityImpl(
      id: json['id'] as int?,
      rank: json['rank'] as int?,
      passiveSkill: json['passiveSkill'] == null
          ? null
          : PassiveSkill.fromJson(json['passiveSkill'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PSkillPalEntityImplToJson(
        _$PSkillPalEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'passiveSkill': instance.passiveSkill,
    };

_$PassiveSkillImpl _$$PassiveSkillImplFromJson(Map<String, dynamic> json) =>
    _$PassiveSkillImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      passiveDesc: (json['passiveDesc'] as List<dynamic>?)
          ?.map((e) => PassiveDesc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PassiveSkillImplToJson(_$PassiveSkillImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'passiveDesc': instance.passiveDesc,
    };

_$PassiveDescImpl _$$PassiveDescImplFromJson(Map<String, dynamic> json) =>
    _$PassiveDescImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isPositive: json['isPositive'] as bool?,
    );

Map<String, dynamic> _$$PassiveDescImplToJson(_$PassiveDescImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isPositive': instance.isPositive,
    };
