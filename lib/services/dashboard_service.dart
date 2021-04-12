import 'dart:convert';

import 'package:fusion/constants.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  getDashboard(String token) async {
    print(token);
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    print("start");
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        "/api/dashboard/",
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("success");
      return response;
    }
    throw Exception('Can\'t load');
  }

  markRead(String id) async {
    StorageService? prefs = await StorageService.getInstance();
    String token = prefs!.userInDB.token!;
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    Map<String, String> body = {"id": id};
    var client = http.Client();
    http.Response response = await client.post(
      Uri.http(
        getLink(),
        "/api/notification/read/",
      ),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      print("success");
      return response;
    }
    throw Exception('Can\'t load');
  }
}
