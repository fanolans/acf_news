import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kColorPrimary = Colors.white;
const Color kColorSecondary = Color(0xFF000000);
const Color kColorMaroon = Color.fromARGB(255, 121, 0, 0);
const Color darkPrimaryColor = Color(0xFF000000);
const Color darkSecondaryColor = Colors.white;

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: kColorPrimary,
        onPrimary: Colors.black,
        secondary: kColorSecondary,
      ),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: textTheme,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorMaroon,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: darkPrimaryColor,
        onPrimary: Colors.white,
        secondary: darkSecondaryColor,
      ),
  scaffoldBackgroundColor: darkPrimaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: textTheme,
  appBarTheme:
      const AppBarTheme(backgroundColor: darkPrimaryColor, elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorMaroon,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    ),
  ),
);

final textTheme = TextTheme(
  headline1: GoogleFonts.inter(
      fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.inter(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.inter(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.inter(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.inter(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
