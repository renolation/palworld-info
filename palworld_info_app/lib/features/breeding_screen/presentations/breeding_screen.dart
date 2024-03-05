import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/breeding_entity.dart';
import 'package:palworld_info_app/features/breeding_screen/data/breeding_controller.dart';
import 'package:palworld_info_app/features/home_screen/data/pals_controller.dart';
import '../../../domains/pal_entity.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BreedingScreen extends HookConsumerWidget {
  const BreedingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabBarController = useTabController(initialLength: 2);
    final selectingPal = useState<PalEntity>(const PalEntity());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeding'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: selectingPal.value.name != null
                ? Container(
                    height: 90,
                    width: 150,
                    color: Colors.red,
                    padding: const EdgeInsets.all(4),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(child: CachedNetworkImage(imageUrl: selectingPal.value.iconUrl!)),
                          Text(selectingPal.value.name!),
                        ],
                      ),
                    ),
                  )
                : const Icon(FontAwesomeIcons.addressBook),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Consumer(builder: (context, ref, child) {
                      final pals = ref.watch(palControllerProvider);
                      return pals.when(
                        data: (data) {
                          return Scaffold(
                            body: Column(
                              children: [
                                const Text('Select pal name'),
                                Expanded(
                                  child: GridView.builder(
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        PalEntity palEntity = data[index];
                                        return InkWell(
                                          onTap: () {
                                            selectingPal.value = palEntity;
                                            Navigator.pop(context);
                                          },
                                          child: AspectRatio(
                                            aspectRatio: 10 / 7,
                                            child: Container(
                                              height: 50,
                                              color: Colors.blue,
                                              margin: EdgeInsets.all(5),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(child: CachedNetworkImage(imageUrl: palEntity.iconUrl!)),
                                                  Text(palEntity.name!),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          );
                        },
                        error: (err, stack) => Text('Error $err'),
                        loading: () => Text('loading'),
                      );
                    });
                  });
            },
          ),
          selectingPal.value.name != null
              ? Consumer(builder: (context, ref, child) {
                  final breedingController = ref.watch(breedingControllerProvider(selectingPal.value.name!));
                  return breedingController.when(
                    data: (data) {
                      print('data length ${data.child.length}');
                      print('data length ${data.parent.length}');
                      return Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TabBar(
                              controller: tabBarController,
                              tabs: const [
                                Tab(
                                  text: 'Child',
                                ),
                                Tab(
                                  text: 'Parent',
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabBarController,
                                children: [
                                  DataTable2(columns: kColumnData, rows: [
                                    for (var item in data.child)
                                      DataRow(cells: [
                                        DataCell(AutoSizeText(
                                          item.parent1!,
                                          minFontSize: 10,
                                          maxLines: 2,
                                        )),
                                        DataCell(AutoSizeText(
                                          item.parent2!,
                                          minFontSize: 10,
                                          maxLines: 2,
                                        )),
                                        DataCell(AutoSizeText(
                                          item.child!,
                                          minFontSize: 10,
                                          maxLines: 2,
                                        )),
                                      ])
                                  ]),
                                  DataTable2(columns: kColumnData, rows: [
                                    for (var item in data.parent)
                                      DataRow(cells: [
                                        DataCell(AutoSizeText(
                                          item.parent1!,
                                          minFontSize: 10,
                                          maxLines: 2,
                                        )),
                                        DataCell(AutoSizeText(
                                          item.parent2!,
                                          minFontSize: 10,
                                          maxLines: 2,
                                        )),
                                        DataCell(AutoSizeText(
                                          item.child!,
                                          minFontSize: 10,
                                          maxLines: 2,
                                        )),
                                      ])
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    error: (err, stack) => Text('Error $err'),
                    loading: () => Text('loading'),
                  );
                })
              : SizedBox(),
        ],
      ),
    );
  }
}

const kColumnData = [
  DataColumn2(
    label: Text('Parent 1'),
  ),
  DataColumn2(
    label: Text('Parent 2'),
  ),
  DataColumn2(
    label: Text('Child'),
  ),
];
