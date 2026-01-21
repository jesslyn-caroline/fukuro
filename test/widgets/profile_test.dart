import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/profile.dart';
import 'package:fukuro/styles/lighttheme.dart';
import 'package:provider/provider.dart';

import '../mocks/firebase_mock.dart';

void main () {
  Future<void> initWidget (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      MultiProvider(
        providers: [ ChangeNotifierProvider(create: (context) => ProfileProvider()),],
        child: MaterialApp(
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          // darkTheme: darkTheme,
          locale: Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Profile(),
        ),
      )
    );
  }

  group('Check widget availability', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });
    testWidgets('Setting Counts', (widgetTester) async {
      await initWidget(widgetTester);

      var settingTiles = find.byType(ListTile);
      expect(settingTiles, findsExactly(5));
    },);

    testWidgets('Profile Picture Setting', (widgetTester) async {
      await initWidget(widgetTester);

      var profilePictureSetting = find.byKey(ValueKey("profilePictureSetting"));
      expect(profilePictureSetting, findsOneWidget);

      var profilePictureText = find.text("Change Profile Picture");
      expect(profilePictureText, findsOneWidget);

      var profilePicture = find.byType(CircleAvatar);
      expect(profilePicture, findsOneWidget);   
    },);

    testWidgets('Switch Mode Setting', (widgetTester) async {
      await initWidget(widgetTester);

      var switchModeSetting = find.byKey(ValueKey("switchModeSetting"));
      expect(switchModeSetting, findsOneWidget);

      var switchModeText = find.text("Switch Mode");
      expect(switchModeText, findsOne);

      var switchModeBtn = find.byType(Switch);;
      expect(switchModeBtn, findsOneWidget);
    },);

    testWidgets('Change Username Setting', (widgetTester) async {
      await initWidget(widgetTester);

      var changeUsernameSetting = find.byKey(ValueKey("changeUsernameSetting"));
      expect(changeUsernameSetting, findsOneWidget);

      var changeUsernameText = find.text("Username");
      expect(changeUsernameText, findsOne);
    },);

    testWidgets('Change Password Setting', (widgetTester) async {
      await initWidget(widgetTester);

      var changePasswordSetting = find.byKey(ValueKey("changePasswordSetting"));
      expect(changePasswordSetting, findsOneWidget);

      var changePasswordText = find.text("• • • • • • • • • •");
      expect(changePasswordText, findsOne);
    },);

    testWidgets('Change Language', (widgetTester) async {
      await initWidget(widgetTester);

      var changeLanguageSetting = find.byKey(ValueKey("changeLanguageSetting"));
      expect(changeLanguageSetting, findsOneWidget);
    },);

    testWidgets('Logout', (widgetTester) async {
      await initWidget(widgetTester);

      var logoutSetting = find.byType(ElevatedButton);
      expect(logoutSetting, findsOneWidget);

      var logoutText = find.text("LOG OUT");
      expect(logoutText, findsOne);
    },);
  });
}