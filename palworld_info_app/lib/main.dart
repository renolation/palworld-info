import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/utils/app_router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  await MobileAds.instance.updateRequestConfiguration(
    RequestConfiguration(
      testDeviceIds: ['GADSimulatorID','A8FF5574DCF6E5E5097F7F5CE1FB43DF','0D698FF26FDE0ED714D280C370A5DA06','2d24c098dff4f2675eb942e3f9a8d5ff'],
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.latoTextTheme(ThemeData(brightness: Brightness.light).textTheme),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1D1D1E),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.latoTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}

