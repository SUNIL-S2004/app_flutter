class Village {
  int villageCode;
  String villageNameEnglish;
  int subDistrictCode;
  int stateCode;
  String census2011Code;
  String effectiveDate;
  String lastUpdated;

  int transactionId;

  Village({
    required this.villageCode,
    required this.villageNameEnglish,
    required this.subDistrictCode,
    required this.stateCode,
    required this.census2011Code,
    required this.effectiveDate,
    required this.lastUpdated,
    required this.transactionId,
  });

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        villageCode: json["villageCode"]??0,
        villageNameEnglish: json["villageNameEnglish"]??"",
        subDistrictCode: json["subDistrictCode"]??0,
        stateCode: json["stateCode"]??0,
        census2011Code: json["census2011Code"]??0,
        effectiveDate: json["effectiveDate"],
        lastUpdated: json["lastUpdated"],
        transactionId: json["transactionId"]??0,
      );
}
