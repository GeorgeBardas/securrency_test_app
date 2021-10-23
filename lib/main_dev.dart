import "package:flutter/material.dart";
import "package:securrency_test_app/main.dart";
import "config/flavor_config.dart";

void main() {
  FlavorConfig(
    flavor: Flavor.DEV,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(
        baseUrl: "dev-url.com",
    ),
  );

  runApp(MyApp());
}
