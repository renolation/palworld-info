import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872~9152144246";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872~4577887687";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872/4976508786";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872/5362928734";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872/7123411549";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872/4127461319";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9131188183332364/4129202021";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/3986624511";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872/4980463934";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872/9213951242";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
