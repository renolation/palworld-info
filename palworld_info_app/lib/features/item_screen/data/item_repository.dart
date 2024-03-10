
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/item_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../providers/dio_provider.dart';
import '../../../utils/constants.dart';

part 'item_repository.g.dart';

class ItemRepository {
  ItemRepository({required this.client});
  final Dio client;
  Future<List<ItemEntity>> getItems({CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'items',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => ItemEntity.fromJson(e)).toList();

  }
}

@Riverpod(keepAlive: true)
ItemRepository itemRepository(ItemRepositoryRef ref) =>
    ItemRepository(client: ref.watch(dioProvider));
