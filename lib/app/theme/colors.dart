import 'package:flutter/material.dart';

class AppColors {
  static const Color secondary = Colors.green;
  static const Color fullWhite = Colors.white;
  static const Color fullBlack = Colors.black;
  
  static const MaterialColor primary = MaterialColor(
    0XFFFF5E75,
    <int, Color>{
      50: Color(0xFFFFEBED),
      100: Color(0xFFFFCED3),
      200: Color(0xFFFFACB5),
      300: Color(0xFFFF8A97),
      400: Color(0xFFFF6F81),
      500: Color(0XFFFF5E75),
      600: Color(0xFFE65568),
      700: Color(0xFFCC4B5C),
      800: Color(0xFFB24150),
      900: Color(0xFF8F323F),
    },
  );


  static const MaterialColor greySwatch = MaterialColor(
    0xFF9E9E9E,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      400: Color(0xFFBDBDBD),
      500: Color(0xFF9E9E9E),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424242),
      900: Color(0xFF212121),
    },
  );
}
