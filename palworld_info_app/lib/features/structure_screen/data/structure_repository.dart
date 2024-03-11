
import 'package:dio/dio.dart';
import 'package:palworld_info_app/domains/structure_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../providers/dio_provider.dart';
import '../../../utils/constants.dart';

part 'structure_repository.g.dart';

class StructureRepository {
  StructureRepository({required this.client});
  final Dio client;
  Future<List<StructureEntity>> getStructures({CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'structures',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final List list = response.data;
    return list.map((e) => StructureEntity.fromJson(e)).toList();

  }
}

@Riverpod(keepAlive: true)
StructureRepository structureRepository(StructureRepositoryRef ref) =>
    StructureRepository(client: ref.watch(dioProvider));
