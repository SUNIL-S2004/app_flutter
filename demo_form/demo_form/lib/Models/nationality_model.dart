class Nationality {
  String nationalityCode;
  String country;
  String countryTamil;

  Nationality({
    required this.nationalityCode,
    required this.country,
    required this.countryTamil,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
    nationalityCode: json["nationality_code"],
    country: json["country"],
    countryTamil: json["country_tamil"],
  );

  Map<String, dynamic> toJson() => {
    "nationality_code": nationalityCode,
    "country": country,
    "country_tamil": countryTamil,
  };
}
