import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:palworld_info_app/domains/pal_entity.dart';
import 'package:palworld_info_app/features/detail_screen/presentations/detail_screen.dart';
import 'package:palworld_info_app/features/home_screen/presentations/home_screen.dart';
import 'package:palworld_info_app/features/passive_skill_screen/presentations/passive_skill_screen.dart';

import '../providers/ads_provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

enum AppRoute { home, detail, user, like, passive }

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
                  PalEntity palEntity = state.extra as PalEntity;
                  return DetailScreen(
                      key: state.pageKey, palEntity: palEntity, slug: slug);
                },
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  tabBorderRadius: 10,
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: FontAwesomeIcons.house,
                      text: 'Home',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.heart,
                      text: 'Passive',
                    ),
                  ],
                  selectedIndex: 0,
                  onTabChange: (index) {
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
