import 'package:flutter/material.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late BannerAd banner;
  var isBannerAlreadyCreated = false;

  _loadAd() async {
    banner = _createBanner();
    setState(() {
      isBannerAlreadyCreated = true;
    });
  }

  BannerAdSize _getAdSize() {
    return BannerAdSize.sticky(width: 441);
  }

  _createBanner() {
    return BannerAd(
        adUnitId: 'R-M-6396336-1',
        // or 'demo-banner-yandex'
        adSize: _getAdSize(),
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

  @override
  initState() {
    super.initState();
    MobileAds.initialize();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('aaa'),
            Align(
              alignment: Alignment.bottomCenter,
              child: isBannerAlreadyCreated ? AdWidget(bannerAd: banner) : null,
            ),
          ],
        )
      ),
    );
  }
}
