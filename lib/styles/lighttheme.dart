import 'package:flutter/material.dart';
import 'package:fukuro/styles/lighttheme_inputdecoration.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0XFF5B31B5),
    secondary: Color(0XFFAC87E8),
    tertiary: Color(0XFFD9CBF6),
    background: Color(0XFFFFFFFF),
    surfaceContainer: Color(0XFFECECEC),

  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.quicksand(
      color: Color(0XFF121212),
      fontWeight: FontWeight.w600,
    ),
  ),
  inputDecorationTheme: lightThemeInputDecoration,
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0XFF5B31B5),
    actionBackgroundColor: Color(0XFF5B31B5),
    behavior: SnackBarBehavior.floating
  ),
  scaffoldBackgroundColor: Color(0XFFFFFFFF),
);