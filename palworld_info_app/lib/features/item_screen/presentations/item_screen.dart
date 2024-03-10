import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/features/item_screen/data/item_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domains/item_entity.dart';

class ItemScreen extends HookConsumerWidget {
  const ItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textEditingController = useTextEditingController();
    final filterItems = useState('');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
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
                  filterItems.value = newText;
                  print(filterItems.value);

                },
              ),
            );
          }),

          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final items = ref.watch(itemControllerProvider);
              return items.when(data: (data){
                List<ItemEntity> listItem = [];
                if(filterItems.value.isEmpty) {
                  listItem = [...data];
                } else {
                  listItem = data.where((element) =>
                      element.name!.toLowerCase().contains(textEditingController.text.toLowerCase()))
                      .toList();
                }
                print('${filterItems.value} 22');
                return GridView.builder(
                    itemCount: listItem.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index){
                      ItemEntity itemEntity = listItem[index];
                      return Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: CachedNetworkImage(
                                  imageUrl:
                                  itemEntity.iconUrl!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: AutoSizeText(itemEntity.name!,textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      );
                    });
              }, error: (err, stack) => Text('Error $err'),
                loading: () => Text('loading'),
              );
            }),
          ),
        ],
      ),
    );
  }
}
