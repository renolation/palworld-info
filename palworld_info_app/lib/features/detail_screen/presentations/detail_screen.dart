import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/features/detail_screen/data/detail_pal_controller.dart';
import 'package:palworld_info_app/utils/constants.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({
    required this.palEntity,
    required this.slug,
    Key? key,
  }) : super(key: key);

  final PalEntity palEntity;
  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailPal = ref.watch(detailPalControllerProvider(slug));
    print('a');
    return Scaffold(
      appBar: AppBar(title: Text(palEntity.name!),),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: detailPal.when(
          data: (data) => ListView(
            children: [
              Container(
                color: Colors.black26,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CachedNetworkImage(imageUrl: palEntity.iconUrl!, width: 200,),
                        Text(palEntity.title!, style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(palEntity.summary!),
                    )),
                  ],
                ),
              ),

              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text('Element:'),
                  for (var element in palEntity.elements!) CachedNetworkImage( imageUrl: element!.iconUrl!, width: 30, ),
                ],
              ),
              Row(
                children: [
                  const Text('Work Suitabilities:'),
                  for (var workSuitability in palEntity.levelWorkSuitability!) Column(
                    children: [
                      CachedNetworkImage( imageUrl: workSuitability.workSuitability!.iconUrl!, width: 30, ),
                      Text(workSuitability.level!.toString()),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  children: [
                    DetailRow(name: 'Size', value: palEntity.size.toString(), isOdd: true,),
                    DetailRow(name: 'Rarity', value: palEntity.rarity.toString(), isOdd: false,),
                    DetailRow(name: 'HP', value: palEntity.hp.toString(), isOdd: true,),
                    DetailRow(name: 'Melee Attack', value: palEntity.meleeAttack.toString(), isOdd: false,),
                    DetailRow(name: 'Magic Attack', value: palEntity.magicAttack.toString(), isOdd: true,),
                    DetailRow(name: 'Defense', value: palEntity.defense.toString(), isOdd: false,),
                    DetailRow(name: 'Support', value: palEntity.support.toString(), isOdd: true,),
                    DetailRow(name: 'Craft Speed', value: palEntity.craftSpeed.toString(), isOdd: false,),
                    DetailRow(name: 'Capture Rate', value: palEntity.captureRate.toString(), isOdd: true,),
                    DetailRow(name: 'Price', value: palEntity.price.toString(), isOdd: false,),
                    DetailRow(name: 'Slow Walk Speed', value: palEntity.slowWalkSpeed.toString(), isOdd: true,),
                    DetailRow(name: 'Run Speed', value: palEntity.runSpeed.toString(), isOdd: false,),
                    DetailRow(name: 'ride Sprint Speed', value: palEntity.rideSprintSpeed.toString(), isOdd: true,),
                    DetailRow(name: 'Food Amount', value: palEntity.foodAmount.toString(), isOdd: false,),
                    DetailRow(name: 'Male Probability', value: palEntity.maleProbability.toString(), isOdd: true,),
                  ],
                ),
              )
            ],
          ),
          error: (err, stack) => Text('Error $err'),
          loading: () => const Text('loading'),
        )
      ),
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
      color: isOdd ? kOddBackground: kEvenBackground,
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
