import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fukuro/providers/profile_provider.dart';

class ChangeProfilePicture extends StatefulWidget {
  ChangeProfilePicture({super.key});

  @override
  State<ChangeProfilePicture> createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
  List<String> profilePic = [ "pp-bear.png", "pp-rabbit.png", "pp-dino.png", "pp-racoon.png" ];

  String? getProfilePic () {
    return context.read<ProfileProvider>().currentUser?.profile;
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
<<<<<<< HEAD
              Map <String, dynamic> data = { "profile" : image };
=======
              Map<String, dynamic> data = { "profile" : image };
>>>>>>> 416e15439fe782f7e5e4e4ba6e78197fa4b723b6
              context.read<ProfileProvider>().updateUserInfo(data);
              Navigator.of(context).pop();
            },
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white
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
<<<<<<< HEAD
                  backgroundImage: Image.asset("assets/images/$image").image),
=======
                  backgroundImage: Image.asset("assets/images/$image").image,),
>>>>>>> 416e15439fe782f7e5e4e4ba6e78197fa4b723b6
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
                  child: GestureDetector(
                    onTap: () => setState(() {image = profilePic[index];}),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: Image.asset("assets/images/${profilePic[index]}").image),
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