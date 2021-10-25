import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class Images {
  static const imagesAssetsPath = "assets/images";
  static const welcomeBackgroundImagePath = "welcome_screen_background.jpeg";

  static String fullPath(String fileName) => "$imagesAssetsPath/$fileName";
  static Widget _fromFile(String fileName, {Color? color}) {
    return SvgPicture.asset(
      fullPath(fileName),
      color: color,
    );
  }

  static Widget inputIconVisible = _fromFile("password_show_icon.svg");
}
