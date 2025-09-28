import 'package:flutter/material.dart';

void showSnackbar(context, String text, bool isError) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: isError ? Colors.redAccent : Theme.of(context).colorScheme.primary,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}