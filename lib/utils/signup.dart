import 'package:firebase_auth/firebase_auth.dart';

import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/permissions/internet_permission.dart';

Future <String> signup (String email, String displayName, String password, String confirmPassword) async {
  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreUser firestoreUser = FirestoreUser();

  String msg = "";

  msg = await isInternetConnected();
  if (msg != "") return msg;

  if (password != confirmPassword) {
    msg = "Passwords do not match";
    return msg;
  }

  msg = await firebaseAuthenticationService.signup(email, password, displayName);
  if (msg != "") return msg;

  User user = FirebaseAuth.instance.currentUser!;
  
  if (msg == "") firestoreUser.postOne(user.uid);   

  return msg;
}