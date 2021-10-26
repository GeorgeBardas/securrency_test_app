import "package:flutter/material.dart";
import "package:geocode/geocode.dart";
import "package:geolocator/geolocator.dart";
import 'package:securrency_test_app/config/flavor_config.dart';
import "package:securrency_test_app/networking/models/country.dart";
import "package:securrency_test_app/networking/models/user.dart";
import "package:securrency_test_app/networking/repositories/countries_repository.dart";
import "package:securrency_test_app/util/encrypt_util.dart";

class RegisterViewModel extends ChangeNotifier {

  List<Country>? _countries = [];
  List<Country>? get countries => _countries;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<List<Country>?> getCountries() async {
    _setLoading(true);

    final result = await CountriesRepository().getCountries();
    _countries = result;

    await _findCountry();

    _setLoading(false);

    return result;
  }

  Future<Address?> _getCurrentAddress() async {
    try {
      final Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      final Address address = await GeoCode(apiKey: FlavorConfig.instance!.values.geoApiKey)
          .reverseGeocoding(latitude: position.latitude, longitude: position.longitude);
      return address;
    } catch (e) {
        return null;
    }
  }

  Future<void> _findCountry() async {
    final Address? address = await _getCurrentAddress();

    if (address != null) {
      Country? country;
      try {
        country = _countries?.firstWhere((element) => element.name == address.countryName);
      } catch (e) {
        country = null;
      }
      if (country != null) {
        _countries?.remove(country);
        _countries?.insert(0, country);
      }
    }
  }

  User getUser(String email, String password, String country) {
    return User.name(
      email,
      encryption(password),
      _selectedDate!,
      country,
    );
  }
  
  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setSelectedDate(DateTime? dateTime) {
    _selectedDate = dateTime;
    notifyListeners();
  }
  
  bool isValidDate() {
    if (_selectedDate == null) {
      return false;
    }
    return DateTime(_selectedDate!.year + 18, _selectedDate!.month, _selectedDate!.day).isBefore(DateTime.now());
  }

  bool matchPasswords(String? password, String? currentPassword) {
    return password == currentPassword;
  }

  void clear() {
    _countries = [];
    _selectedDate = null;
    _isLoading = false;
  }

}
