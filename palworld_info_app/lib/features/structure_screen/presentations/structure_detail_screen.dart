import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/structure_entity.dart';

import '../../detail_screen/presentations/detail_screen.dart';

class StructureDetailScreen extends HookConsumerWidget {
  const StructureDetailScreen({
    Key? key,
    required this.structureEntity
  }) : super(key: key);
  final StructureEntity structureEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(structureEntity.name!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),

          child: Column(
            children: [
              Align(alignment: Alignment.topCenter, child: CachedNetworkImage(
                  height: 250,
                  imageUrl: structureEntity.iconUrl!)),
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
                        child: Text(structureEntity.summary!),
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
    addDetailRow(name: 'Structure Type', value: '${structureEntity.structureType}');
    addDetailRow(name: 'Build Work', value: '${structureEntity.buildWork}');
    addDetailRow(name: 'Energy Type', value: '${structureEntity.energyType}');
    addDetailRow(name: 'Consume Energy Speed', value: '${structureEntity.consumeEnergySpeed}');


    return detailRows;
  }

}
