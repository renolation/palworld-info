import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/ad_manager.dart';
final providerContainer = ProviderContainer();
final bannerAdProvider = FutureProvider.autoDispose<BannerAd>((ref) {

  // final adSize = AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
  //   MediaQuery.of(ref.watch(providerContainer).read).size.width.toInt(),
  // );
  //
  // final AnchoredAdaptiveBannerAdSize? size =
  //     await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
  //     MediaQuery.of(context).size.width.truncate());


  // if (size == null) {
  //   print('Unable to get height of anchored banner.');
  //   return;
  // }


  final ad = BannerAd(
    adUnitId: AdManager.bannerAdUnitId,
    size: AdSize.fullBanner,
    request: AdRequest(),
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

final adWidgetProvider = FutureProvider.autoDispose<AdWidget>((ref) async {
  final ad = ref.watch(bannerAdProvider);

  return AdWidget(ad: ad.value!);
});