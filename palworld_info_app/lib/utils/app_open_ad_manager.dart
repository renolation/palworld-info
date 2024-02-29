import 'package:yandex_mobileads/mobile_ads.dart';

class AppOpenAdManager {
  final _adUnitId = 'demo-appopenad-yandex';
  late var adRequestConfiguration = AdRequestConfiguration(adUnitId: _adUnitId);
  AppOpenAd? appOpen;
  late Future<AppOpenAdLoader> appOpenAdLoader = createAppOpenAdLoader();

  static var isAdShowing = false;
  static var isColdStartAdShown = false;

  Future<AppOpenAdLoader> createAppOpenAdLoader() {
    return AppOpenAdLoader.create(
      onAdLoaded: (AppOpenAd appOpenAd) {
        // The ad was loaded successfully. Now you can handle it.
        print('open ad loaded');
        appOpen = appOpenAd;
        print(appOpenAd != null);
        if (!isColdStartAdShown) {
          showAdIfAvailable();
          isColdStartAdShown = true;
        }
      },
      onAdFailedToLoad: (error) {
        // The ad failed to load
        // Attempting to load a new ad from the OnAdFailedToLoad event is strongly discouraged.
      },
    );
  }

  Future<void> loadAppOpenAd() async {
    final adLoader = await appOpenAdLoader;
    await adLoader.loadAd(adRequestConfiguration: adRequestConfiguration);
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
              loadAppOpenAd();
            },
            onAdDismissed: () {
              // Called when an ad is dismissed.
              isAdShowing = false;
              print('dismiss ne');
              // Clear resources.
              _clearAppOpenAd();
              // Now you can preload the next ad.
              loadAppOpenAd();
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

  Future<void> showAdIfAvailable() async {
    print('show open ad ne');
    var appOpenAd = appOpen;
    print('cacacaca');
    print(appOpen != null);
    print(appOpenAd != null);
    print(!isAdShowing);
    if (appOpenAd != null && !isAdShowing) {
      print('true ne');
      _setAdEventListener(appOpenAd: appOpenAd);
      await appOpenAd.show();
      await appOpenAd.waitForDismiss();
    } else {
      loadAppOpenAd();
      print('false ne');
    }
  }

  void _clearAppOpenAd() {
    // appOpen?.destroy();
    // appOpen = null;
  }
}