import 'package:flutter/material.dart';
import 'package:fukuro/providers/profile.dart';
import 'package:fukuro/screens/welcome.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/styles/darktheme.dart';
import 'package:fukuro/styles/lighttheme.dart';
import 'package:provider/provider.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Profile()),
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
<<<<<<< HEAD
      home: Home(),
=======
      home: Welcome(),
>>>>>>> c33af10ef98a07fa9fb400a507768cb1b4af4944
    );
  }
}