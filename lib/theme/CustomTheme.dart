import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomColors.dart';

class CustomTheme {

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors.primary,
      scaffoldBackgroundColor: CustomColors.primary,
      backgroundColor: CustomColors.appBackground,
      fontFamily: GoogleFonts.squarePeg().fontFamily,
      textTheme: TextTheme(
        button: TextStyle(
          fontSize: 24,
        ),
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          color: CustomColors.primary,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        bodyText1: TextStyle(
          color: CustomColors.customWarning,
          fontSize: 12,
          fontStyle: FontStyle.italic,
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
