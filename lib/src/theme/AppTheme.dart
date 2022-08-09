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
          fontSize: 36,
          fontWeight: FontWeight.bold,
          height: 1.2,
          letterSpacing: 3,
        ),
        headline5: TextStyle(
          fontFamily: GoogleFonts.alef().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        headline6: TextStyle(
          fontFamily: GoogleFonts.alef().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        caption: TextStyle(
          fontFamily: GoogleFonts.mulish().fontFamily,
          fontSize: 8,
        ),
        bodyText1: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          color: AppColors.basicFontColor,
          fontSize: 21,
          height: 1.4,
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
