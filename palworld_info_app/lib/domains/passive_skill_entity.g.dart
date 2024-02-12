// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passive_skill_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PassiveSkillEntityImpl _$$PassiveSkillEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PassiveSkillEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      passiveDesc: (json['passiveDesc'] as List<dynamic>?)
          ?.map((e) => PassiveDescEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PassiveSkillEntityImplToJson(
        _$PassiveSkillEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'passiveDesc': instance.passiveDesc,
    };

_$PassiveDescEntityImpl _$$PassiveDescEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PassiveDescEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      isPositive: json['isPositive'] as bool?,
    );

Map<String, dynamic> _$$PassiveDescEntityImplToJson(
        _$PassiveDescEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isPositive': instance.isPositive,
    };
