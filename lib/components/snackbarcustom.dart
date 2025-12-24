import 'package:flutter/material.dart';

SnackBar snackBarCustom(String message, context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return SnackBar(
    showCloseIcon: true,
    closeIconColor: Colors.white,
    content: Text(message, style: TextStyle( color: Colors.white )),
    backgroundColor: Theme.of(context).colorScheme.primary,
    duration: Duration(seconds: 5),
  );
}