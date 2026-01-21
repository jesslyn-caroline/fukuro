import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/screens/login.dart';
import 'package:fukuro/styles/lighttheme.dart';

import '../mocks/firebase_mock.dart';

void main () {
  Future<void> initWidget (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // darkTheme: darkTheme,
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Login(),
      ),
    );
  }

  group('Check widget availability', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });

    testWidgets('Field counts', (widgetTester) async {
      await initWidget(widgetTester);

      var textFields = find.byType(TextField);
      expect(textFields, findsExactly(2));
    },);

    testWidgets('Email Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var emailField = find.byKey(ValueKey("loginEmailField"));
      expect(emailField, findsOneWidget);

      var emailHintText = find.text("Email");
      expect(emailHintText, findsOneWidget);
    },);

    testWidgets('Password Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var passwordField = find.byKey(ValueKey("loginPasswordField"));
      expect(passwordField, findsOneWidget);

      var passwordHintText = find.text("Password");
      expect(passwordHintText, findsOneWidget);
    },);

    testWidgets('Login Button', (widgetTester) async {
      await initWidget(widgetTester);

      var loginBtn = find.byKey(ValueKey("loginBtn"));
      expect(loginBtn, findsOneWidget);

      var loginBtnText = find.text("LOGIN");
      expect(loginBtnText, findsOneWidget);
    },);
  });

  group('Check widget functionality', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });

    testWidgets('Email Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var emailField = find.byKey(ValueKey("loginEmailField"));
      await widgetTester.enterText(emailField, "test@example.com");

      var fieldValue = find.text("test@example.com");

      expect(fieldValue, findsOneWidget);
    },);

    testWidgets('Password Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var passwordField = find.byKey(ValueKey("loginPasswordField"));
      await widgetTester.enterText(passwordField, "password123");

      var fieldValue = find.text("password123");
      expect(fieldValue, findsOneWidget);
    },);
  });
}