import 'package:flutter/widgets.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';

class ChangeUsernameService {
  FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();

  TextEditingController nameC = TextEditingController();

  Future <void> change () async {
    await _firebaseAuthenticationService.changeDisplayName(nameC.text);
  }
}