import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/profile_setting_tile.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/change_password.dart';
import 'package:fukuro/screens/change_profile_picture.dart';
import 'package:fukuro/screens/change_username.dart';
import 'package:fukuro/screens/getstarted.dart';
import 'package:fukuro/screens/select_language.dart';


class Profile extends StatelessWidget {
  Profile({super.key});

  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();

  Map <String, String> profilePic = {
    "pp-bear.png" : "Bear",
    "pp-dino.png" : "Dino",
    "pp-rabbit.png" : "Rabbit",
    "pp-racoon.png" : "Racoon",
  };

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Semantics(
                  excludeSemantics: true,
                  label: "Profile Picture, current Profile Picture: ${profilePic[context.watch<ProfileProvider>().user?.photoURL]}",
                  hint: "Double Tap to Change Profile Picture",
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeProfilePicture())),
                    child: CircleAvatar( radius: 50, backgroundImage: Image.asset("assets/images/${context.watch<ProfileProvider>().user!.photoURL}").image, ),
                  ),
                ),
                SizedBox(height: 10,),
                Semantics(
                  excludeSemantics: true,
                  child: Text( "${context.watch<ProfileProvider>().user?.displayName}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800 )
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                ProfileSettingTile(
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeProfilePicture())), 
                  title: "${l10n.profileProfilePicture}", 
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.primary, size: 20,)),
                SizedBox(height: 14,),
                Semantics(
                  label: "Current Mode: ${context.read<ProfileProvider>().isDark ? "Dark" : "Light" }",
                  child: ProfileSettingTile(
                    action: () => context.read<ProfileProvider>().changeTheme(!context.read<ProfileProvider>().isDark), 
                    title: "${l10n.profileSwitch}", 
                    trailing: Switch(
                      value: context.watch<ProfileProvider>().isDark, 
                      onChanged: (value) => context.read<ProfileProvider>().changeTheme(value))
                  ),
                ),
                SizedBox(height: 14,),
                Semantics(
                  hint: "Double Tap to Change Username",
                  child: ProfileSettingTile(
                    action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeUsername())), 
                    title: "${l10n.profileUsername}",
                    subtitle: context.watch<ProfileProvider>().user?.displayName,
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.primary, size: 20,),),
                ),
                SizedBox(height: 14,),
                ProfileSettingTile(
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword())), 
                  title: "${l10n.profilePassword}", 
                  subtitle: "• • • • • • • • • •",
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.primary, size: 20,),),
                SizedBox(height: 14,),        
                ProfileSettingTile(
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectLanguage(),)),
                  title: "${l10n.profileChangeLanguage}",
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.primary, size: 20,),
                ),  
                SizedBox(height: 14,), 
                BlockButton(
                  text: "${l10n.profileLogout}", 
                  action: () {
                    firebaseAuthenticationService.logout();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetStarted()));
                  }, 
                  bgColor: Theme.of(context).colorScheme.primary, 
                  textColor: Colors.white, 
                  borderColor: Theme.of(context).colorScheme.primary)
              ],
            )
          )
        ],
      )
    );
  }
}