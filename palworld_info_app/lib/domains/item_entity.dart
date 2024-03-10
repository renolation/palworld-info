import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';
part 'item_entity.g.dart';

@freezed
class ItemEntity with _$ItemEntity {

  const factory ItemEntity({
    int? id,
    String? name,
    String? slug,
    String? iconUrl,
    String? summary,
    String? itemType,
    int? rank,
    int? rarity,
    int? price,
    double? weight,
    int? maxStackCount,
    int? physAttack,
    int? durability,
    int? restoreConcentration,
    int? restoreSatiety,
    String? passiveSkill
  }) = _ItemEntity;

  factory ItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemEntityFromJson(json);
}