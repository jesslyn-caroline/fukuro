import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fukuro/components/cards/greetings_card.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/home.dart';
import 'package:fukuro/styles/lighttheme.dart';
import 'package:provider/provider.dart';

import '../mocks/firebase_mock.dart';

void main() {
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
          home: Home(),
        ),
      )
    );

    await widgetTester.pumpAndSettle();
  }

  group('Check navigation functionality', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });

    testWidgets('The default screen is Home', (widgetTester) async {
      await initWidget(widgetTester);
      expect(find.byKey(ValueKey("homeBanner")), findsOneWidget);
    });

    // testWidgets('Navigate to Course', (widgetTester) async {
    //   await initWidget(widgetTester);

    //   await widgetTester.tap(find.byType(BottomNavigationBarItem).at(1));
    //   await widgetTester.pump();
    // });
  });
}