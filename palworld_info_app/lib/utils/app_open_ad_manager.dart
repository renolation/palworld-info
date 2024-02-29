import 'package:yandex_mobileads/mobile_ads.dart';

class AppOpenAdManager {
  final _adUnitId = 'R-M-6396336-3';
  late var adRequestConfiguration = AdRequestConfiguration(adUnitId: _adUnitId);
  AppOpenAd? _appOpenAd;
  late Future<AppOpenAdLoader> appOpenAdLoader = createAppOpenAdLoader();

  static var isAdShowing = false;
  static var isColdStartAdShown = false;

  Future<AppOpenAdLoader> createAppOpenAdLoader() {
    return AppOpenAdLoader.create(
      onAdLoaded: (AppOpenAd appOpenAd) {
        // The ad was loaded successfully. Now you can handle it.
        print('open ad loaded');
        _appOpenAd = appOpenAd;

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
    var appOpenAd = _appOpenAd;
    if (appOpenAd != null && !isAdShowing) {
      _setAdEventListener(appOpenAd: appOpenAd);
      await appOpenAd.show();
      await appOpenAd.waitForDismiss();
    } else {
      loadAppOpenAd();
    }
  }

  void _clearAppOpenAd() {
    _appOpenAd?.destroy();
    _appOpenAd = null;
  }
}