import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:palworld_info_app/domains/active_skill_entity.dart';
import 'package:palworld_info_app/domains/partner_skill_entity.dart';
import 'package:palworld_info_app/domains/passive_skill_entity.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/active_skill_controller.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/partner_skill_controller.dart';
import 'package:palworld_info_app/features/passive_skill_screen/data/passive_skill_controller.dart';

class PassiveSkillScreen extends HookConsumerWidget {
  const PassiveSkillScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabBarController = useTabController(initialLength: 3);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
        bottom: TabBar(
          controller: tabBarController,
          labelStyle: TextStyle(fontSize: 20),
          tabs: const [
            Tab(
              text: 'Passive',
            ),
            Tab(
              text: 'Partner',
            ),
            Tab(
              text: 'Active',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabBarController,
        children: [
          Consumer(builder: (context, ref, child) {
            final passiveSkill = ref.watch(passiveSkillControllerProvider);
            return passiveSkill.when(
              data: (data) {
                return DataTable2(columns: const [
                  DataColumn2(
                    label: Text('Name'),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text('Description'),
                  ),
                ], rows: [
                  for (var item in data)
                    DataRow(cells: [
                      DataCell(Text(item.name!)),
                      DataCell(ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.passiveDesc!.length,
                        itemBuilder: (context, index) {
                          var desc = item.passiveDesc![index];
                          return AutoSizeText(
                            desc.name!,
                            minFontSize: 10,
                            style: TextStyle(
                                color: desc.isPositive!
                                    ? Colors.green
                                    : Colors.red),
                          );
                        },
                      )),
                    ])
                ]);
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final PassiveSkillEntity passiveSkillEntity = data[index];
                      return Text(passiveSkillEntity.name!);
                    });
              },
              error: (err, stack) => Text('Error $err'),
              loading: () => Center(
                  child: LoadingAnimationWidget.dotsTriangle(
                      color: Colors.white, size: 50)),
            );
          }),
          Consumer(
            builder: (context, ref, child) {
              final partnerSkill = ref.watch(partnerSkillControllerProvider);

              return partnerSkill.when(
                data: (data) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(),
                          Text(
                            'Skill',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Pal',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              PartnerSkillEntity partnerSkills = data[index];
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black54),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            child: CachedNetworkImage(
                                              imageUrl: partnerSkills
                                                  .partner!.iconUrl!,
                                              height: 36,
                                            )),
                                        Expanded(
                                          child: AutoSizeText(
                                            partnerSkills.name!,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            minFontSize: 12,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        SizedBox(
                                            width: 80,
                                            child: CachedNetworkImage(
                                              imageUrl: partnerSkills
                                                  .pal![0].iconUrl!,
                                              height: 36,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      partnerSkills.description!
                                          .replaceAll('\n', ''),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                },
                error: (err, stack) => Text('Error $err'),
                loading: () => Text('loading'),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final activeSkill = ref.watch(activeSkillControllerProvider);

              return activeSkill.when(
                data: (data) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 60,),
                          Expanded(
                            child: Text(
                              'Name',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              'Power',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Text(
                              'CD',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              ActiveSkillEntity activeSkill = data[index];
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black54),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 60,
                                            child: CachedNetworkImage(
                                              imageUrl: activeSkill
                                                  .element!.iconUrl!,
                                              height: 36,
                                            )),
                                        Expanded(
                                          child: AutoSizeText(
                                            activeSkill.name!,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            minFontSize: 12,
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        SizedBox(
                                            width: 40,
                                            child: Text(
                                               '${activeSkill.power}',

                                            )),
                                        SizedBox(
                                            width: 40,
                                            child: Text(
                                               '${activeSkill.cd}s',

                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      activeSkill.desc!
                                          .replaceAll('\n', ''),
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                },
                error: (err, stack) => Text('Error $err'),
                loading: () => Text('loading'),
              );
            },
          ),

        ],
      ),
    );
  }
}
