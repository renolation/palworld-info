import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/item_entity.dart';
import 'package:palworld_info_app/features/detail_screen/presentations/detail_screen.dart';

class ItemDetailScreen extends HookConsumerWidget {
  const ItemDetailScreen({Key? key, required this.itemEntity}) : super(key: key);
  final ItemEntity itemEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemEntity.name!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Align(alignment: Alignment.topCenter, child: CachedNetworkImage(imageUrl: itemEntity.iconUrl!)),
              ...getDetailRows(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black26,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0)),
                          color: Colors.white30,
                        ),
                        child: const Text(
                          'Summary',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Text(itemEntity.summary!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getDetailRows() {
    int i = 0;
    List<Widget> detailRows = [];

    addDetailRow({String? name, String? value}) {
      if (value != "null") {
        detailRows.add(DetailRow(name: name!, value: value!, isOdd: i % 2 == 0));
        i++;
      }
    }

    addDetailRow(name: 'Rank', value: '${itemEntity.rank}');
    addDetailRow(name: 'Rarity', value: '${itemEntity.rarity}');
    addDetailRow(name: 'Price', value: '${itemEntity.price}');
    addDetailRow(name: 'Weight', value: '${itemEntity.weight}');
    addDetailRow(name: 'Max Stack Count', value: '${itemEntity.maxStackCount}');
    addDetailRow(name: 'Phys Attack', value: '${itemEntity.physAttack}');
    addDetailRow(name: 'Durability', value: '${itemEntity.durability}');
    addDetailRow(name: 'Restore Concentration', value: '${itemEntity.restoreConcentration}');
    addDetailRow(name: 'Restore Satiety', value: '${itemEntity.restoreSatiety}');
    addDetailRow(name: 'Passive Skill', value: '${itemEntity.passiveSkill}');

    return detailRows;
  }
}
