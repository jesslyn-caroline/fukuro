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

  String? getSelectedLang() {
    return sharedPref?.getString('lang');
  }

  Future<void> setSelectedLang(String lang) async {
    await sharedPref?.setString('lang', lang);
  }

  Future <void> clear() async => await sharedPref?.remove('lang');
}

final sharedPref = SharedPref();