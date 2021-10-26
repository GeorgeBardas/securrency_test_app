import "package:flutter/material.dart";
import "package:securrency_test_app/screens/register_photo_screen/register_photo_screen.dart";
import "package:securrency_test_app/screens/register_screen/register_screen.dart";

class Routes {
  Routes._();

  static const String registerScreen = "/register_screen";
  static const String registerPhotoScreen = "/register_photo_screen";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      registerScreen: (context) => const RegisterScreen(),
      registerPhotoScreen: (context) => const RegisterPhotoScreen(),
    };
  }
}
