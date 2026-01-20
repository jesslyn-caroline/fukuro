import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/providers/reminder_provider.dart';
import 'package:fukuro/screens/profile.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

class MockFirebaseApp extends FirebaseAppPlatform {
  MockFirebaseApp({
    String? name,
    FirebaseOptions? options,
  }) : super(
          name ?? defaultFirebaseAppName,
          options ??
              const FirebaseOptions(
                apiKey: 'testApiKey',
                appId: 'testAppId',
                messagingSenderId: 'testSenderId',
                projectId: 'testProjectId',
              ),
        );
}

class MockFirebasePlatform extends FirebasePlatform {
  MockFirebasePlatform() : super();

  @override
  Future<FirebaseAppPlatform> initializeApp({
    String? name,
    FirebaseOptions? options,
  }) async {
    return MockFirebaseApp(name: name, options: options);
  }
  
// use the const name "defaultFirebaseAppName", 
  @override
  FirebaseAppPlatform app([String name = defaultFirebaseAppName]) {
    return MockFirebaseApp(
      name: name,
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDBR0aDek9f8gpdJ2_gtsJpuRrVtbVHyQw',
        appId: 'com.example.fukuro',
        messagingSenderId: 'tester01',
        projectId: 'fukuro-34691',
      ),
    );
  }

  Future<void> resetApp(String name) async {
    // Mock the reset behavior for tests
    return;
  }
}
Future<void> setupFirebaseAuthMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  FirebasePlatform.instance = MockFirebasePlatform();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDBR0aDek9f8gpdJ2_gtsJpuRrVtbVHyQw',
      appId: 'com.example.fukuro',
      messagingSenderId: 'tester01',
      projectId: 'fukuro-34691',
    ),
  );
}
void main () {

  

  group('login', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseAuthMocks();
      
      

    });

    testWidgets('Update Profile Pic', (widgetTester) async {
      await widgetTester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProfileProvider()),
            ChangeNotifierProvider(create: (context) => ReminderProvider(),),
          ],
          child: MaterialApp(home: Profile())
        )
      );

      // await widgetTester.pump(Duration(seconds: 3));

      // expect(find.byType(Text), findsExactly(2));
    },);
  });
}