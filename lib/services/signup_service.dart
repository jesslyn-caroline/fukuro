import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/permissions/internet_permission.dart';

class SignupService {
  FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreUser firestoreUser = FirestoreUser();

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  Future <String> signup () async {
    String msg = "";

    msg = await isInternetConnected();
    if (msg != "") return msg;

    if (passwordC.text != confirmPasswordC.text) {
      msg = "Passwords do not match";
      return msg;
    }

    msg = await _firebaseAuthenticationService.signup(emailC.text, passwordC.text, nameC.text);
    if (msg != "") return msg;

    User user = FirebaseAuth.instance.currentUser!;
    
    if (msg == "") firestoreUser.postOne(user.uid);   

    return msg;
}
}