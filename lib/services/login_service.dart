import 'dart:convert';

import 'package:fusion/models/user.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> login(String username, String password) async {
    Map<String, String> data = {"username": username, "password": password};
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    var client = http.Client();
    var response = await client.post(
        Uri.http(
          "172.27.16.216:80",
          "/api/auth/login/",
        ),
        headers: headers,
        body: jsonEncode(data));
    var prefs = await StorageService.getInstance();
    if (response.body == ["Invalid credentials."]) {
      // TODO: handle this case
      return false;
    }
    prefs!.saveUserInDB(User((jsonDecode(response.body))["token"]));
    return true;
  }

  void logout() async {
    var prefs = await StorageService.getInstance();
    prefs!.deleteKey("user");
  }
}
