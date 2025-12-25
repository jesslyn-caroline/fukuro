import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdService {
  final String bannerAdId = "ca-app-pub-3940256099942544/9214589741";
  BannerAd? bannerAd;

  Future <void> loadAd(void Function() setState) async {
    await BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          setState();
        },
        onAdFailedToLoad: (ad, error) => print(error),
      )
    ).load();
  }
}