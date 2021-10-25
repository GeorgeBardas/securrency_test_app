import "package:flutter/material.dart";
import "package:securrency_test_app/networking/models/country.dart";
import "package:securrency_test_app/networking/repositories/countries_repository.dart";

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

    _setLoading(false);

    return result;
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

}
