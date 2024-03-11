import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palworld_info_app/utils/constants.dart';

part 'structure_entity.freezed.dart';
part 'structure_entity.g.dart';

@freezed
class StructureEntity with _$StructureEntity {

  const factory StructureEntity({
    int? id,
    String? name,
    String? slug,
    String? iconUrl,
    String? summary,
    String? structureType,
    int? buildWork,
    String? energyType,
    int? consumeEnergySpeed,
  }) = _StructureEntity;

  factory StructureEntity.fromJson(Map<String, dynamic> json) =>
      _$StructureEntityFromJson(json);
}