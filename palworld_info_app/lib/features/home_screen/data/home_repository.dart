import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../../providers/dio_provider.dart';
import '../../../utils/constants.dart';

part 'home_repository.g.dart';


class HomeRepository {
  HomeRepository({required this.client});

  final Dio client;

  Future<List<ElementEntity>> getElements({CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'pals/element',
    ).toString();

    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => ElementEntity.fromJson(e)).toList();
  }



}

@Riverpod(keepAlive: true)
HomeRepository homeRepository(HomeRepositoryRef ref) => HomeRepository(
      client: ref.watch(dioProvider),
    );