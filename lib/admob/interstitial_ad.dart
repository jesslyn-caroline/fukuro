import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdService {
  final String _interstitialAdId = "ca-app-pub-3940256099942544/1033173712";
  InterstitialAd? interstitialAd;

  Future <void> showAd() async => interstitialAd?.show();

  void loadAd() async {
    interstitialAd = null;
    InterstitialAd.load(
      adUnitId: _interstitialAdId, 
      request: AdRequest(), 
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => interstitialAd = ad, 
        onAdFailedToLoad: (error) => print('Failed to load Ad'),
      )
    );
  }
}