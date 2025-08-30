import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class RestaurantTextStyle {
  static final TextStyle _baseTextStyle = GoogleFonts.montserrat();

  /// Light text theme
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: _baseTextStyle.copyWith(
      fontSize: 57,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displayMedium: _baseTextStyle.copyWith(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displaySmall: _baseTextStyle.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headlineLarge: _baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: _baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headlineSmall: _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleLarge: _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleMedium: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleSmall: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    bodyLarge: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    bodySmall: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: Colors.black,
    ),
    labelLarge: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    labelMedium: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: Colors.black,
    ),
    labelSmall: _baseTextStyle.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w100,
      color: Colors.black,
    ),
  );

  /// Dark text theme
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: _baseTextStyle.copyWith(
      fontSize: 57,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayMedium: _baseTextStyle.copyWith(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displaySmall: _baseTextStyle.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headlineLarge: _baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineMedium: _baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headlineSmall: _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    titleLarge: _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleMedium: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    titleSmall: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    bodyLarge: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyMedium: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    bodySmall: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: Colors.white,
    ),
    labelLarge: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    labelMedium: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: Colors.white,
    ),
    labelSmall: _baseTextStyle.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w100,
      color: Colors.white,
    ),
  );
}
