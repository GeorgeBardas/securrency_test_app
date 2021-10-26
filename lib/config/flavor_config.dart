import "package:flutter/material.dart";

enum Flavor { dev, uat, prod }

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
    required this.countriesUrl,
    required this.countriesApiKey,
    required this.geoApiKey,
  });
  final String baseUrl;
  final String countriesUrl;
  final String countriesApiKey;
  final String geoApiKey;
}

class FlavorConfig {
  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      flavor.toString().split(".").last,
      color,
      values,
    );
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig? _instance;

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance!.flavor == Flavor.prod;
  static bool isUat() => _instance!.flavor == Flavor.uat;
  static bool isDevelopment() => _instance!.flavor == Flavor.dev;
}
