// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StructureEntityImpl _$$StructureEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$StructureEntityImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      iconUrl: json['iconUrl'] as String?,
      summary: json['summary'] as String?,
      structureType: json['structureType'] as String?,
      buildWork: json['buildWork'] as int?,
      energyType: json['energyType'] as String?,
      consumeEnergySpeed: json['consumeEnergySpeed'] as int?,
    );

Map<String, dynamic> _$$StructureEntityImplToJson(
        _$StructureEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'iconUrl': instance.iconUrl,
      'summary': instance.summary,
      'structureType': instance.structureType,
      'buildWork': instance.buildWork,
      'energyType': instance.energyType,
      'consumeEnergySpeed': instance.consumeEnergySpeed,
    };
