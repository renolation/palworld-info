import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:palworld_info_app/providers/providers.dart';

import '../utils/ad_manager.dart';
final providerContainer = ProviderContainer();
final bannerAdProvider = FutureProvider.autoDispose<BannerAd>((ref) {

  final ad = BannerAd(
    adUnitId: AdManager.bannerAdUnitId,
    size: AdSize.fullBanner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        print('Ad failed to load: $error');
      },
    ),
  );

  ad.load();

  ref.onDispose(() {
    ad.dispose();
  });

  return ad;
});

final bannerAdWidgetProvider = FutureProvider.autoDispose<AdWidget>((ref) async {
  final ad = ref.watch(bannerAdProvider);

  return AdWidget(ad: ad.value!);
});

final nativeAdProvider = Provider.autoDispose<NativeAd>((ref) {
  final ad = NativeAd(
      adUnitId: AdManager.nativeAdUnitId,
      factoryId: 'adFactoryExample',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('$NativeAd loaded.');
          ref.read(nativeAdLoadStateProvider.notifier).update((state) => true);
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
        // Required: Choose a template.
          templateType: TemplateType.small,
          // Optional: Customize the ad's style.
          mainBackgroundColor: Colors.purple,
          cornerRadius: 10.0,
          callToActionTextStyle: NativeTemplateTextStyle(
              textColor: Colors.cyan,
              backgroundColor: Colors.red,
              style: NativeTemplateFontStyle.monospace,
              size: 16.0),
          primaryTextStyle: NativeTemplateTextStyle(
              textColor: Colors.red,
              backgroundColor: Colors.cyan,
              style: NativeTemplateFontStyle.italic,
              size: 16.0),
          secondaryTextStyle: NativeTemplateTextStyle(
              textColor: Colors.green,
              backgroundColor: Colors.black,
              style: NativeTemplateFontStyle.bold,
              size: 16.0),
          tertiaryTextStyle: NativeTemplateTextStyle(
              textColor: Colors.brown,
              backgroundColor: Colors.amber,
              style: NativeTemplateFontStyle.normal,
              size: 16.0)))
  ;

  ad.load();

  ref.onDispose(() {
    ad.dispose();
  });

  return ad;
});


final adWidgetProvider = Provider.autoDispose<AdWidget>((ref) {
  final ad = ref.watch(nativeAdProvider);
  print('load');
  return AdWidget(ad: ad);
});

final interstitialAdProvider = ChangeNotifierProvider<InterstitialAdProvider>((ref) {
  return InterstitialAdProvider();
});

class InterstitialAdProvider extends ChangeNotifier {
  InterstitialAd? _interstitialAd;
  static const AdRequest request = AdRequest();
  int _numInterstitialLoadAttempts = 0;
  static const int maxFailedLoadAttempts = 3;

  initAds() {

    createInterstitialAd();

  }

  createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdManager.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) {
                  log('ad showed');
                },
                onAdImpression: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                  createInterstitialAd();
                },
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  log('ad dismissed');
                  createInterstitialAd();
                },
                onAdClicked: (ad) {});
            log('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              Future.delayed(const Duration(minutes: 2)).then((value) => createInterstitialAd());
            }
          },
        ));
  }

  void showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}