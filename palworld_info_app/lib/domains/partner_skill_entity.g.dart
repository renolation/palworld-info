// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_skill_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerSkillEntityImpl _$$PartnerSkillEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PartnerSkillEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      partner: json['partner'] == null
          ? null
          : PartnerEntity.fromJson(json['partner'] as Map<String, dynamic>),
      pal: (json['pal'] as List<dynamic>?)
          ?.map((e) => PalEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PartnerSkillEntityImplToJson(
        _$PartnerSkillEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'partner': instance.partner,
      'pal': instance.pal,
    };

_$PartnerEntityImpl _$$PartnerEntityImplFromJson(Map<String, dynamic> json) =>
    _$PartnerEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$$PartnerEntityImplToJson(_$PartnerEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };
