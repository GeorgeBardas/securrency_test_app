class Country {

  Country(this.name);

  Country.fromJson(json) {
    name = json["name"].toString();
  }

  String? name;
}
