import 'package:flutter/material.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/services/usersdb.dart';
import 'package:provider/provider.dart';
import 'package:fukuro/admob/rewarded_ad_service.dart';
import 'package:fukuro/providers/profile_provider.dart';

class AdButton extends StatefulWidget {
  AdButton({super.key});

  @override
  State<AdButton> createState() => _AdButtonState();
}

class _AdButtonState extends State<AdButton> {
  UsersDb _usersDb = UsersDb();

  FirestoreUser _firestoreUser = FirestoreUser();
  RewardedAdService _rewardedAdService = RewardedAdService();

  @override
  void initState() {
    // TODO: implement initState
    _rewardedAdService.loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 12) 
      ),
      child: Icon(Icons.movie_filter_outlined, size: 24, color: Colors.white),
      onPressed: () async {
        await _rewardedAdService.showAd((reward) async {
          Map <String, dynamic> data = { "key" : context.read<ProfileProvider>().userInfo!.key + reward };
          context.read<ProfileProvider>().setUserInfo(null, null, null, data["key"]);
          await _usersDb.updateByUID(context.read<ProfileProvider>().userInfo!.uid, data);
          await _firestoreUser.updateByUID(context.read<ProfileProvider>().userInfo!.uid, data);
        });

        if (_rewardedAdService.rewardAd == null) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to load Ad")));
        setState(() {});
        _rewardedAdService.loadAd();
      },
    );
  }
}