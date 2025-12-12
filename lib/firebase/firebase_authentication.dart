import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {

  Future <String> signup(String email, String password, String name) async {
    String msg = "";

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      msg = "";

      await FirebaseAuth.instance.currentUser?.updateProfile(
        displayName: name,
        photoURL: 'pp-dino.png'
      );

    } on FirebaseAuthException catch (err) {
      if (err.code == "email-already-in-use") msg = "Email already in use";
      else if (err.code == "invalid-email") msg = "Invalid email";
      else if (err.code == "weak-password") msg = "Weak password";
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

      print("CHANGED $user");
    } on FirebaseAuthException catch (err) {
      // if (err.code == ) 
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