import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../domains/element_entity.dart';
import '../../../domains/work_suitability_entity.dart';
import '../data/element_controller.dart';
import '../data/pals_controller.dart';
import '../data/selecting_pal_controller.dart';
import '../data/work_suitability_controller.dart';

class HomeDrawer extends HookConsumerWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Select Element', style: Theme.of(context).textTheme.titleLarge,),
            ),

            SizedBox(
              height: 150,
              child: Consumer(builder: (context, ref, child) {
                final playlistHome = ref.watch(elementControllerProvider);
                final selectingElement = ref.watch(selectingElementProvider);
                return playlistHome.when(
                  data: (data) {

                    return GridView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        ElementEntity elementEntity = data[index];
                        return InkWell(
                          onTap: () {
                            if(selectingElement.contains(elementEntity)) {
                              ref.read(selectingElementProvider.notifier).remove(elementEntity.id);
                            } else {
                              ref.read(selectingElementProvider.notifier).add(elementEntity);
                            }
                            ref.read(selectingPalControllerProvider.notifier).updatePals();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: selectingElement.contains(elementEntity) ? Colors.red.withOpacity(0.5) : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: elementEntity.iconUrl!,
                              height: 15,
                            ),
                          ),
                        );
                      }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),);
                  },
                  error: (err, stack) => Text('Error $err'),
                  loading: () =>  LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.white,
                    size: 50,
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Select Work Suitability', style: Theme.of(context).textTheme.titleLarge,),
            ),
            SizedBox(
              height: 300,
              child: Consumer(builder: (context, ref, child) {
                final playlistHome = ref.watch(workSuitabilityControllerProvider);
                final selectingWorkSuitability = ref.watch(selectingWorkSuitabilityProvider);
      
                return playlistHome.when(
                  data: (data) {
                    return GridView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        WorkSuitabilityEntity workSuitabilityEntity = data[index];
                        return InkWell(
                          onTap: () {
                            if(selectingWorkSuitability.contains(workSuitabilityEntity)) {
                              ref.read(selectingWorkSuitabilityProvider.notifier).remove(workSuitabilityEntity.id);
                            } else {
                              ref.read(selectingWorkSuitabilityProvider.notifier).add(workSuitabilityEntity);
                            }
                            ref.read(selectingPalControllerProvider.notifier).updatePals();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: selectingWorkSuitability.contains(workSuitabilityEntity) ? Colors.red.withOpacity(0.5) : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: workSuitabilityEntity.iconUrl!,
                              height: 15,
                            ),
                          ),
                        );
                      }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),);
                  },
                  error: (err, stack) => Text('Error $err'),
                  loading: () => LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.white,
                    size: 50,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
