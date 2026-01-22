import 'package:fukuro/services/sharedpref.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

Future <String> requestLocationPermission () async {
  String selectedLang = "en";

  bool isFirstOpen = sharedPref.checkIsFirstOpen();

  if (!isFirstOpen) return sharedPref.getSelectedLang() ?? "en"; 

  await sharedPref.setFirstOpen();

  var status = await Permission.location.status;

  if (status.isDenied) status = await Permission.location.request();

  if (status.isPermanentlyDenied) await openAppSettings();
  status = await Permission.location.status;

  if (status.isGranted) {
    String langCode = await detectLocale();
    selectedLang = langCode;
  }

  await sharedPref.setSelectedLang(selectedLang);

  return selectedLang;
}

Future<String> detectLocale() async {
  String locale = 'en';

  try {
    Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.low );
    if (-11 <= position.latitude && position.latitude <= 6 && 95 <= position.longitude && position.longitude <= 141) locale = 'id';
    else if (24 <= position.latitude && position.latitude <= 46 && 123 <= position.longitude && position.longitude <= 146) locale = 'ja';
    
  } catch (err) {
    print(err);
  }

  return locale;
}