import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Utility {
  static String convertDateFormat(String date, String outFormat,
      {String inFormat = ""}) {
    try {
      var newDate = DateTime.now();
      if (inFormat != "") {
        DateFormat inputFormat = DateFormat(inFormat);
        newDate = inputFormat.parse(date);
      } else {
        newDate = DateTime.parse(date);
      }
      return DateFormat(outFormat).format(newDate);
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
      rethrow;
    }
  }
}
