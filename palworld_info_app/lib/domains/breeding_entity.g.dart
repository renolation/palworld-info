// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeding_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreedingEntityImpl _$$BreedingEntityImplFromJson(Map<String, dynamic> json) =>
    _$BreedingEntityImpl(
      id: json['id'] as int,
      parent1: json['parent1'] as String? ?? '',
      parent2: json['parent2'] as String? ?? '',
      child: json['child'] as String? ?? '',
    );

Map<String, dynamic> _$$BreedingEntityImplToJson(
        _$BreedingEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent1': instance.parent1,
      'parent2': instance.parent2,
      'child': instance.child,
    };
