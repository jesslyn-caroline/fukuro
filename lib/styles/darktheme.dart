import 'package:flutter/material.dart';
import 'package:fukuro/styles/darktheme_inputdecoration.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme( color: Colors.transparent ),
  colorScheme: ColorScheme.dark(
    primary: Color(0XFF875CFF),
    tertiary: Color(0XFFD9CBF6),
    secondary: Color(0XFFAC87E8),
    background: Color(0XFF121212),
    surfaceContainer: Color(0XFF222222),
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.quicksand(
      color: Color(0XFFFFFFFF),
      fontWeight: FontWeight.w600
    ),
  ),
  inputDecorationTheme: darkThemeInputDecoration,
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0XFF875CFF),
    actionBackgroundColor: Color(0XFF875CFF),
    behavior: SnackBarBehavior.floating
  ),
  scaffoldBackgroundColor: Color(0XFF121212),
);