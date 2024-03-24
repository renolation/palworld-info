import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:palworld_info_app/domains/item_entity.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/domains/structure_entity.dart';
import 'package:palworld_info_app/features/breeding_screen/presentations/breeding_screen.dart';
import 'package:palworld_info_app/features/detail_screen/presentations/detail_screen.dart';
import 'package:palworld_info_app/features/home_screen/presentations/home_screen.dart';
import 'package:palworld_info_app/features/home_screen/presentations/test_banner.dart';
import 'package:palworld_info_app/features/item_screen/presentations/item_detail_screen.dart';
import 'package:palworld_info_app/features/item_screen/presentations/item_screen.dart';
import 'package:palworld_info_app/features/passive_skill_screen/presentations/passive_skill_screen.dart';
import 'package:palworld_info_app/features/structure_screen/presentations/structure_detail_screen.dart';
import 'package:palworld_info_app/features/structure_screen/presentations/structure_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

import '../features/home_screen/presentations/app_open_ad_page.dart';
import '../providers/ads_provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

enum AppRoute { home, detail, user, like, passive, banner, breeding, item, itemDetail, structure, structureDetail }

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(navigatorKey: _sectionANavigatorKey, routes: [
              GoRoute(
                path: '/',
                name: AppRoute.home.name,
                builder: (context, state) => const HomeScreen(),
              ),

              GoRoute(
                path: '/detail/:slug',
                name: AppRoute.detail.name,
                builder: (context, state) {
                  String slug = state.pathParameters['slug']!;
                  String name = state.extra as String;
                  return DetailScreen(
                      key: state.pageKey, slug: slug, name :name);
                },
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/breeding',
                name: AppRoute.breeding.name,
                builder: (context, state) => const BreedingScreen(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/items',
                name: AppRoute.item.name,
                builder: (context, state) => const ItemScreen(),
                routes: [
                  GoRoute(
                    path: ':slug',
                    name: AppRoute.itemDetail.name,
                    builder: (context, state) {
                      // String slug = state.pathParameters['slug']!;
                      ItemEntity item = state.extra as ItemEntity;
                      return ItemDetailScreen(
                          key: state.pageKey, itemEntity: item);
                    },
                  ),
                ]
              ),

            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/structure',
                name: AppRoute.structure.name,
                builder: (context, state) => const StructureScreen(),
                  routes: [
                    GoRoute(
                      path: ':slug',
                      name: AppRoute.structureDetail.name,
                      builder: (context, state) {
                        // String slug = state.pathParameters['slug']!;
                        StructureEntity structure = state.extra as StructureEntity;
                        return StructureDetailScreen(
                            key: state.pageKey, structureEntity: structure);
                      },
                    ),
                  ]
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/passive',
                name: AppRoute.passive.name,
                builder: (context, state) => const PassiveSkillScreen(),
              ),
            ]),
          ]),
    ],
  );
});

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(builder: (context, ref, child) {
                final bannerAd = ref.watch(bannerAdProvider);
                final isBannerAdLoaded = ref.watch(isBannerAdLoadedProvider);
                print('is banner loaded $isBannerAdLoaded');
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: bannerAd.isBannerAlreadyCreated ? AdWidget(bannerAd: ref.read(bannerAdProvider).banner) : null,
                );
              }),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                child: SalomonBottomBar(
                  selectedItemColor: Colors.blueAccent,
                  items:  [
                    SalomonBottomBarItem(
                      icon: const Icon(FontAwesomeIcons.house),
                      title: const Text('Pals'),
                    ),
                    SalomonBottomBarItem(
                      icon:const Icon(FontAwesomeIcons.heart),
                      title:const Text('Breeding'),
                    ),
                    SalomonBottomBarItem(
                      icon:const Icon(FontAwesomeIcons.gun),
                        title:const Text('Items'),
                    ),
                    SalomonBottomBarItem(
                      icon:const Icon(FontAwesomeIcons.chair),
                        title:const Text('Structures'),
                    ),
                    SalomonBottomBarItem(
                      icon:const Icon(FontAwesomeIcons.shieldHalved),
                        title:const Text('Skills'),
                    ),
                  ],
                  currentIndex: navigationShell.currentIndex,
                  onTap: (index) {
                    _onTap(context, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
