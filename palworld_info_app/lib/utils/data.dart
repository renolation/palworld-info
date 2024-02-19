import 'package:palworld_info_app/domains/work_suitability_entity.dart';

import '../domains/element_entity.dart';

const elementJson = [
  {
    "id": 1,
    "name": "Dark",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_05.webp"
  },
  {
    "id": 2,
    "name": "Dragon",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_06.webp"
  },
  {
    "id": 3,
    "name": "Earth",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_07.webp"
  },
  {
    "id": 4,
    "name": "Electricity",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_03.webp"
  },
  {
    "id": 5,
    "name": "Fire",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_01.webp"
  },
  {
    "id": 6,
    "name": "Ice",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_08.webp"
  },
  {
    "id": 7,
    "name": "Leaf",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_04.webp"
  },
  {
    "id": 8,
    "name": "Normal",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_00.webp"
  },
  {
    "id": 9,
    "name": "Water",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_Icon_element_s_02.webp"
  }
];
const workJson = [
  {
    "id": 1,
    "name": "Anyone",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_13.webp"
  },
  {
    "id": 2,
    "name": "Collection",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_05.webp"
  },
  {
    "id": 3,
    "name": "Cool",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_10.webp"
  },
  {
    "id": 4,
    "name": "Deforest",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_06.webp"
  },
  {
    "id": 5,
    "name": "EmitFlame",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_00.webp"
  },
  {
    "id": 6,
    "name": "GenerateElectricity",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_03.webp"
  },
  {
    "id": 7,
    "name": "Handcraft",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_04.webp"
  },
  {
    "id": 8,
    "name": "Mining",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_07.webp"
  },
  {
    "id": 9,
    "name": "MonsterFarm",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_12.webp"
  },
  {
    "id": 10,
    "name": "OilExtraction",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_09.webp"
  },
  {
    "id": 11,
    "name": "ProductMedicine",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_08.webp"
  },
  {
    "id": 12,
    "name": "Seeding",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_02.webp"
  },
  {
    "id": 13,
    "name": "Transport",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_11.webp"
  },
  {
    "id": 14,
    "name": "Watering",
    "iconUrl": "https://assets.palworldtrainer.com/images/T_icon_palwork_01.webp"
  }
];
final elementList = elementJson.map((e) => ElementEntity(
    id: e['id'] as int,
    name: e['name'] as String?,
    iconUrl: e['iconUrl'] as String?
)).toList();

final workList = elementJson.map((e) => WorkSuitabilityEntity(
    id: e['id'] as int,
    name: e['name'] as String?,
    iconUrl: e['iconUrl'] as String?
)).toList();