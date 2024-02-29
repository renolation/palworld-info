import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palworld_info_app/utils/app_router.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

import 'firebase_options.dart';

void main() async {



  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver{

  final _adUnitId = 'R-M-6396336-3';
  late var adRequestConfiguration = AdRequestConfiguration(adUnitId: _adUnitId);
  AppOpenAd? _appOpenAd;
  late Future<AppOpenAdLoader> _appOpenAdLoader = _createAppOpenAdLoader();

  static var isAdShowing = false;
  static var isColdStartAdShown = true;

  Future<AppOpenAdLoader> _createAppOpenAdLoader() {
    return AppOpenAdLoader.create(
      onAdLoaded: (AppOpenAd appOpenAd) {
        // The ad was loaded successfully. Now you can handle it.
        _appOpenAd = appOpenAd;
        if (!isColdStartAdShown) {
          _showAdIfAvailable();
          isColdStartAdShown = true;
        }
      },
      onAdFailedToLoad: (error) {
        // The ad failed to load
        // Attempting to load a new ad from the OnAdFailedToLoad event is strongly discouraged.
      },
    );
  }

  @override
  void initState() {
    super.initState();
    MobileAds.initialize();
    _appOpenAdLoader = _createAppOpenAdLoader();
    _loadAppOpenAd();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _loadAppOpenAd() async {
    final adLoader = await _appOpenAdLoader;
    await adLoader.loadAd(adRequestConfiguration: adRequestConfiguration);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _showAdIfAvailable();
    }
  }

  void _setAdEventListener({required AppOpenAd appOpenAd }) {
    appOpenAd.setAdEventListener(
        eventListener: AppOpenAdEventListener(
            onAdShown: () {
              // Called when an ad is shown.
              isAdShowing = true;
            },
            onAdFailedToShow: (error) {
              // Called when an ad failed to show.

              // Clear resources after Ad dismissed.
              _clearAppOpenAd();
              // Now you can preload the next ad.
              _loadAppOpenAd();
            },
            onAdDismissed: () {
              // Called when an ad is dismissed.
              isAdShowing = false;

              // Clear resources.
              _clearAppOpenAd();
              // Now you can preload the next ad.
              _loadAppOpenAd();
            },
            onAdClicked: () {
              // Called when a click is recorded for an ad.
            },
            onAdImpression: (data) {
              // Called when an impression is recorded for an ad.
            }
        )
    );
  }

  Future<void> _showAdIfAvailable() async {
    var appOpenAd = _appOpenAd;
    if (appOpenAd != null && !isAdShowing) {
      _setAdEventListener(appOpenAd: appOpenAd);
      await appOpenAd.show();
      await appOpenAd.waitForDismiss();
    } else {
      _loadAppOpenAd();
    }
  }

  void _clearAppOpenAd() {
    _appOpenAd?.destroy();
    _appOpenAd = null;
  }

  @override
  Widget build(BuildContext context) {
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

