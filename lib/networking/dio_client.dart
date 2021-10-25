import "package:dio/dio.dart";
import "package:securrency_test_app/config/flavor_config.dart";

class DioClient {
  static Dio countriesDioInstance = Dio(
  BaseOptions(
      baseUrl: FlavorConfig.instance!.values.countriesUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ),
  );
}
