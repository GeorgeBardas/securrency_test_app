import "package:flutter/material.dart";
import "package:securrency_test_app/util/app_themes.dart";

class GeneralProvider with ChangeNotifier {

  bool _isLightTheme = true;
  ThemeData get getTheme => _isLightTheme ? light : dark;
  ThemeMode get getThemeMode => _isLightTheme
      ? ThemeMode.light
      : ThemeMode.dark;

  void switchTheme(){
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

}
