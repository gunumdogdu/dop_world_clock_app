import 'package:dop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color.dart';

class LightTheme {
  static const ColorScheme colorScheme = ColorScheme.light(
    primary: lightPrimaryColor,
    secondary: lightSecondaryColor,
    background: lightBgColor,
    surface: lightSecondaryColorWO,
    onPrimary: lightOutlineColor,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: lightCircleAround,
  );
  static final ThemeData data = ThemeData(
    colorScheme: colorScheme,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 79.a,
        fontFamily: 'Montserrat',
        color: lightSecondaryColor,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 18.a,
        fontFamily: 'Montserrat',
        color: lightSecondaryColor,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 24.a,
        fontFamily: 'Montserrat',
        color: lightSecondaryColor,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 20.a,
        fontFamily: 'Montserrat',
        color: lightSecondaryColor,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
          color: lightSecondaryColor,
          fontSize: 12.a,
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat'),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 15.a,
        color: lightSecondaryColor,
      ),
      bodySmall: TextStyle(
          color: lightSecondaryColor,
          fontSize: 12.a,
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat'),
      displayMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 15.a,
        color: lightSecondaryColor,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 32.a,
        color: lightSecondaryColor,
      ),
    ),
  );
}

class DarkTheme {
  static const ColorScheme colorScheme = ColorScheme.dark(
    primary: darkPrimaryColor,
    secondary: darkSecondaryColor,
    background: darkBgColor,
    surface: darkSecondaryColorWO,
    onPrimary: darkOutlineColor,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: lightCircleAround,
  );

  static final ThemeData data = ThemeData(
    colorScheme: colorScheme,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 79.a,
        fontFamily: 'Montserrat',
        color: darkSecondaryColor,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 18.a,
        fontFamily: 'Montserrat',
        color: darkSecondaryColor,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 24.a,
        fontFamily: 'Montserrat',
        color: darkSecondaryColor,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 20.a,
        fontFamily: 'Montserrat',
        color: darkSecondaryColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 15.a,
        color: darkSecondaryColor,
      ),
      bodySmall: TextStyle(
          color: darkSecondaryColor,
          fontSize: 12.a,
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat'),
      bodyLarge: TextStyle(
          color: lightSecondaryColor,
          fontSize: 12.a,
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat'),
      displayMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 15.a,
        color: darkSecondaryColor,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 32.a,
        color: darkSecondaryColor,
      ),
    ),
  );
}

class ThemeController extends GetxController {
  bool isDarkMode = false;

  void changeTheme() {
    isDarkMode = !isDarkMode;

    update();

    Get.changeTheme(isDarkMode ? DarkTheme.data : LightTheme.data);
  }
}
