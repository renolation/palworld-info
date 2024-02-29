import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/features/detail_screen/data/detail_pal_controller.dart';
import 'package:palworld_info_app/utils/constants.dart';

import '../../../providers/ads_provider.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({
    // required this.palEntity,
    required this.slug,
    required this.name,
    Key? key,
  }) : super(key: key);

  // final PalEntity palEntity;
  final String slug;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailPal = ref.watch(detailPalControllerProvider(slug));
    print('a');
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: detailPal.when(
              data: (data) {
                PalEntity palEntity = data;
                return ListView(
                  children: [
                    Container(
                      color: Colors.black26,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: palEntity.iconUrl!,
                                width: 200,
                              ),
                              Text(
                                palEntity.title!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(palEntity.summary!),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Element: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        for (var element in palEntity.elements!)
                          CachedNetworkImage(
                            imageUrl: element!.iconUrl!,
                            width: 30,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Work Suitabilities: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        for (var workSuitability
                            in palEntity.levelWorkSuitability!)
                          Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    workSuitability.workSuitability!.iconUrl!,
                                width: 30,
                              ),
                              Text(workSuitability.level!.toString()),
                            ],
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          DetailRow(
                            name: 'Size',
                            value: palEntity.size.toString(),
                            isOdd: true,
                          ),
                          DetailRow(
                            name: 'Rarity',
                            value: palEntity.rarity.toString(),
                            isOdd: false,
                          ),
                          DetailRow(
                            name: 'HP',
                            value: palEntity.hp.toString(),
                            isOdd: true,
                          ),
                          DetailRow(
                            name: 'Melee Attack',
                            value: palEntity.meleeAttack.toString(),
                            isOdd: false,
                          ),
                          DetailRow(
                            name: 'Magic Attack',
                            value: palEntity.magicAttack.toString(),
                            isOdd: true,
                          ),
                          DetailRow(
                            name: 'Defense',
                            value: palEntity.defense.toString(),
                            isOdd: false,
                          ),
                          DetailRow(
                            name: 'Support',
                            value: palEntity.support.toString(),
                            isOdd: true,
                          ),
                          DetailRow(
                            name: 'Craft Speed',
                            value: palEntity.craftSpeed.toString(),
                            isOdd: false,
                          ),
                          DetailRow(
                            name: 'Capture Rate',
                            value: palEntity.captureRate.toString(),
                            isOdd: true,
                          ),
                          DetailRow(
                            name: 'Price',
                            value: palEntity.price.toString(),
                            isOdd: false,
                          ),
                          DetailRow(
                            name: 'Slow Walk Speed',
                            value: palEntity.slowWalkSpeed.toString(),
                            isOdd: true,
                          ),
                          DetailRow(
                            name: 'Run Speed',
                            value: palEntity.runSpeed.toString(),
                            isOdd: false,
                          ),
                          DetailRow(
                            name: 'ride Sprint Speed',
                            value: palEntity.rideSprintSpeed.toString(),
                            isOdd: true,
                          ),
                          DetailRow(
                            name: 'Food Amount',
                            value: palEntity.foodAmount.toString(),
                            isOdd: false,
                          ),
                          DetailRow(
                            name: 'Male Probability',
                            value: palEntity.maleProbability.toString(),
                            isOdd: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text('Partner Skill', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          ),
                          Container(
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
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
                                    color: Colors.white30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(imageUrl: data.partnerPal!.partner!.iconUrl!, height: 36,fit: BoxFit.contain,),
                                      Text(data.partnerPal!.name!,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                  child: Text(data.partnerPal!.description!),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    data.pSkillPals!.isEmpty ? const SizedBox() :SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text('Passive Skills', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          ),
                          for(var pSkillPal in data.pSkillPals!)
                            Container(
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
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
                                      color: Colors.white30,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(pSkillPal!.passiveSkill!.name!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                        Text('Rank ${pSkillPal!.rank!}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  for(var item in pSkillPal!.passiveSkill!.passiveDesc!) Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    child: Text(item.name!),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    //region active skill

                    SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text('Partner Skill', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          ),
                          for(var item in data.activeSkillsPal!)
                            Container(
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
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
                                      color: Colors.white30,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(imageUrl: item.activeSkill!.element!.iconUrl!, height: 32,fit: BoxFit.contain,),
                                        SizedBox(width: 4,),
                                        Text(item.activeSkill!.name!,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                        Spacer(),
                                        Text("Lvl: ${item.level!}",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    child: Text('Power ${item.activeSkill!.power} \nCooldown: ${item.activeSkill!.cd}\nRange: ${item.range}'),
                                  ),
                                ],
                              ),
                            ),

                        ],
                      ),
                    ),

                    //endregion
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
              error: (err, stack) => Text('Error $err'),
              loading: () => Center(
                    child: LoadingAnimationWidget.dotsTriangle(
                      color: Colors.white,
                      size: 70,
                    ),
                  ))),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.name,
    required this.value,
    this.isOdd = false,
  });

  final String name;
  final String value;
  final bool isOdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isOdd ? kOddBackground : kEvenBackground,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
