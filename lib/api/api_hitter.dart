import 'dart:convert';
import 'dart:developer';

import 'package:apiwithstatemangement/model/time_model.dart';

import 'package:http/http.dart' as http;

class ApiHitter {
  var resData;
  Future<TimeModel> ApiGeter({required String jsonUrl}) async {
    var Parsed_url = Uri.parse(jsonUrl);
    var response = await http.get(Parsed_url);

    if (response.statusCode == 200) {
      log("API HITTED!");

      log(response.body);

    resData = jsonDecode(response.body);

      //// we shourld remove this to make it

      return resData!;
    } else {
      log("Api Failed");

      return resData!;
    }
  }
}
