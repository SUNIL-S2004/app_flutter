import 'dart:convert';
import 'package:demo_form/Models/nationality_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Nationality>?> getnationist() async {
  var url = Uri.parse("http://10.163.14.240/Corona_gps/nationality");
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      print(response.body);
      return jsonResponse.map((json) => Nationality.fromJson(json)).toList();
    } else {
      if (kDebugMode) {
        ('nation :-Request failed with status: ${response.statusCode}.');
      }
      return null;
    }
  } on Error catch (err) {
    if (kDebugMode) {
      print("District:- $err");
    }
    return null;
  }
}
