class District {
    int districtCode;
    String districtNameEnglish;

    District({
        required this.districtCode,
        required this.districtNameEnglish,
    });

    factory District.fromJson(Map<String, dynamic> json) => District(
        districtCode: json["districtCode"],
        districtNameEnglish: json["districtNameEnglish"],
    );
}