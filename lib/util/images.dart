import "package:flutter/material.dart";

class Images {
  static const imagesAssetsPath = "assets/images";
  static String _fullPath(String fileName) => "$imagesAssetsPath/$fileName";

  static Widget welcomeScreenBackground =
    Image.asset(_fullPath("welcome_screen_background.jpeg"));

}
