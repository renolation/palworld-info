import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:palworld_info_app/domains/passive_skill_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../../domains/work_suitability_entity.dart';
import '../../../providers/dio_provider.dart';
import '../../../utils/constants.dart';
import '../../../domains/pal_entity.dart';

part 'home_repository.g.dart';


class HomeRepository {
  HomeRepository({required this.client});

  final Dio client;

  Future<List<ElementEntity>> getElements({CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'pals/get/element',
    ).toString();

    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => ElementEntity.fromJson(e)).toList();
  }

  Future<List<WorkSuitabilityEntity>> getWorkSuitabilities(
      {CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'pals/get/work',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => WorkSuitabilityEntity.fromJson(e)).toList();
  }


  Future<List<PalEntity>> getPals({CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'pals/get/pal',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => PalEntity.fromJson(e)).toList();
  }

  Future<List<PassiveSkillEntity>> getPassiveSkillEntity(
      {CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'skills/get/passive',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => PassiveSkillEntity.fromJson(e)).toList();
  }
}

@Riverpod(keepAlive: true)
HomeRepository homeRepository(HomeRepositoryRef ref) => HomeRepository(
      client: ref.watch(dioProvider),
    );