import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  SharedPreferences? sharedPref;

  Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  bool getMode() {
    return sharedPref?.getBool('mode') ?? false;
  }

  Future<void> setMode(bool mode) async {
    await sharedPref?.setBool('mode', mode);
  }

  bool getLoginStatus() {
    return sharedPref?.getBool('isLoggedIn') ?? false;
  }

  Future<void> setLoginStatus(bool loginStatus) async {
    await sharedPref?.setBool('isLoggedIn', loginStatus);
  }
}

final sharedPref = SharedPref();