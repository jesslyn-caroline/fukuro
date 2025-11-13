import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {

  Future <String> signup(String email, String password) async {
    String msg = "";

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      msg = "";

    } on FirebaseAuthException catch (err) {
      if (err.code == "email-already-in-use") msg = "Email already in use";
      else if (err.code == "invalid-email") msg = "Invalid email";
      else if (err.code == "weak-password") msg = "Weak password";
    }

    return msg;
  }

  Future <void> changePassword (String password) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      user!.updatePassword(password);
    } catch (err) {
      print(err);
    }
  }

  Future <String> login(String email, String password) async {
    String msg = "";

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      msg = "";
      
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-email") msg = "Invalid email";
      else if (err.code == "user-not-found") msg = "User not found";
      else if (err.code == "wrong-password") msg = "Wrong password";
      else if (err.code == "invalid-credential") msg = "Invalid credential";
    }

    return msg;
  }

  Future <void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}