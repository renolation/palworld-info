import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

import '../utils/ad_manager.dart';

final providerContainer = ProviderContainer();
final isBannerAdLoadedProvider = StateProvider<bool>((ref) => false);
final bannerHeightProvider = StateProvider<double>((ref) => 0);

class BannerAdProvider extends ChangeNotifier {
  // late BuildContext context;
  late BannerAd banner;
  var isBannerAlreadyCreated = false;

  loadAd(BuildContext ctx) async {
    banner = createBanner(ctx);
    isBannerAlreadyCreated = true;
  }

  createBanner(BuildContext ctx) {
    return BannerAd(
        adUnitId: 'demo-banner-yandex',
        // or 'demo-banner-yandex'
        adSize: _getAdSize(ctx),
        adRequest: const AdRequest(),
        onAdLoaded: () {
          // The ad was loaded successfully. Now it will be shown.
        },
        onAdFailedToLoad: (error) {
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
        });
  }

  BannerAdSize _getAdSize(BuildContext ctx) {
    final screenWidth = MediaQuery.of(ctx).size.width.round();
    return BannerAdSize.sticky(width: screenWidth);
  }
}

final bannerAdProvider = ChangeNotifierProvider<BannerAdProvider>((ref) {
  return BannerAdProvider();
});

final interstitialAdProvider =
    ChangeNotifierProvider<InterstitialAdProvider>((ref) {
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
    await adLoader.loadAd(
        adRequestConfiguration: const AdRequestConfiguration(
            adUnitId:
                'demo-interstitial-yandex')); // For debugging, you can use 'demo-interstitial-yandex'
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
