
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/item_entity.dart';
import 'package:palworld_info_app/features/item_screen/data/item_repository.dart';
import 'package:palworld_info_app/providers/providers.dart';
import 'package:palworld_info_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_controller.g.dart';

@Riverpod(keepAlive: true)
class ItemController extends _$ItemController {
  @override
  FutureOr<List<ItemEntity>> build() async {
    return getItems();
  }

  FutureOr<List<ItemEntity>> getItems() async {
    final itemRepository = ref.watch(itemRepositoryProvider);
    final cancelToken = CancelToken();
    return itemRepository.getItems(
      cancelToken: cancelToken,
    );
  }
   updateType()  {
    // List<ItemEntity> list = [];
    // final listItemType = ref.watch(itemTypesProvider);
    // print(listItemType);
    // list = state.value!
    //     .where((e) => listItemType.map((item) => item.toString()).contains(e.itemType))
    // .toList();
    // state = AsyncValue.data(list);
   }
}