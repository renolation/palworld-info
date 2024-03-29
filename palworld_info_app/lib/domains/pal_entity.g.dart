// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pal_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PalEntityImpl _$$PalEntityImplFromJson(Map<String, dynamic> json) =>
    _$PalEntityImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      iconUrl: json['iconUrl'] as String?,
      summary: json['summary'] as String?,
      size: $enumDecodeNullable(_$SizeEnumMap, json['size']),
      rarity: json['rarity'] as int?,
      hp: json['hp'] as int?,
      meleeAttack: json['meleeAttack'] as int?,
      magicAttack: json['magicAttack'] as int?,
      defense: json['defense'] as int?,
      support: json['support'] as int?,
      craftSpeed: json['craftSpeed'] as int?,
      captureRate: json['captureRate'] as int?,
      price: json['price'] as int?,
      slowWalkSpeed: json['slowWalkSpeed'] as int?,
      runSpeed: json['runSpeed'] as int?,
      rideSprintSpeed: json['rideSprintSpeed'] as int?,
      foodAmount: json['foodAmount'] as int?,
      maleProbability: json['maleProbability'] as int?,
      elements: (json['elements'] as List<dynamic>?)
          ?.map((e) => ElementEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      levelWorkSuitability: (json['levelWorkSuitability'] as List<dynamic>?)
          ?.map((e) =>
              LevelWorkSuitabilityEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pSkillPals: (json['pSkillPals'] as List<dynamic>?)
          ?.map((e) => PSkillPalEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      partnerPal: json['partnerPal'] == null
          ? null
          : PartnerSkillEntity.fromJson(
              json['partnerPal'] as Map<String, dynamic>),
      activeSkillsPal: (json['activeSkillsPal'] as List<dynamic>?)
          ?.map((e) => ActiveSkillPalEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      palItems: (json['palItems'] as List<dynamic>?)
          ?.map((e) => PalItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PalEntityImplToJson(_$PalEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'slug': instance.slug,
      'iconUrl': instance.iconUrl,
      'summary': instance.summary,
      'size': _$SizeEnumMap[instance.size],
      'rarity': instance.rarity,
      'hp': instance.hp,
      'meleeAttack': instance.meleeAttack,
      'magicAttack': instance.magicAttack,
      'defense': instance.defense,
      'support': instance.support,
      'craftSpeed': instance.craftSpeed,
      'captureRate': instance.captureRate,
      'price': instance.price,
      'slowWalkSpeed': instance.slowWalkSpeed,
      'runSpeed': instance.runSpeed,
      'rideSprintSpeed': instance.rideSprintSpeed,
      'foodAmount': instance.foodAmount,
      'maleProbability': instance.maleProbability,
      'elements': instance.elements,
      'levelWorkSuitability': instance.levelWorkSuitability,
      'pSkillPals': instance.pSkillPals,
      'partnerPal': instance.partnerPal,
      'activeSkillsPal': instance.activeSkillsPal,
      'palItems': instance.palItems,
    };

const _$SizeEnumMap = {
  Size.L: 'L',
  Size.M: 'M',
  Size.S: 'S',
  Size.XL: 'XL',
  Size.XS: 'XS',
};
