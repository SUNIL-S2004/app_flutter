import 'dart:convert';
import 'package:demo_form/Config/strings.dart';
import 'package:demo_form/Models/district_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<District>?> getDistrictList() async {
  var url = Uri.parse("${Strings.baseURL}lgd/napix/districts/v1/status/active");

  try {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((json) => District.fromJson(json))
          .toList();
    } else {
      if (kDebugMode) {
        ('District :-Request failed with status: ${response.statusCode}.');
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
