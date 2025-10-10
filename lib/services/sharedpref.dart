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

  String getLoginStatus() {
    print( sharedPref?.getString('userLoggedIn'));
    return sharedPref?.getString('userLoggedIn') ?? "";
  }

  Future<void> setLoginStatus(String userLoggedIn) async {
    await sharedPref?.setString('userLoggedIn', userLoggedIn);
  }
}

final sharedPref = SharedPref();