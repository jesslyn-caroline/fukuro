import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {

  Map <String, String> errMsg = {
    "email-already-in-use" : "Email already in use",
    "invalid-email" : "Invalid email",
    "weak-password" : "Weak password",
    "user-not-found" : "User not found",
    "wrong-password" : "Wrong password",
    "invalid-credential" : "Invalid credential"
  };

  Future <String> signup(String email, String password, String displayName) async {
    String msg = "";

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      msg = "";

      await FirebaseAuth.instance.currentUser?.updateProfile(
        displayName: displayName,
        photoURL: 'pp-dino.png'
      );

    } on FirebaseAuthException catch (err) {
      msg = errMsg[err.code] ?? "Something went wrong";
    }

    return msg;
  }

  Future <void> changePassword (String oldPassword, String password) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      final cred = EmailAuthProvider.credential(
        email: user!.email!, 
        password: oldPassword
      );
      
      await user.reauthenticateWithCredential(cred);
      await user.updatePassword(password);
    } on FirebaseAuthException catch (err) {
      print(err);
    }
  }
  
  Future <void> changeProfilePic (String pic) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await user!.updatePhotoURL(pic);
    } catch (err) {
      print(err);
    }
  }

  Future <void> changeDisplayName (String name) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await user!.updateDisplayName(name);
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

  Future <void> logout() async => await FirebaseAuth.instance.signOut();
}