class ReasonCode {
  String reasonCode;
  String reasonByDesc;

  ReasonCode({
    required this.reasonCode,
    required this.reasonByDesc,
  });

  factory ReasonCode.fromJson(Map<String, dynamic> json) => ReasonCode(
    reasonCode: json["reason_code"],
    reasonByDesc: json["reason_by_desc"],
  );

  Map<String, dynamic> toJson() => {
    "reason_code": reasonCode,
    "reason_by_desc": reasonByDesc,
  };
}