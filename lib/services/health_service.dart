import 'dart:core';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;

class HeathService {
  Future<http.Response> getHealth(String token) async {
    try {
      Map<String, String> headers = {'Authorization': 'Token ' + token};
      var client = http.Client();
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
    } catch (e) {
      rethrow;
    }
  }
}
