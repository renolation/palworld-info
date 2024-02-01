import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palworld_info_app/domains/work_suitability_entity.dart';


part 'level_work_suitability_entity.freezed.dart';
part 'level_work_suitability_entity.g.dart';

@freezed
class LevelWorkSuitabilityEntity with _$LevelWorkSuitabilityEntity  {

  const factory LevelWorkSuitabilityEntity({

    required int id,
    int? level,
    required WorkSuitabilityEntity? workSuitability,


  }) = _LevelWorkSuitabilityEntity;


  factory LevelWorkSuitabilityEntity.fromJson(Map<String, dynamic> json) =>
      _$LevelWorkSuitabilityEntityFromJson(json);
}

