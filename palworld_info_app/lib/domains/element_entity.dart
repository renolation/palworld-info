import 'package:freezed_annotation/freezed_annotation.dart';


part 'element_entity.freezed.dart';
part 'element_entity.g.dart';

@freezed
class ElementEntity with _$ElementEntity  {

  const factory ElementEntity({

    required int id,
    @Default('') String? name,
    @Default('') String? iconUrl,


  }) = _ElementEntity;


  factory ElementEntity.fromJson(Map<String, dynamic> json) =>
      _$ElementEntityFromJson(json);
}

