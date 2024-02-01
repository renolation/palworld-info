// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_work_suitability_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LevelWorkSuitabilityEntityImpl _$$LevelWorkSuitabilityEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LevelWorkSuitabilityEntityImpl(
      id: json['id'] as int,
      level: json['level'] as int?,
      workSuitability: json['workSuitability'] == null
          ? null
          : WorkSuitabilityEntity.fromJson(
              json['workSuitability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LevelWorkSuitabilityEntityImplToJson(
        _$LevelWorkSuitabilityEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'workSuitability': instance.workSuitability,
    };
