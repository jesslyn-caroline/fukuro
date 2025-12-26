import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fukuro/notifications/notification.dart';
import 'package:fukuro/notifications/quiz_notification.dart';
// import 'package:fukuro/screens/testing.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:sqflite_common_ffi/windows/sqflite_ffi_setup.dart';

import 'package:fukuro/l10n/app_localizations.dart';

import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/welcome.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/styles/darktheme.dart';
import 'package:fukuro/styles/lighttheme.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref.init();
  
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;

  await Firebase.initializeApp();
  unawaited(MobileAds.instance.initialize());
  NotificationInit().init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: context.watch<ProfileProvider>().isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: Locale(context.watch<ProfileProvider>().selectedLang),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Welcome(),
    );
  }
}