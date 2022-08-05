import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeu_du_roi/src/theme/AppColors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.appBackground,
      scaffoldBackgroundColor: AppColors.appBackground,
      backgroundColor: AppColors.appBackground,
      fontFamily: GoogleFonts.dancingScript().fontFamily,
      textTheme: TextTheme(
        button: TextStyle(
          fontSize: 24,
        ),
        headline1: TextStyle(
          fontFamily: GoogleFonts.indieFlower().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: AppColors.basicFontColor,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          fontFamily: GoogleFonts.mochiyPopOne().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 40,
        ),
        headline4: TextStyle(
          fontFamily: GoogleFonts.indieFlower().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          height: 1.2,
          letterSpacing: 3,
        ),
        headline5: TextStyle(
          fontFamily: GoogleFonts.alef().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        caption: TextStyle(
          fontFamily: GoogleFonts.mulish().fontFamily,
          fontSize: 8,
        ),
        bodyText1: TextStyle(
          fontFamily: GoogleFonts.notoSerif().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 24,
          height: 1.5,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: AppColors.primary),
        ),
        buttonColor: AppColors.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            AppColors.primary,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: AppColors.primary),
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
            color: AppColors.buttonBorder,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.buttonBorder,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusColor: AppColors.bodyFontColor,
      ),
    );
  }
}
