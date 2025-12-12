import 'package:flutter/material.dart';

IconButtonThemeData darkThemeIconButton = IconButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.transparent),
    overlayColor: MaterialStatePropertyAll(Colors.transparent),
    iconColor: MaterialStatePropertyAll(Colors.white),
    iconSize: MaterialStatePropertyAll(24),
  )
);