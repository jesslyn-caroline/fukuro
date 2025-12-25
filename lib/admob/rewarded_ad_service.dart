import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdService {
  final String rewardAdId = "ca-app-pub-3940256099942544/5224354917";
  RewardedAd? rewardAd;

  String msg = "";

  void loadAd() async {
    rewardAd = null;
    RewardedAd.load(
      adUnitId: rewardAdId, 
      request: AdRequest(), 
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => rewardAd = ad,
        onAdFailedToLoad: (error) => msg = "Failed to load Ad",
      )
    );
  }
}