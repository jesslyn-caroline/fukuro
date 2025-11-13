import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/profile_setting_tile.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/change_password.dart';
import 'package:fukuro/screens/change_profile_picture.dart';
import 'package:fukuro/screens/change_username.dart';
import 'package:fukuro/screens/getstarted.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();

  @override
  Widget build(BuildContext context) {
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
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeProfilePicture())),
                  child: CircleAvatar( radius: 50, backgroundImage: Image.asset("assets/images/${context.watch<ProfileProvider>().currentUser?.profile}").image, ),
                ),
                SizedBox(height: 10,),
                Text( "${context.watch<ProfileProvider>().currentUser?.name}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800 )
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
                  title: "Change Profile Picture", 
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.primary, size: 20,)),
                SizedBox(height: 14,),
                ProfileSettingTile(
                  action: () => {}, 
                  title: "Switch Mode", 
                  trailing: Switch(
                    value: context.watch<ProfileProvider>().isDark, 
                    onChanged: (value) => context.read<ProfileProvider>().changeTheme(value))
                ),
                SizedBox(height: 14,),
                ProfileSettingTile(
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeUsername())), 
                  title: "Username",
                  subtitle: context.watch<ProfileProvider>().currentUser?.name,
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.primary, size: 20,),),
                SizedBox(height: 14,),
                ProfileSettingTile(
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword())), 
                  title: "Password", 
                  subtitle: "• • • • • • • • • •",
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.primary, size: 20,),),
                SizedBox(height: 14,),                
                BlockButton(
                  text: "LOG OUT", 
                  action: () {
                    firebaseAuthenticationService.logout();
                    context.read<ProfileProvider>().changeLoginStatus("");
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