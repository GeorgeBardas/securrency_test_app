import "dart:typed_data";

class User {

  User.name(this.email, this.password, this.birthDate, this.country);

  String email;
  String password;
  DateTime birthDate;
  String country;
  Uint8List? photo;

  void setPhoto(Uint8List newPhoto) => photo = newPhoto;

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "birth_date": birthDate,
      "country": country,
    };
  }
}
