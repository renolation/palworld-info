// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEntityImpl _$$ItemEntityImplFromJson(Map<String, dynamic> json) =>
    _$ItemEntityImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      iconUrl: json['iconUrl'] as String?,
      summary: json['summary'] as String?,
      itemType: json['itemType'] as String?,
      rank: json['rank'] as int?,
      rarity: json['rarity'] as int?,
      price: json['price'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      maxStackCount: json['maxStackCount'] as int?,
      physAttack: json['physAttack'] as int?,
      durability: json['durability'] as int?,
      restoreConcentration: json['restoreConcentration'] as int?,
      restoreSatiety: json['restoreSatiety'] as int?,
      passiveSkill: json['passiveSkill'] as String?,
    );

Map<String, dynamic> _$$ItemEntityImplToJson(_$ItemEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'iconUrl': instance.iconUrl,
      'summary': instance.summary,
      'itemType': instance.itemType,
      'rank': instance.rank,
      'rarity': instance.rarity,
      'price': instance.price,
      'weight': instance.weight,
      'maxStackCount': instance.maxStackCount,
      'physAttack': instance.physAttack,
      'durability': instance.durability,
      'restoreConcentration': instance.restoreConcentration,
      'restoreSatiety': instance.restoreSatiety,
      'passiveSkill': instance.passiveSkill,
    };
