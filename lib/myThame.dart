import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color blackColor = Color(0XFF242424);
  static ThemeData light = ThemeData(
    iconTheme: IconThemeData(color: Color(0XFFB7935F)),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      selectedItemColor: blackColor,
      type: BottomNavigationBarType.shifting,
    ),
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: blackColor),
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
            color: blackColor, fontWeight: FontWeight.bold, fontSize: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
          bodySmall: GoogleFonts.elMessiri(fontSize: 20, color: blackColor,),
          bodyMedium: GoogleFonts.elMessiri(
            color: blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w100,
          ),
          bodyLarge: GoogleFonts.elMessiri(
              color: blackColor, fontWeight: FontWeight.bold, fontSize: 30)));
}
