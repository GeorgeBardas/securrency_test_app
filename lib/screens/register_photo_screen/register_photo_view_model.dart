import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import "package:securrency_test_app/networking/models/country.dart";
import "package:securrency_test_app/networking/models/user.dart";
import "package:securrency_test_app/networking/repositories/countries_repository.dart";
import "package:securrency_test_app/util/encrypt_util.dart";

class RegisterPhotoViewModel extends ChangeNotifier {

  Uint8List? _selectedPhoto;
  Uint8List? get selectedPhoto => _selectedPhoto;

  setPhoto(Uint8List? photo) {
    _selectedPhoto = photo;
    notifyListeners();
  }

}
