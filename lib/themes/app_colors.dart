import 'package:flutter/material.dart';

final splashScreenGradient = LinearGradient(
  begin: FractionalOffset.topCenter,
  end: FractionalOffset.bottomCenter,
  colors: [
    const Color(0xFF9F72FF).withOpacity(0.4),
    const Color(0xFF000000).withOpacity(0),
  ],
);

class AppColors {
  static const buttonColor = Color(0xFF40345A);
  static const mediumGray = Color(0xFFE5E5E5);
  static const darkGray = Color(0xFF414342);
  
  static const lightGray = Color(0xFF898989);
  
  static const gray = Color(0xFF798F9B);
  static const black = Color(0xff000000);
  static const white = Color(0xffFFFEFC);
  static const blue = Color(0xFF1A73E9);
  static const darkPurple = Color(0xFF5131E6);
  static const red = Color(0xFFD75A4A);
  static const purple = Color(0xFF9783F0);
  static const lightPurple = Color(0xFFDCD6FA);

  static const primaryColor = darkPurple;
}
