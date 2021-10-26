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
      countriesUrl: "http://api.countrylayer.com/v2/",
      countriesApiKey: "c9d04d904e56105ff370e404477c1190",
      geoApiKey: "AIzaSyDDvvVpTuyxjEaoopv_5tGpOp8hsomlxjw",
    ),
  );

  runApp(
    MultiProvider(
      providers: getProviders(),
      child: MyApp(),
    ),
  );
}
