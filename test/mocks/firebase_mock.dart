import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

FirebaseOptions firebaseOptions = const FirebaseOptions(
  apiKey: 'AIzaSyDBR0aDek9f8gpdJ2_gtsJpuRrVtbVHyQw',
  appId: 'com.example.fukuro',
  messagingSenderId: 'tester01',
  projectId: 'fukuro-34691',
);

class MockFirebaseApp extends FirebaseAppPlatform {
  MockFirebaseApp({ String? name, FirebaseOptions? options }) : super(
    name ?? defaultFirebaseAppName,
    options ?? firebaseOptions,
  );
}

class MockFirebasePlatform extends FirebasePlatform {
  MockFirebasePlatform() : super();

  @override
  Future<FirebaseAppPlatform> initializeApp({ String? name, FirebaseOptions? options }) async {
    return MockFirebaseApp(name: name, options: options);
  }
  
  @override
  FirebaseAppPlatform app([String name = defaultFirebaseAppName]) {
    return MockFirebaseApp( name: name, options: firebaseOptions); 
  }
}

Future<void> setupFirebaseAuthMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  FirebasePlatform.instance = MockFirebasePlatform();
  await Firebase.initializeApp(options: firebaseOptions);
}