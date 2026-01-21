import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/screens/signup.dart';
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
        home: Signup(),
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
      expect(textFields, findsExactly(4));
    },);

    testWidgets('Name Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var nameField = find.byKey(ValueKey("signupNameField"));
      expect(nameField, findsOneWidget);

      var nameHintText = find.text("Name");
      expect(nameHintText, findsOneWidget);
    },);

    testWidgets('Email Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var emailField = find.byKey(ValueKey("signupEmailField"));
      expect(emailField, findsOneWidget);

      var emailHintText = find.text("Email");
      expect(emailHintText, findsOneWidget);
    },);

    testWidgets('Password Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var passwordField = find.byKey(ValueKey("signupPasswordField"));
      expect(passwordField, findsOneWidget);

      var passwordHintText = find.text("Password");
      expect(passwordHintText, findsOneWidget);
    },);

    testWidgets('Confirm Password Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var confirmPasswordField = find.byKey(ValueKey("signupConfirmPasswordField"));
      expect(confirmPasswordField, findsOneWidget);

      var confirmPasswordHintText = find.text("Confirm Password");
      expect(confirmPasswordHintText, findsOneWidget);
    },);

    testWidgets('Signup Button', (widgetTester) async {
      await initWidget(widgetTester);

      var signupBtn = find.byKey(ValueKey("signupBtn"));
      expect(signupBtn, findsOneWidget);

      var signupBtnText = find.text("SIGN UP");
      expect(signupBtnText, findsOneWidget);
    },);
  });

  group('Check widget functionality', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });

    testWidgets('Name Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var nameField = find.byKey(ValueKey("signupNameField"));
      await widgetTester.enterText(nameField, "Test User");

      var fieldValue = find.text("Test User");
      
      expect(fieldValue, findsOneWidget);
    },);

    testWidgets('Email Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var emailField = find.byKey(ValueKey("signupEmailField"));
      await widgetTester.enterText(emailField, "test@example.com");

      var fieldValue = find.text("test@example.com");

      expect(fieldValue, findsOneWidget);
    },);

    testWidgets('Password Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var passwordField = find.byKey(ValueKey("signupPasswordField"));
      await widgetTester.enterText(passwordField, "password123");

      var fieldValue = find.text("password123");
      expect(fieldValue, findsOneWidget);
    },);

    testWidgets('Confirm Password Text Field', (widgetTester) async {
      await initWidget(widgetTester);

      var confirmPasswordField = find.byKey(ValueKey("signupConfirmPasswordField"));
      await widgetTester.enterText(confirmPasswordField, "password123");

      var fieldValue = find.text("password123");
      expect(fieldValue, findsOneWidget);
    },);
  });
}