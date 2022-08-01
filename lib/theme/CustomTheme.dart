import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomColors.dart';

class CustomTheme {

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors.appBackground,
      scaffoldBackgroundColor: CustomColors.appBackground,
      backgroundColor: CustomColors.appBackground,
      fontFamily: GoogleFonts.dancingScript().fontFamily,

      textTheme: TextTheme(
        button: TextStyle(
          fontSize: 24,
        ),
        headline1: TextStyle(
          fontFamily: GoogleFonts.indieFlower().fontFamily,
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          fontFamily: GoogleFonts.indieFlower().fontFamily,
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          letterSpacing: 4.5,
        ),
        headline4: TextStyle(
          fontFamily: GoogleFonts.indieFlower().fontFamily,
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        headline5: TextStyle(
          fontFamily: GoogleFonts.indieFlower().fontFamily,
          color: Colors.white,
          fontSize: 38,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        caption: TextStyle(
          color: CustomColors.primary,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        bodyText1: TextStyle(
          fontFamily: GoogleFonts.indieFlower().fontFamily,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),



      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: CustomColors.primary),
        ),
        buttonColor: CustomColors.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            CustomColors.primary,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: CustomColors.primary),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color.fromRGBO(240, 240, 240, 1.0),
        //border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.primary,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        focusColor: CustomColors.primary,

      ),
    );
  }





}
