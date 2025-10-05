import 'package:flutter/material.dart';
import 'package:fukuro/screens/getstarted.dart';
import 'package:fukuro/screens/loading.dart';
import 'package:fukuro/screens/login.dart';
import 'package:fukuro/screens/welcome.dart';
import 'package:provider/provider.dart';

import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/providers/profile.dart';
import 'package:fukuro/screens/home.dart';
import 'package:fukuro/styles/darktheme.dart';
import 'package:fukuro/styles/lighttheme.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Profile()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: context.watch<Profile>().isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Home(),
    );
  }
}