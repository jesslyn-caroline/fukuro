import 'package:flutter/material.dart';
import 'package:fukuro/admob/rewarded_ad_service.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/services/usersdb.dart';

class HomeService {
  RewardedAdService _rewardedAdService = RewardedAdService();
  FirestoreUser _firestoreUser = FirestoreUser();
  UsersDb _usersDb = UsersDb();

  Future <void> watchAd( void Function() setState, void Function() onFailed, String uid, int totalKey ) async {
    if (_rewardedAdService.rewardAd == null) {
      onFailed();
      return;
    }
    await _rewardedAdService.showAd((reward) =>updateKey(uid, totalKey + reward));
    setState();
    _rewardedAdService.loadAd();
  }

  Future <void> updateKey (String uid, int totalKey) async {
    Map <String, dynamic> data = { "key" :  totalKey };
    _firestoreUser.updateByUID(uid, data);
    _usersDb.updateByUID(uid, data);
  }
}