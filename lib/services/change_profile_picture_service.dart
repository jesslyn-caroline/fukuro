import 'package:fukuro/firebase/firebase_authentication.dart';

class ChangeProfilePictureService {
  FirebaseAuthenticationService _authenticationService = FirebaseAuthenticationService();

  String? selectedImage;

  List <Map <String, dynamic>> profilePic = [
    { "pic" : "pp-bear.png" , "name" : "Bear"},
    { "pic" : "pp-rabbit.png" , "name" : "Rabbit" },
    { "pic" : "pp-dino.png" , "name" : "Dino" },
    { "pic" : "pp-racoon.png" , "name" : "Racoon" },
  ];

  void changeSelectedProfilePic (int index) => selectedImage = profilePic[index]["pic"];

  Future <void> change () async {
    await _authenticationService.changeProfilePic(selectedImage!);
  }
}