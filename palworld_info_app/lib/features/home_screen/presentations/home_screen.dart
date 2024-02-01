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
            DropdownButton<SortBy>(
              value: ref.watch(palSortTypeProvider),
              onChanged: (value) =>
                  ref.read(palSortTypeProvider.notifier).state = value!,
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
            ),
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
                          child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                PalEntity palEntity = data[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          palEntity.name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${palEntity.hp!}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(fontSize: 18),
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
