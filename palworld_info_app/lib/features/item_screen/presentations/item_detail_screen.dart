import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/item_entity.dart';
import 'package:palworld_info_app/features/detail_screen/presentations/detail_screen.dart';

import '../../../domains/pal_item_entity.dart';
import '../../../utils/app_router.dart';

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
              Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(
                    imageUrl: itemEntity.iconUrl!,
                    height: 250,
                  )),
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
              Consumer(builder: (context, ref, child) {
                List<PalItemEntity> list = [];
                if(itemEntity.palItems != null && itemEntity.palItems!.isNotEmpty ){
                  list = [...itemEntity.palItems!];
                  list.sort((a, b) {
                    return (a.isBoss! ? 1 : 0).compareTo(b.isBoss! ? 1 : 0);
                  });
                  list.sort((a, b) {
                    return a.pal!.name!.compareTo(b.pal!.name!);
                  });
                }
                return itemEntity.palItems == null || itemEntity.palItems!.isEmpty
                    ? const SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white24,
                            ),
                            // margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Dropped by',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              PalItemEntity palItem = list[index];
                              return InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                      AppRoute.detail.name,
                                      pathParameters: {'slug': palItem.pal!.slug!},
                                      extra: palItem.pal!.name
                                  );
                                  await FirebaseAnalytics.instance.logSelectContent(
                                    contentType: "pal",
                                    itemId: palItem.pal!.slug!,
                                  );
                                },
                                child: Card(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: CachedNetworkImage(imageUrl: palItem.pal!.iconUrl!),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: AutoSizeText(
                                            palItem.pal!.name!,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          )),
                                      palItem.isBoss! ? Positioned(
                                        top: 4,
                                        left: 4,
                                        child: Container(
                                          height: 30,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.yellowAccent.withOpacity(0.8),
                                          ),
                                          child: const Center(
                                              child: AutoSizeText(
                                            'Boss',
                                            style: TextStyle(color: Colors.black),
                                          )),
                                        ),
                                      ) : const SizedBox(),

                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      );
              })
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

    addDetailRow(name: 'Item Type', value: '${itemEntity.itemType}');
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
