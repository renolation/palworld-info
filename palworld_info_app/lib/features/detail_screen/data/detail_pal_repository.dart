import 'package:dio/dio.dart';
import 'package:palworld_info_app/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domains/pal_entity.dart';
import '../../../utils/constants.dart';

part 'detail_pal_repository.g.dart';

class DetailPalRepository {
  DetailPalRepository({required this.client});

  final Dio client;

  Future<PalEntity> getPal(String slug, {CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: Constants.scheme,
      host: Constants.host,
      port: Constants.port,
      path: 'pals/$slug',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    return PalEntity.fromJson(response.data);
  }
}

@Riverpod(keepAlive: true)
DetailPalRepository detailPalRepository(DetailPalRepositoryRef ref) =>
    DetailPalRepository(client: ref.watch(dioProvider));
