import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/element_entity.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/domains/work_suitability_entity.dart';
import 'package:palworld_info_app/features/home_screen/data/element_controller.dart';
import 'package:palworld_info_app/features/home_screen/data/pals_controller.dart';
import 'package:palworld_info_app/features/home_screen/presentations/home_drawer.dart';
import 'package:palworld_info_app/providers/providers.dart';
import 'package:palworld_info_app/utils/constants.dart';
import '../../../utils/app_router.dart';
import '../data/home_repository.dart';
import '../data/selecting_pal_controller.dart';
import '../data/work_suitability_controller.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {



    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home Screen',
          ),
          actions: [
            Consumer(builder: (context, ref, child) {
              final palSortType = ref.watch(palSortTypeProvider);
              final palSortBy = ref.watch(palSortByProvider);

              return Switch(value: palSortType == SortType.Asc?true:false, onChanged: (value) {
                ref.read(palSortTypeProvider.notifier).update(value ? SortType.Asc : SortType.Desc);
                ref.read(selectingPalControllerProvider.notifier).updatePals();

              });
            }),
            Consumer(builder: (context, ref, child) {
              final palSortType = ref.watch(palSortTypeProvider);
              return DropdownButton<SortBy>(
                value: ref.watch(palSortByProvider),
                onChanged: (value) {
                  ref.read(palSortByProvider.notifier).update(value!);
                  ref.read(selectingPalControllerProvider.notifier).updatePals();
                }
                ,
                items: const [
                  DropdownMenuItem(
                    value: SortBy.Name,
                    child: Icon(Icons.sort_by_alpha),
                  ),
                  DropdownMenuItem(
                    value: SortBy.Hp,
                    child: Icon(Icons.sort),
                  ),
                ],
              );
            }),
          ],
        ),
        endDrawer: const HomeDrawer(),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final palsHome = ref.watch(selectingPalControllerProvider);
                return palsHome.when(
                  data: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.length.toString()),
                        Expanded(
                          child: GridView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.vertical,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                PalEntity palEntity = data[index];
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      AppRoute.detail.name,
                                      pathParameters: {'slug': palEntity.slug!},
                                    );
                                  },
                                  child: Card(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: Column(
                                            children: [
                                              for(var icon in palEntity.elements!)
                                                CachedNetworkImage(imageUrl: icon.iconUrl!, fit: BoxFit.fill),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5,right: 5, top: 5),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                CachedNetworkImage(imageUrl: palEntity.iconUrl!),
                                                AutoSizeText(
                                                  palEntity.name!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(fontSize: 18),
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 40,
                                          child: ListView(
                                            children: [
                                              for(var level in palEntity.levelWorkSuitability!)
                                                Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(width: 30,child: CachedNetworkImage(imageUrl: level.workSuitability!.iconUrl!, fit: BoxFit.fill)),
                                                    Text(level.level.toString(), style: TextStyle(fontSize: 12),),
                                                  ]
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  },
                  error: (err, stack) => Text('Error $err'),
                  loading: () => Text('loading'),
                );
              }),
            ),
          ],
        ));
  }
}
