import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> submit(
    {required String name, required String address, required String remarks,
      required String photo, required String district, required String village,
      required String taluk, required String quarantine, required String travel,
      required String latitude, required String longitude, required String mobile,
      required String patient, required String nation, required String date,
      required String age, required String gender, required String risk,
    required String reason_code}) async {
  var url = Uri.parse("http://10.163.14.240/Corona_gps/Corona_details");
  //};
  try {
    final response = await http.post(url,body: jsonEncode( {"name": name,
      "rev_district_code":district,"rev_village_code":village,"address":address,
      "taluk_code":taluk,"nature_of_quarantine":quarantine,
      "travel_history":travel,"latitude":latitude,"longitude":longitude,
      "mobile_number":mobile,"patient_id":patient,"nationality_code":nation,
     "date_of_positive_confirmation":date,
      "age":age,"gender":gender,"photo":photo,"remarks":remarks,"risk_factor":risk,"reason_code":reason_code}),headers: {
      "Content-Type": "application/json",
    },);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  } on Error catch (err) {
    print('submit -> error occurred: $err.');
    return null;
  }
}