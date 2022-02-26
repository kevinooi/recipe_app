import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    colorScheme: const ColorScheme(
      primary: Color(0xFFAC0A28),
      primaryContainer: Color(0xFFAC0A28),
      secondary: Color(0xFFE56A60),
      secondaryContainer: Color(0xFFE56A60),
      background: Color(0xFFF5F5F5),
      surface: Color(0xFFF5F5F5),
      error: Color(0x00000000),
      brightness: Brightness.light,
      onPrimary: Color(0xFFF5F5F5),
      onSecondary: Color(0xFFF5F5F5),
      onError: Color(0xFF2b2e4a),
      onBackground: Color(0xFF2b2e4a),
      onSurface: Color(0xFF2b2e4a),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xff0F2027),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xff0F2027),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0xff0F2027),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0xff0F2027),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0xff0F2027),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0xff808080),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color(0xffBDBDBD),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0xffBDBDBD),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
