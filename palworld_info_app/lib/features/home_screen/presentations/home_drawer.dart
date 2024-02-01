import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domains/element_entity.dart';
import '../../../domains/work_suitability_entity.dart';
import '../data/element_controller.dart';
import '../data/work_suitability_controller.dart';

class HomeDrawer extends HookConsumerWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Consumer(builder: (context, ref, child) {
              final playlistHome = ref.watch(elementControllerProvider);
              return playlistHome.when(
                data: (data) {
                  return GridView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      ElementEntity elementEntity = data[index];
                      return InkWell(
                        onTap: () {},
                        child: CachedNetworkImage(
                          imageUrl: elementEntity.iconUrl!,
                          height: 15,
                        ),
                      );
                    }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),);
                },
                error: (err, stack) => Text('Error $err'),
                loading: () => const Text('loading'),
              );
            }),
          ),
          SizedBox(
            height: 300,
            child: Consumer(builder: (context, ref, child) {
              final playlistHome = ref.watch(workSuitabilityControllerProvider);
              return playlistHome.when(
                data: (data) {
                  return GridView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      WorkSuitabilityEntity workSuitabilityEntity = data[index];
                      return InkWell(
                        onTap: () {},
                        child: CachedNetworkImage(
                          imageUrl: workSuitabilityEntity.iconUrl!,
                          height: 15,
                        ),
                      );
                    }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),);
                },
                error: (err, stack) => Text('Error $err'),
                loading: () => const Text('loading'),
              );
            }),
          ),
        ],
      ),
    );
  }
}
