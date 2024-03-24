import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palworld_info_app/domains/item_entity.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';


part 'pal_item_entity.freezed.dart';
part 'pal_item_entity.g.dart';

@freezed
class PalItemEntity with _$PalItemEntity {
  const factory PalItemEntity({
    int? id,
    String? itemCount,
    int? chance,
    bool? isBoss,
    PalEntity? pal,
    ItemEntity? item,
  }) = _PalItemEntity;

  factory PalItemEntity.fromJson(Map<String, dynamic> json) =>
      _$PalItemEntityFromJson(json);
}