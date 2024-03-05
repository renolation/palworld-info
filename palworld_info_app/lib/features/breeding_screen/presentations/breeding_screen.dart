import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:palworld_info_app/domains/breeding_entity.dart';
import 'package:palworld_info_app/features/breeding_screen/data/breeding_controller.dart';
import 'package:palworld_info_app/features/home_screen/data/pals_controller.dart';
import '../../../domains/pal_entity.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../providers/providers.dart';

class BreedingScreen extends HookConsumerWidget {
  const BreedingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabBarController = useTabController(initialLength: 2);
    final selectingPal = useState<PalEntity>(const PalEntity());
    final textEditingController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeding'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              child: selectingPal.value.name != null
                  ? Container(
                      height: 90,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.blue.withOpacity(0.2)
                      ),
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
                  : Container(
                height: 90,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1),
                    color: Colors.blue.withOpacity(0.2)
                ),
                padding: const EdgeInsets.all(4),
                child: const AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Icon(FontAwesomeIcons.plus),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Consumer(builder: (context, ref, child) {
                        final pals = ref.watch(palControllerProvider);
                        final filterText = ref.watch(filterBreedingPalTextState);
                        return pals.when(
                          data: (data) {
                            List<PalEntity> listItem = [];
                            if(filterText.isEmpty) {
                              listItem = [...data];
                            } else {
                              listItem = data.where((element) =>
                                  element.name!.toLowerCase().contains(textEditingController.text.toLowerCase()))
                                  .toList();
                            }
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('Select pal name'),
                              ),
                              body: Column(
                                children: [
                                  Consumer(builder: (context, ref, child) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                                      child: TextField(
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                            filled: true,
                                            isDense: true,
                                            suffixIcon: const Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Icon(FontAwesomeIcons.magnifyingGlass), ),
                                            fillColor: Colors.grey.withOpacity(0.4),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide.none,
                                            )
                                        ),
                                        onChanged: (newText) {
                                          textEditingController.text = newText;
                                          textEditingController.selection =
                                              TextSelection.fromPosition(TextPosition(
                                                  offset: textEditingController.text.length));
                                          ref.read(filterBreedingPalTextState.notifier).state = newText;

                                        },
                                      ),
                                    );
                                  }),
                                  Expanded(
                                    child: GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                        itemCount: listItem.length,
                                        itemBuilder: (context, index) {
                                          PalEntity palEntity = listItem[index];
                                          return InkWell(
                                            onTap: () {
                                              selectingPal.value = palEntity;
                                              ref
                                                  .read(countAdProvider.notifier)
                                                  .update();
                                              Navigator.pop(context);
                                            },
                                            child: AspectRatio(
                                              aspectRatio: 10 / 7,
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.white, width: 1),
                                                    color: Colors.blue.withOpacity(0.2)
                                                ),
                                                margin: EdgeInsets.all(5),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Expanded(child: CachedNetworkImage(imageUrl: palEntity.iconUrl!)),
                                                    AutoSizeText(palEntity.name!, style: TextStyle(fontSize: 16),maxLines: 1,minFontSize: 10,),
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
                          loading: () => Center(
                            child: LoadingAnimationWidget.dotsTriangle(
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                        );
                      });
                    });
              },
            ),
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
                                  icon: Text(
                                    'Child',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  icon: Text(
                                    'Parent',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabBarController,
                                children: [
                                  DataTable2(columns: kColumnData, rows: [
                                    for (var item in data.child)
                                      DataRow(
                                        cells: [
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
                                            style: TextStyle(color: Colors.blue),
                                          )),
                                        ],
                                      )
                                  ]),
                                  DataTable2(columns: kColumnData, rows: [
                                    for (var item in data.parent)
                                      DataRow(cells: [
                                        DataCell(AutoSizeText(
                                          item.parent1!,
                                          minFontSize: 10,
                                          maxLines: 2,
                                          style: TextStyle(color: Colors.blue),
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
                    loading: () => Expanded(
                      child: Center(
                        child: LoadingAnimationWidget.dotsTriangle(
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ),
                  );
                })
              :
          const SizedBox(),
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
