import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
import 'package:palworld_info_app/providers/ads_provider.dart';
import 'package:palworld_info_app/providers/providers.dart';
import 'package:palworld_info_app/utils/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';
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
            'Palworld Info',
          ),
        ),
        endDrawer: const HomeDrawer(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer(builder: (context, ref, child) {
                  final palSortType = ref.watch(palSortTypeProvider);
                  return ToggleSwitch(
                    minWidth: 100.0,
                    initialLabelIndex: palSortType == SortType.Asc ? 0 : 1,
                    cornerRadius: 5.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const ['Ascending', 'Descending'],
                    icons: const [
                      FontAwesomeIcons.arrowUpWideShort,
                      FontAwesomeIcons.arrowDownShortWide
                    ],
                    activeBgColors: const [
                      [Colors.blue],
                      [Colors.green]
                    ],
                    onToggle: (index) {
                      print('switched to: $index');
                      ref
                          .read(palSortTypeProvider.notifier)
                          .update(index == 0 ? SortType.Asc : SortType.Desc);
                      ref
                          .read(selectingPalControllerProvider.notifier)
                          .updatePals();
                    },
                  );
                }),
                Consumer(builder: (context, ref, child) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton2<SortBy>(
                      isExpanded: true,
                      barrierColor: Colors.grey.withOpacity(0.2),
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: SortBy.values
                          .map((SortBy item) => DropdownMenuItem<SortBy>(
                                value: item,
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: ref.watch(palSortByProvider),
                      onChanged: (SortBy? value) {
                        ref.read(palSortByProvider.notifier).update(value!);
                        ref
                            .read(selectingPalControllerProvider.notifier)
                            .updatePals();
                      },
                      buttonStyleData:  ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                        elevation: 20,
                        overlayColor: MaterialStateProperty.all(Colors.red),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(5),
                        )
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  );
                }),
              ],
            ),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final palsHome = ref.watch(selectingPalControllerProvider);
                return palsHome.when(
                  data: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.length.toString()),

                        // Consumer(builder: (context, ref, child) {
                        //   final adWidget = ref.watch(adWidgetProvider);
                        //   final nativeAdLoadState = ref.watch(nativeAdLoadStateProvider);
                        //   return  nativeAdLoadState ? Container(
                        //       height: 100,
                        //       color: Colors.grey,
                        //       width: double.infinity,
                        //       child: AdWidget(ad: adWidget.ad)) : const SizedBox();
                        //
                        // }),

                        Expanded(
                          child: GridView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                PalEntity palEntity = data[index];
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      AppRoute.detail.name,
                                      pathParameters: {'slug': palEntity.slug!},
                                      extra: palEntity,
                                    );
                                  },
                                  child: Card(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: ListView(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              for (var icon
                                                  in palEntity.elements!)
                                                CachedNetworkImage(
                                                    imageUrl: icon.iconUrl!,
                                                    fit: BoxFit.fill),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5, top: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CachedNetworkImage(
                                                    imageUrl:
                                                        palEntity.iconUrl!),
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
                                            physics: palEntity
                                                        .levelWorkSuitability!
                                                        .length <
                                                    5
                                                ? const NeverScrollableScrollPhysics()
                                                : null,
                                            children: [
                                              for (var level in palEntity
                                                  .levelWorkSuitability!)
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                          width: 30,
                                                          child: CachedNetworkImage(
                                                              imageUrl: level
                                                                  .workSuitability!
                                                                  .iconUrl!,
                                                              fit:
                                                                  BoxFit.fill)),
                                                      Text(
                                                        level.level.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Consumer(builder: (context, ref, child) {
                          final bannerAd = ref.watch(bannerAdProvider);
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: SafeArea(
                              child: SizedBox(
                                width: bannerAd.value!.size.width.toDouble(),
                                height: bannerAd.value!.size.height.toDouble(),
                                child: AdWidget(ad: bannerAd.value!),
                              ),
                            ),
                          );
                        }),
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
