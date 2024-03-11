import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:palworld_info_app/features/item_screen/data/item_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palworld_info_app/providers/providers.dart';

import '../../../domains/item_entity.dart';
import '../../../utils/app_router.dart';
import '../../../utils/constants.dart';

class ItemScreen extends HookConsumerWidget {
  const ItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final searchItems = useState('');
    final isShowFilter = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Consumer(builder: (context, ref, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          filled: true,
                          isDense: true,
                          suffixIcon: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(FontAwesomeIcons.magnifyingGlass),
                          ),
                          fillColor: Colors.grey.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          )),
                      onChanged: (newText) {
                        textEditingController.text = newText;
                        textEditingController.selection =
                            TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
                        searchItems.value = newText;
                        print(searchItems.value);
                      },
                    ),
                  );
                }),
              ),
              IconButton(
                  onPressed: () {
                    isShowFilter.value = !isShowFilter.value;
                  },
                  icon: Icon(isShowFilter.value ? FontAwesomeIcons.minus : FontAwesomeIcons.plus)),
            ],
          ),
          Consumer(builder: (context, ref, child) {
            final listItemType = ref.watch(itemTypesProvider);
            return !isShowFilter.value
                ? const SizedBox()
                : SizedBox(
                    child: Wrap(
                        spacing: 4.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        direction: Axis.horizontal, // main axis (rows or columns)
                        children: ItemType.values.map((itemType) {
                          bool isSelected = listItemType.contains(itemType);
                          return InkWell(
                            onTap: () {
                              ref.read(itemTypesProvider.notifier).toggle(itemType);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5 - 4.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: isSelected ?Colors.black : Colors.black26  ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    itemType.title,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                  );
          }),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final items = ref.watch(itemControllerProvider);
              final itemTypes = ref.watch(itemTypesProvider);
              return items.when(
                data: (data) {
                  // List<ItemEntity> listItem = [];
                  // if (itemTypes.isEmpty) {
                  //   listItem = [...data];
                  // } else {
                  //   listItem = data.where((e) => itemTypes.map((item) => item.title).contains(e.itemType)).toList();
                  // }
                  // if (searchItems.value.isNotEmpty) {
                  //   listItem = listItem
                  //       .where(
                  //           (element) => element.name!.toLowerCase().contains(textEditingController.text.toLowerCase()))
                  //       .toList();
                  // }

                  List<ItemEntity> listItem = [
                    ...data.where((e) => itemTypes.isEmpty || itemTypes.map((item) => item.title).contains(e.itemType))
                  ]..removeWhere((element) =>
                      searchItems.value.isNotEmpty &&
                      !element.name!.toLowerCase().contains(textEditingController.text.toLowerCase()));

                  return GridView.builder(
                      itemCount: listItem.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        ItemEntity itemEntity = listItem[index];
                        return InkWell(
                          onTap: () async {
                            context.pushNamed(
                                AppRoute.itemDetail.name,
                                pathParameters: {'slug': itemEntity.slug!},
                                extra: itemEntity
                            );
                            await FirebaseAnalytics.instance.logSelectContent(
                              contentType: "item",
                              itemId: itemEntity.slug!,
                            );
                            ref.read(countAdProvider.notifier).update();
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Expanded(
                                  child: CachedNetworkImage(imageUrl: itemEntity.iconUrl!),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: AutoSizeText(
                                    itemEntity.name!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(4.0),
                                //   child: AutoSizeText(
                                //     itemEntity.itemType!,
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                error: (err, stack) => Text('Error $err'),
                loading: () => Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.yellow, rightDotColor: Colors.blueAccent, size: 50),),
              );
            }),
          ),
        ],
      ),
    );
  }
}
