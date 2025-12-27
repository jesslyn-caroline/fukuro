import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fukuro/admob/rewarded_ad_service.dart';
import 'package:fukuro/providers/profile_provider.dart';

class AdButton extends StatelessWidget {
  AdButton({super.key, required this.count});

  RewardedAdService _rewardedAdService = RewardedAdService();
  int count;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 12) 
      ),
      child: Row(
        spacing: 5,
        children: [
          Text(context.read<ProfileProvider>().userInfo!.point.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white, 
            fontSize: 16,
            fontWeight: FontWeight.w900
          )),
          Image.asset("assets/images/key.png", width: 18,)
        ],
      ),
      onPressed: () async {
        // await _rewardedAdService.showAd();
        _rewardedAdService.loadAd();
      },
    );
  }
}