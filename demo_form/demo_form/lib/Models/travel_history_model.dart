class TravelHistory {
  String travelHistoryCode;
  String travelHistoryDescription;
  String travelHistoryDescriptionTamil;

  TravelHistory({
    required this.travelHistoryCode,
    required this.travelHistoryDescription,
    required this.travelHistoryDescriptionTamil,
  });

  factory TravelHistory.fromJson(Map<String, dynamic> json) => TravelHistory(
    travelHistoryCode: json["travel_history_code"],
    travelHistoryDescription: json["travel_history_description"],
    travelHistoryDescriptionTamil: json["travel_history_description_tamil"],
  );

  Map<String, dynamic> toJson() => {
    "travel_history_code": travelHistoryCode,
    "travel_history_description": travelHistoryDescription,
    "travel_history_description_tamil": travelHistoryDescriptionTamil,
  };
}