import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeding_entity.g.dart';
part 'breeding_entity.freezed.dart';

@freezed
class BreedingEntity with _$BreedingEntity  {

  const factory BreedingEntity({

    required int id,
    @Default('') String? parent1,
    @Default('') String? parent2,
    @Default('') String? child,


  }) = _BreedingEntity;


  factory BreedingEntity.fromJson(Map<String, dynamic> json) =>
      _$BreedingEntityFromJson(json);
}
