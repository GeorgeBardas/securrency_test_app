import "package:flutter/material.dart";
import "package:securrency_test_app/util/app_dimensions.dart";

ThemeData light = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  primaryColorDark: Colors.black,
  colorScheme: const ColorScheme.light().copyWith(primary: Colors.black),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.black,
      textStyle: const TextStyle(color: Colors.black),
      side: const BorderSide(width: AppDimensions.buttonBorderWidth),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: AppDimensions.buttonBorderWidth),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(width: AppDimensions.buttonBorderWidth),
    ),
  ),
);

ThemeData dark = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  primaryColorDark: Colors.white,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.white,
      textStyle: const TextStyle(color: Colors.white),
      side: const BorderSide(color: Colors.white, width: AppDimensions.buttonBorderWidth),
    ),
  ),
);
