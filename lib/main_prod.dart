import 'package:flutter/material.dart';
import 'package:securrency_test_app/main.dart';
import 'config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.PRODUCTION,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(
        baseUrl: "prod-url.com",
    ),
  );

  runApp(MyApp());
}
