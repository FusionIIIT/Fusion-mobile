import 'dart:convert';
import 'dart:core';
import 'package:fusion/constants.dart';
import 'package:fusion/models/health.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class HeathService {
  getHealth(String token) async {

    Map<String, String> headers = {
      'Authorization': 'Token ' + token
    };
    var client=http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        "/healthcenter/api/student",
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("successfully fetched profile");
      return response;
    }
    throw Exception('Can\'t load');
  }
}