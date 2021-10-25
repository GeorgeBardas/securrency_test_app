import "package:dio/dio.dart";
import "package:securrency_test_app/config/flavor_config.dart";
import "package:securrency_test_app/networking/dio_client.dart";
import "package:securrency_test_app/networking/models/country.dart";

class _Urls {
  static String countriesUrl = "all";
}

class CountriesRepository {
  Future<List<Country>?> getCountries() async {
    try {
      final Response response = await DioClient
          .countriesDioInstance
          .get(_Urls.countriesUrl,
        queryParameters: {
          "access_key": FlavorConfig.instance?.values.countriesApiKey
        },);

      return List<Country>.from((response.data as List).map((model)=> Country.fromJson(model)));
    } catch (e) {
      return null;
    }
  }
}
