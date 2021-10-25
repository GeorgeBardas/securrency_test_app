import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/main.dart";
import "config/flavor_config.dart";

void main() {
  FlavorConfig(
    flavor: Flavor.uat,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(
        baseUrl: "uat-url.com",
    ),
  );

  runApp(
    MultiProvider(
      providers: getProviders(),
      child: MyApp(),
    ),
  );
}
