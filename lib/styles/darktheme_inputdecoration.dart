import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecorationTheme darkThemeInputDecoration = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  filled: true,
  fillColor: Color(0XFF222222),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color(0XFF222222), width: 1.5),
  ), 
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color(0XFF222222), width: 1.5),
  ),
  hintStyle: GoogleFonts.quicksand(
    color: Color(0XFF919191),
    fontWeight: FontWeight.w700,
    fontSize: 16
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color(0XFF5B31B5), width: 1.5),
  ),
);