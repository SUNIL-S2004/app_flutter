class Quarantine {
  String quarantineCode;
  String natureOfQuarantine;
  dynamic natureOfQuarantTamil;

  Quarantine({
    required this.quarantineCode,
    required this.natureOfQuarantine,
    required this.natureOfQuarantTamil,
  });

  factory Quarantine.fromJson(Map<String, dynamic> json) => Quarantine(
    quarantineCode: json["quarantine_code"],
    natureOfQuarantine: json["nature_of_quarantine"],
    natureOfQuarantTamil: json["nature_of_quarant_tamil"],
  );

  Map<String, dynamic> toJson() => {
    "quarantine_code": quarantineCode,
    "nature_of_quarantine": natureOfQuarantine,
    "nature_of_quarant_tamil": natureOfQuarantTamil,
  };
}