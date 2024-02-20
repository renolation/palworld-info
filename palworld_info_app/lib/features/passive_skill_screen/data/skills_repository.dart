import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/active_skill_entity.dart';
import 'package:palworld_info_app/domains/partner_skill_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../providers/dio_provider.dart';
import '../../../utils/constants.dart';

part 'skills_repository.g.dart';

class SkillsRepository {
  SkillsRepository({required this.client});
  final Dio client;
  Future<List<PartnerSkillEntity>> getPartnerSkillEntity(
      {CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'skills/get/partner',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => PartnerSkillEntity.fromJson(e)).toList();
  }

  Future<List<ActiveSkillEntity>> getActiveSkillEntity(
      {CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'skills/get/active',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => ActiveSkillEntity.fromJson(e)).toList();
  }
}
@Riverpod(keepAlive: true)
SkillsRepository skillsRepository(SkillsRepositoryRef ref) => SkillsRepository(
  client: ref.watch(dioProvider),
);