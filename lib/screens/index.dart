import 'package:flutter/material.dart';
import 'package:fukuro/screens/home.dart';
import 'package:fukuro/screens/profile.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {

  List <Map <String, dynamic>> screens = [
    { "screen" : Home(), "icon" : Icons.home_rounded, "label" : "Home" },
    { "screen" : Profile(), "icon" : Icons.person_2_rounded, "label" : "Profile" },
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (value) => setState(() => index = value),
        items: [
          ...screens.map((e) {
            return BottomNavigationBarItem(icon: Icon(e["icon"]), label: e["label"]);
          })
        ]
      ),
    );
  }
}