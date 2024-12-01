import 'dart:convert';
import 'package:demo_form/Config/strings.dart';
import 'package:demo_form/Models/village_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Village>?> getVillageList() async {
  var url = Uri.parse(
      "${Strings.baseURL}lgd/napix/state/15/villages/v1/status/active");
  try {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => Village.fromJson(json)).toList();
    } else {
      if (kDebugMode) {
        ('Village :-Request failed with status: ${response.statusCode}.');
      }
      return null;
    }
  } on Error catch (err) {
    if (kDebugMode) {
      print("Village:- $err");
    }
    return null;
  }
}
