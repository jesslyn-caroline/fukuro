import 'package:flutter/material.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/change_profile_picture.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                  onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeProfilePicture())),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: Image.asset("assets/images/pp-bear.png").image,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  context.watch<ProfileProvider>().name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                ListTile(
                  tileColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeProfilePicture())),
                  title: Text("Change Profile Picture", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary, 
                    fontWeight: FontWeight.w800
                  ),),
                  trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary,),
                ),
                ListTile(
                  title: Text("Switch mode", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary, 
                    fontWeight: FontWeight.w800
                  ),),
                  trailing: Switch(
                    value: context.watch<ProfileProvider>().isDark, 
                    onChanged: (value) => Provider.of<ProfileProvider>(context, listen: false).changeTheme(value),
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }
}