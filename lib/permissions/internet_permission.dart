import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future <String> isInternetConnected () async {
  String msg = "";

  bool isConnected = await InternetConnection().hasInternetAccess;
  
  if (!isConnected) msg = "No internet connection";

  return msg;
}