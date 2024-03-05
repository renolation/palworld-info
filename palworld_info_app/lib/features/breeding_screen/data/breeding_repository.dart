import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/breeding_entity.dart';
import 'package:palworld_info_app/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domains/pal_entity.dart';
import '../../../utils/constants.dart';

part 'breeding_repository.g.dart';

class BreedingRepository {
  BreedingRepository({required this.client});

  final Dio client;

  Future<List<BreedingEntity>> getByChild(String slug, {CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'breeding/get-child/$slug',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => BreedingEntity.fromJson(e)).toList();


  }
  Future<List<BreedingEntity>> getByParent(String slug, {CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'breeding/get-child/Astegon',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => BreedingEntity.fromJson(e)).toList();
  }
}

@Riverpod(keepAlive: true)
BreedingRepository breedingRepository(BreedingRepositoryRef ref) =>
    BreedingRepository(client: ref.watch(dioProvider));
