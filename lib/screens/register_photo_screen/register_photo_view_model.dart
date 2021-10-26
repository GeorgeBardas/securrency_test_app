import "dart:typed_data";

import "package:flutter/material.dart";

class RegisterPhotoViewModel extends ChangeNotifier {

  Uint8List? _selectedPhoto;
  Uint8List? get selectedPhoto => _selectedPhoto;

  setPhoto(Uint8List? photo) {
    _selectedPhoto = photo;
    notifyListeners();
  }

}
