class RiskFactor {
  String riskFactorCode;
  String riskFactor;
  String riskFactorTamil;

  RiskFactor({
    required this.riskFactorCode,
    required this.riskFactor,
    required this.riskFactorTamil,
  });

  factory RiskFactor.fromJson(Map<String, dynamic> json) => RiskFactor(
    riskFactorCode: json["risk_factor_code"],
    riskFactor: json["risk_factor"],
    riskFactorTamil: json["risk_factor_tamil"],
  );

  Map<String, dynamic> toJson() => {
    "risk_factor_code": riskFactorCode,
    "risk_factor": riskFactor,
    "risk_factor_tamil": riskFactorTamil,
  };
}