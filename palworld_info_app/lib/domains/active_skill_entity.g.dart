// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_skill_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveSkillEntityImpl _$$ActiveSkillEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ActiveSkillEntityImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      power: json['power'] as int?,
      cd: json['cd'] as int?,
      desc: json['desc'] as String?,
      element: json['element'] == null
          ? null
          : ElementEntity.fromJson(json['element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActiveSkillEntityImplToJson(
        _$ActiveSkillEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'power': instance.power,
      'cd': instance.cd,
      'desc': instance.desc,
      'element': instance.element,
    };
