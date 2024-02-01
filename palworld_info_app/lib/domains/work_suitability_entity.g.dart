// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_suitability_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkSuitabilityEntityImpl _$$WorkSuitabilityEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkSuitabilityEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      iconUrl: json['iconUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$WorkSuitabilityEntityImplToJson(
        _$WorkSuitabilityEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };
