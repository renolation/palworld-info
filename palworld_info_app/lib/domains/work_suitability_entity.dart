import 'package:freezed_annotation/freezed_annotation.dart';


part 'work_suitability_entity.freezed.dart';
part 'work_suitability_entity.g.dart';

@freezed
class WorkSuitabilityEntity with _$WorkSuitabilityEntity  {

  const factory WorkSuitabilityEntity({

    required int id,
    @Default('') String? name,
    @Default('') String? iconUrl,


  }) = _WorkSuitabilityEntity;


  factory WorkSuitabilityEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkSuitabilityEntityFromJson(json);
}

