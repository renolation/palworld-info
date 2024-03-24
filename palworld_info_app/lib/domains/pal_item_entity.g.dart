// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pal_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PalItemEntityImpl _$$PalItemEntityImplFromJson(Map<String, dynamic> json) =>
    _$PalItemEntityImpl(
      id: json['id'] as int?,
      itemCount: json['itemCount'] as String?,
      chance: json['chance'] as int?,
      isBoss: json['isBoss'] as bool?,
      pal: json['pal'] == null
          ? null
          : PalEntity.fromJson(json['pal'] as Map<String, dynamic>),
      item: json['item'] == null
          ? null
          : ItemEntity.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PalItemEntityImplToJson(_$PalItemEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemCount': instance.itemCount,
      'chance': instance.chance,
      'isBoss': instance.isBoss,
      'pal': instance.pal,
      'item': instance.item,
    };
