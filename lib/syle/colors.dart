import 'package:flutter/material.dart';

class AppColor {
  // PRIMARY
  static const primary = Color(0xFFD3F8F7);
  static const primary2 = Color(0xFF9FEFEE);
  static const primary3 = Color(0xFF63E5E3);
  static const primary4 = Color(0xFF3ADFDB);
  static const primary5 = Color(0xFF1DB4B1);

  // SECONDARY
  static const secondary = Color(0xFFF8D9D3);
  static const secondary2 = Color(0xFFEFAC9F);
  static const secondary3 = Color(0xFFE57963);
  static const secondary4 = Color(0xFFDE563A);
  static const secondary5 = Color(0xFFB3371E);

  // GRADIENT
  static const gradient = LinearGradient(
    colors: [Color(0xFF2252CD), Color(0xFF12A4DE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //static const gradient2 = Color(0xFFF8D9D3);

  // SHADES

  static var blackShade = Colors.black.withOpacity(0.03);
  static const redShade = Color(0xFFEFAC9F);

  // BACKGROUND COLOR

  static const stroke = Color(0xFFDADADA);

  // BACKGROUND COLOR

  static const backgroundBlue = Color(0xFFF8FBFC);
  static const backgroundWhite = Color(0xFFFFFFFF);
  //static const backgroundBlack = Color(0xFF121212);
  static const backgroundBlack = Color(0xFF1B1B1F);

  // BLACK & WHITE & GRAY

  static const black = Color.fromARGB(255, 0, 0, 0);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const transparent = Colors.transparent;
  static const gray = Color.fromARGB(255, 190, 188, 188);
  static const darkGray = Color.fromARGB(255, 150, 148, 148);
}
