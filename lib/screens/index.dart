import 'package:flutter/material.dart';
import 'package:fukuro/screens/reminder.dart';
import 'package:provider/provider.dart  ';

import 'package:fukuro/firebase/firebase_analytics.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/courses.dart';
import 'package:fukuro/screens/home.dart';
import 'package:fukuro/screens/profile.dart';
import 'package:fukuro/services/usersdb.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  FirebaseAnalyticsServices analytics = FirebaseAnalyticsServices();
  UsersDb usersDb = UsersDb();

  List <Map <String, dynamic>> screens = [
    { "screen" : Home(), "icon" : Icons.home_rounded, "label" : "Home" },
    { "screen" : Courses(), "icon" : Icons.book_rounded, "label" : "Courses" },
    { "screen" : Reminder(), "icon" : Icons.timer_sharp, "label" : "Reminder" },
    { "screen" : Profile(), "icon" : Icons.person_2_rounded, "label" : "Profile" },
  ];

  int index = 0;


  @override
  void initState() {
    context.read<ProfileProvider>().setUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[index]["screen"],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          onTap: (value) {
            analytics.movePage(screens[index]["label"], screens[value]["label"]);
            index = value;  
            print(context.read<ProfileProvider>().userInfo!.point);
            setState(() {});
          },
          items: [
            ...screens.map((e) {
              return BottomNavigationBarItem(icon: Icon(e["icon"]), label: e["label"]);
            })
          ]
        ),
      ),
    );
  }
}