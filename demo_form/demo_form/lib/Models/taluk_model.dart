
class Taluk {
  int blockCode;
  String blockNameEnglish;

  Taluk({
    required this.blockCode,
    required this.blockNameEnglish,
  });

  factory Taluk.fromJson(Map<String, dynamic> json) => Taluk(
        blockCode: json["blockCode"],
        blockNameEnglish: json["blockNameEnglish"],
      );
}
