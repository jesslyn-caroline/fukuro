import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdService {
  final String rewardAdId = "ca-app-pub-3940256099942544/5224354917";
  RewardedAd? rewardAd;

  String msg = "";

  void loadAd() async {
    rewardAd = null;
    await RewardedAd.load(
      adUnitId: rewardAdId, 
      request: AdRequest(), 
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => { rewardAd = ad, msg = "" },
        onAdFailedToLoad: (error) => msg = "Failed to load Ad",
      )
    );
  }

  Future <void> showAd(void Function(int reward) onRewarded) async {
    await rewardAd?.show(
      onUserEarnedReward: (ad, reward) => onRewarded(reward.amount as int),
    );
  }
}