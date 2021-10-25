import "package:flutter/material.dart";
import "package:securrency_test_app/screens/register_screen/register_screen.dart";

class Routes {
  Routes._();

  static const String registerScreen = "/register_screen";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      registerScreen: (context) => const RegisterScreen(),
    };
  }
}
