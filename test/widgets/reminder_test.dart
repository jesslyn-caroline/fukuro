import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fukuro/components/reminder_tile.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/providers/reminder_provider.dart';
import 'package:fukuro/screens/reminder.dart';
import 'package:fukuro/styles/lighttheme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../mocks/firebase_mock.dart';

void main() {
  Future<void> initWidget (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      MultiProvider(
        providers: [ ChangeNotifierProvider(create: (context) => ReminderProvider()),],
        child: MaterialApp(
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          // darkTheme: darkTheme,
          locale: Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Reminder(),
        ),
      )
    );

    await widgetTester.pumpAndSettle();
  }

  group('Check widgets availablity', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });

    testWidgets('Reminder Tile count', (widgetTester) async {
      await initWidget(widgetTester);

      var reminderTile = find.byType(ReminderTile);

      expect(reminderTile, findsNWidgets(2));
    });

    testWidgets('Date picker', (widgetTester) async {
      await initWidget(widgetTester);

      var datePickerTile = find.byKey(ValueKey('datePicker'));
      var datePickerTitle = find.text('Date');
      
      expect(datePickerTile, findsOneWidget);
      expect(datePickerTitle, findsOneWidget);
    });

    testWidgets('Time picker', (widgetTester) async {
      await initWidget(widgetTester);

      var datePickerTile = find.byKey(ValueKey('timePicker'));
      var datePickerTitle = find.text('Time');

      expect(datePickerTile, findsOneWidget);
      expect(datePickerTitle, findsOneWidget);
    });

    testWidgets('Save / Cancel button', (widgetTester) async {
      await initWidget(widgetTester);

      var saveOrCancelBtn = find.byKey(ValueKey('saveOrCancelBtn'));

      expect(saveOrCancelBtn, findsOneWidget);
    },);
  });

  group('Check widgets functionality', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
    });

    testWidgets('Default timer', (widgetTester) async {
      await initWidget(widgetTester);

      var date = find.text(DateFormat.yMMMMd().format(DateTime.now()));
      var time = find.text(DateFormat.Hm().format(DateTime.now().add(Duration(minutes: 5))));

      expect(date, findsOneWidget);
      expect(time, findsOneWidget);
    },);

    testWidgets('Set timer', (widgetTester) async {
      await initWidget(widgetTester);

      var saveBtn = find.text('SET REMINDER');
      var cancelBtn = find.text('CANCEL');
      var btn = find.byKey(ValueKey('saveOrCancelBtn'));

      expect(saveBtn, findsOneWidget);
      expect(cancelBtn, findsNothing);

      await widgetTester.tap(btn);
      await widgetTester.pump();

      expect(saveBtn, findsNothing);
      expect(cancelBtn, findsOneWidget);

      await widgetTester.tap(btn);
    },);

    testWidgets('Cancel timer', (widgetTester) async {
      await initWidget(widgetTester);

      var saveBtn = find.text('SET REMINDER');
      var cancelBtn = find.text('CANCEL');
      var btn = find.byKey(ValueKey('saveOrCancelBtn'));

      await widgetTester.tap(btn);
      await widgetTester.pump();

      expect(saveBtn, findsNothing);
      expect(cancelBtn, findsOneWidget);

      await widgetTester.tap(btn);
      await widgetTester.pump();

      expect(saveBtn, findsOneWidget);
      expect(cancelBtn, findsNothing);      
    },);
  });
}