import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

import '../utils/ad_manager.dart';
final providerContainer = ProviderContainer();
final isBannerAdLoadedProvider = StateProvider<bool>((ref) => false);



final bannerAdProvider = FutureProvider.autoDispose<BannerAd>((ref) {
  print('banner 1');
  const screenWidth = 441;
  BannerAd banner;
  // BannerAdSize getAdSize() {
  //   const screenWidth = 441;
  //   return const BannerAdSize.sticky(width: screenWidth);
  // }

   banner = BannerAd(
      adUnitId: 'R-M-6396336-1', // or 'demo-banner-yandex'
      adSize: const BannerAdSize.sticky(width: screenWidth),
      adRequest: const AdRequest(),
      onAdLoaded: () {
        // The ad was loaded successfully. Now it will be shown.
        print('banner loaded');
        ref.read(isBannerAdLoadedProvider.notifier).state = true;
      },
      onAdFailedToLoad: (error) {
        print('banner failed');
        // Ad failed to load with AdRequestError.
        // Attempting to load a new ad from the onAdFailedToLoad() method is strongly discouraged.
      },
      onAdClicked: () {
        // Called when a click is recorded for an ad.
      },
      onLeftApplication: () {
        // Called when user is about to leave application (e.g., to go to the browser), as a result of clicking on the ad.
      },
      onReturnedToApplication: () {
        // Called when user returned to application after click.
      },
      onImpression: (impressionData) {
        // Called when an impression is recorded for an ad.
        print('banner impression');
      }
  );

  ref.onDispose(() {
    ref.read(isBannerAdLoadedProvider.notifier).state = false;
  });
  return banner;
});

final bannerAdWidgetProvider = FutureProvider.autoDispose<BannerAd>((ref) async {
  final ad = ref.watch(bannerAdProvider);
  print(ad.value!);
  return ad.value!;
});

// final nativeAdProvider = Provider.autoDispose<NativeAd>((ref) {
//   final ad = NativeAd(
//       adUnitId: AdManager.nativeAdUnitId,
//       factoryId: 'adFactoryExample',
//       listener: NativeAdListener(
//         onAdLoaded: (ad) {
//           debugPrint('$NativeAd loaded.');
//           ref.read(nativeAdLoadStateProvider.notifier).update((state) => true);
//         },
//         onAdFailedToLoad: (ad, error) {
//           // Dispose the ad here to free resources.
//           debugPrint('$NativeAd failed to load: $error');
//           ad.dispose();
//         },
//       ),
//       request: const AdRequest(),
//       // Styling
//       nativeTemplateStyle: NativeTemplateStyle(
//         // Required: Choose a template.
//           templateType: TemplateType.small,
//           // Optional: Customize the ad's style.
//           mainBackgroundColor: Colors.purple,
//           cornerRadius: 10.0,
//           callToActionTextStyle: NativeTemplateTextStyle(
//               textColor: Colors.cyan,
//               backgroundColor: Colors.red,
//               style: NativeTemplateFontStyle.monospace,
//               size: 16.0),
//           primaryTextStyle: NativeTemplateTextStyle(
//               textColor: Colors.red,
//               backgroundColor: Colors.cyan,
//               style: NativeTemplateFontStyle.italic,
//               size: 16.0),
//           secondaryTextStyle: NativeTemplateTextStyle(
//               textColor: Colors.green,
//               backgroundColor: Colors.black,
//               style: NativeTemplateFontStyle.bold,
//               size: 16.0),
//           tertiaryTextStyle: NativeTemplateTextStyle(
//               textColor: Colors.brown,
//               backgroundColor: Colors.amber,
//               style: NativeTemplateFontStyle.normal,
//               size: 16.0)))
//   ;
//
//   ad.load();
//
//   ref.onDispose(() {
//     ad.dispose();
//   });
//
//   return ad;
// });
//
//
// final adWidgetProvider = Provider.autoDispose<AdWidget>((ref) {
//   final ad = ref.watch(nativeAdProvider);
//   print('load');
//   return AdWidget(ad: ad);
// });

final interstitialAdProvider = ChangeNotifierProvider<InterstitialAdProvider>((ref) {
  return InterstitialAdProvider();
});

class InterstitialAdProvider extends ChangeNotifier {
  InterstitialAd? _interstitialAd;
  static const AdRequest request = AdRequest();
  int _numInterstitialLoadAttempts = 0;
  static const int maxFailedLoadAttempts = 3;

  late final Future<InterstitialAdLoader> _adLoader;
  InterstitialAd? _ad;

  initAds() {
    _adLoader = _createInterstitialAdLoader();
    _loadInterstitialAd();
  }

  Future<InterstitialAdLoader> _createInterstitialAdLoader() {
    return InterstitialAdLoader.create(
      onAdLoaded: (InterstitialAd interstitialAd) {
        // The ad was loaded successfully. Now you can show loaded ad
        _ad = interstitialAd;
      },
      onAdFailedToLoad: (error) {
        // Ad failed to load with AdRequestError.
        // Attempting to load a new ad from the onAdFailedToLoad() method is strongly discouraged.
      },
    );
  }
  Future<void> _loadInterstitialAd() async {
    final adLoader = await _adLoader;
    await adLoader.loadAd(adRequestConfiguration: AdRequestConfiguration(adUnitId: 'R-M-6396336-2')); // For debugging, you can use 'demo-interstitial-yandex'
  }

  showInterstitialAd() async {
    _ad?.setAdEventListener(
        eventListener: InterstitialAdEventListener(
          onAdShown: () {
            // Called when an ad is shown.
          },
          onAdFailedToShow: (error) {
            // Called when an InterstitialAd failed to show.
            // Destroy the ad so you don't show the ad a second time.
            _ad?.destroy();
            _ad = null;

            // Now you can preload the next interstitial ad.
            _loadInterstitialAd();
          },
          onAdClicked: () {
            // Called when a click is recorded for an ad.
          },
          onAdDismissed: () {
            // Called when ad is dismissed.
            // Destroy the ad so you don't show the ad a second time.
            _ad?.destroy();
            _ad = null;

            // Now you can preload the next interstitial ad.
            _loadInterstitialAd();
          },
          onAdImpression: (impressionData) {
            // Called when an impression is recorded for an ad.
          },
        ));
    await _ad?.show();
    await _ad?.waitForDismiss();
  }



}