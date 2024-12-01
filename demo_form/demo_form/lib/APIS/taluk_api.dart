import 'dart:convert';
import 'package:demo_form/Config/strings.dart';
import 'package:demo_form/Models/taluk_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Taluk>?> getTalukList(String code,) async {
  var url = Uri.parse("${Strings.baseURL}lgdws/blockList");
  try {
    final response = await http.post(url,body: {"districtCode": code},headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((json) => Taluk.fromJson(json))
          .toList();
    } else {
      if (kDebugMode) {
        ('Taluk :-Request failed with status: ${response.statusCode}.');
      }
      return null;
    }
  } on Error catch (err) {
    if (kDebugMode) {
      print("Taluk:- $err");
    }
    return null;
  }
}
