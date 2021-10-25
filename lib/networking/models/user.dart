class User {

  User.name(this.email, this.password, this.birthDate, this.country);

  String email;
  String password;
  DateTime birthDate;
  String country;

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "birth_date": birthDate,
      "country": country,
    };
  }
}