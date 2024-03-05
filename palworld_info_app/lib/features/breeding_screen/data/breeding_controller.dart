
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:palworld_info_app/features/breeding_screen/data/breeding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domains/breeding_entity.dart';

part 'breeding_controller.g.dart';

@Riverpod(keepAlive: true)
class BreedingParentController extends _$BreedingParentController{
  @override
  FutureOr<List<BreedingEntity>> build(String slug) async {
    return getParent(slug);
  }
  Future<List<BreedingEntity>> getParent(String slug, {CancelToken? cancelToken}) async {
    final breedingRepository = ref.watch(breedingRepositoryProvider);
    final cancelToken = CancelToken();
    return breedingRepository.getByParent(
      slug,
      cancelToken: cancelToken,
    );
  }
}

@Riverpod(keepAlive: true)
class BreedingChildController extends _$BreedingChildController{
  @override
  FutureOr<List<BreedingEntity>> build(String slug) async {
    return getChild(slug);
  }
  Future<List<BreedingEntity>> getChild(String slug, {CancelToken? cancelToken}) async {
    final breedingRepository = ref.watch(breedingRepositoryProvider);
    final cancelToken = CancelToken();
    return breedingRepository.getByChild(
      slug,
      cancelToken: cancelToken,
    );
  }
}