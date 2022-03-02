import 'package:flutter/material.dart';

import 'custom_color.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(),
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    colorScheme: const ColorScheme(
      primary: CustomColors.primaryRed,
      primaryContainer: CustomColors.primaryRed,
      secondary: CustomColors.secondaryRed,
      secondaryContainer: CustomColors.secondaryRed,
      background: CustomColors.scaffoldBackgroundColor,
      surface: CustomColors.scaffoldBackgroundColor,
      error: CustomColors.primaryText,
      brightness: Brightness.light,
      onPrimary: CustomColors.scaffoldBackgroundColor,
      onSecondary: CustomColors.scaffoldBackgroundColor,
      onError: CustomColors.darkBlue,
      onBackground: CustomColors.darkBlue,
      onSurface: CustomColors.darkBlue,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        color: CustomColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
  );
}
