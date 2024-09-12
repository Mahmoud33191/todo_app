import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.background,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge:  GoogleFonts.lato(
        color: AppColors.white.withOpacity(0.87),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),

      displayMedium:  GoogleFonts.lato(
        color: AppColors.white.withOpacity(0.87),
        fontSize: 16,
      ),

      displaySmall: GoogleFonts.lato(
        color: AppColors.white.withOpacity(0.44),
        fontSize: 16,
      ),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),


    inputDecorationTheme: InputDecorationTheme(

      //enabledBorder
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.grey,
        ),
      ),

      //focusedBorder
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.grey,
        ),
      ),

      hintStyle:  GoogleFonts.lato(
        color: AppColors.white.withOpacity(0.87),
        fontSize: 16,
      ),


      filled: true,
      fillColor: AppColors.backGroundTextField,



    )

  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge:  GoogleFonts.lato(
        color: AppColors.background.withOpacity(0.87),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),

      displayMedium:  GoogleFonts.lato(
        color: AppColors.background.withOpacity(0.87),
        fontSize: 16,
      ),

      displaySmall: GoogleFonts.lato(
        color: AppColors.background.withOpacity(0.44),
        fontSize: 16,
      ),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
    ),

  );
}

