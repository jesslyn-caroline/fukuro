import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/providers/profile_provider.dart';

class ChangeProfilePicture extends StatefulWidget {
  ChangeProfilePicture({super.key});

  @override
  State<ChangeProfilePicture> createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
  // List<String> profilePic = [ "pp-bear.png", "pp-rabbit.png", "pp-dino.png", "pp-racoon.png" ];

  List <Map <String, dynamic>> profilePic = [
    { "pic" : "pp-bear.png" , "name" : "Bear"},
    { "pic" : "pp-rabbit.png" , "name" : "Rabbit" },
    { "pic" : "pp-dino.png" , "name" : "Dino" },
    { "pic" : "pp-racoon.png" , "name" : "Racoon" },
  ];

  String? getProfilePic () {
    return context.read<ProfileProvider>().user?.photoURL;
  }

  String? image;

  @override
  void initState() {
    image = getProfilePic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actionsPadding: EdgeInsets.all(12),
        actions: [
          TextButton(
            onPressed: () {  
              context.read<ProfileProvider>().updateUserProfile({ "profile" : image }, "profilePic");
              Navigator.of(context).pop();
            },
            child: Text(
              "${AppLocalizations.of(context)!.profilePictureSave}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 18
              )
            )
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)
              )
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: Image.asset("assets/images/$image").image),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(14),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
              itemCount: profilePic.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(18),
                  child: Semantics(
                    excludeSemantics: true,
                    label: "${profilePic[index]["name"]}",
                    hint: "Double Tap to ${profilePic[index]["name"]} as profile picture and tap Save button on top left of the page.",
                    child: GestureDetector(
                      onTap: () => setState(() {image = profilePic[index]["pic"];}),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: Image.asset("assets/images/${profilePic[index]["pic"]}").image),
                    ),
                  ),
                );
              },
            )
          ) 
        ],
      )
    );
  }
}