import 'package:dio/dio.dart';
import 'package:palworld_info_app/features/detail_screen/data/detail_pal_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domains/pal_entity.dart';

part 'detail_pal_controller.g.dart';

@riverpod
class DetailPalController extends _$DetailPalController {
  @override
  FutureOr<PalEntity> build(String slug) async {
    return getPal(slug);
  }

  Future<PalEntity> getPal(String slug, {CancelToken? cancelToken}) async {
    final detailPalRepository = ref.watch(detailPalRepositoryProvider);
    final cancelToken = CancelToken();
    return detailPalRepository.getPal(
      slug,
      cancelToken: cancelToken,
    );
  }
}