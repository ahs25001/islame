import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme {
  static Color blackColor = const Color(0XFF242424);
  static Color primary = const Color(0XFFB7935F);
  static Color primaryDark = const Color(0XFF141A2E);
  static Color yellow = const Color(0XFFFACC1D);
  static ThemeData light = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: blackColor,
          secondary: primary,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: primary,
          onBackground: Colors.white,
          surface: blackColor,
          onSurface: const Color(0XFFC9B396)),
      iconTheme: const IconThemeData(color: Color(0XFFB7935F)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
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
          bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            color: blackColor,
          ),
          bodyMedium: GoogleFonts.elMessiri(
            color: blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w100,
          ),
          bodyLarge: GoogleFonts.elMessiri(
              color: blackColor, fontWeight: FontWeight.bold, fontSize: 30)));
  static ThemeData dark = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primaryDark,
          onPrimary: Colors.white,
          secondary: yellow,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: primary,
          onBackground: blackColor,
          surface: Colors.white,
          onSurface: primaryDark),
      iconTheme: IconThemeData(color: yellow),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
        selectedItemColor: yellow,
        type: BottomNavigationBarType.shifting,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
          bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            color: yellow,
          ),
          bodyMedium: GoogleFonts.elMessiri(
            color: yellow,
            fontSize: 25,
            fontWeight: FontWeight.w100,
          ),
          bodyLarge: GoogleFonts.elMessiri(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)));
}
