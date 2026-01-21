import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/select_language.dart';
import 'package:fukuro/styles/lighttheme.dart';
import 'package:provider/provider.dart';

import '../mocks/firebase_mock.dart';

void main () {
  Future<void> initWidget (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      MultiProvider(
        providers: [ ChangeNotifierProvider(create: (context) => ProfileProvider()) ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              // darkTheme: darkTheme,
              locale: Locale(context.watch<ProfileProvider>().selectedLang),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: SelectLanguage(),
            );
          }
        ),
      ),
    );
  }

  group('Check widget availability', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });
    testWidgets('Language options count', (widgetTester) async {
      await initWidget(widgetTester);

      var languageOptions = find.byType(ListTile);
      expect(languageOptions, findsExactly(3));
    },);

    testWidgets('English Language Option', (widgetTester) async {
      await initWidget(widgetTester);

      var englishOptionLabel = find.text("English");
      var englishOptionKey = find.byKey(ValueKey("languageOption_en"));

      expect(englishOptionLabel, findsOneWidget);
      expect(englishOptionKey, findsOneWidget);
    },);

    testWidgets('Indonesian Language Option', (widgetTester) async {
      await initWidget(widgetTester);

      var indonesianOptionLabel = find.text("Indonesia");
      var indonesianOptionKey = find.byKey(ValueKey("languageOption_id"));

      expect(indonesianOptionLabel, findsOneWidget);
      expect(indonesianOptionKey, findsOneWidget);
    },);

    testWidgets('Japanese Language Option', (widgetTester) async {
      await initWidget(widgetTester);

      var japaneseOptionLabel = find.text("Japan");
      var japaneseOptionKey = find.byKey(ValueKey("languageOption_ja"));

      expect(japaneseOptionLabel, findsOneWidget);
      expect(japaneseOptionKey, findsOneWidget);
    },);
  });

  group('Check widget functionality', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });

    testWidgets('Select English Language', (widgetTester) async {
      await initWidget(widgetTester);

      var indonesianOptionKey = find.byKey(ValueKey("languageOption_id"));
      await widgetTester.tap(indonesianOptionKey);

      var englishOptionKey = find.byKey(ValueKey("languageOption_en"));
      await widgetTester.tap(englishOptionKey);

      await widgetTester.pump();

      expect(find.text('English'), findsOneWidget);
    },);

    testWidgets('Select Indonesia Language', (widgetTester) async {
      await initWidget(widgetTester);

      var indonesianOptionKey = find.byKey(ValueKey("languageOption_id"));
      await widgetTester.tap(indonesianOptionKey);

      var changeLangBtn = find.byKey(ValueKey("changeLanguageBtn"));
      await widgetTester.tap(changeLangBtn);

      await widgetTester.pump();

      expect(find.text('UBAH'), findsOneWidget);
    },);

    testWidgets('Select Japan Language', (widgetTester) async {
      await initWidget(widgetTester);

      var japaneseOptionKey = find.byKey(ValueKey("languageOption_ja"));
      await widgetTester.tap(japaneseOptionKey);

      var changeLangBtn = find.byKey(ValueKey("changeLanguageBtn"));
      await widgetTester.tap(changeLangBtn);

      await widgetTester.pump();

      expect(find.text('エイゴ'), findsOneWidget);
    },);
  });
}