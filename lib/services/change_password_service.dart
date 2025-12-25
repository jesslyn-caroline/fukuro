import 'package:flutter/material.dart';

import 'package:fukuro/firebase/firebase_authentication.dart';

class ChangePasswordService {
  FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();

  TextEditingController currentPasswordC = TextEditingController();
  TextEditingController newPasswordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  Future <String> change() async {
    String msg = "";
    
    if (newPasswordC.text != confirmPasswordC.text) {
      msg = "Passwords do not match";
      return msg;
    }

    msg = await _firebaseAuthenticationService.changePassword(currentPasswordC.text, newPasswordC.text);

    return msg;
  }
}