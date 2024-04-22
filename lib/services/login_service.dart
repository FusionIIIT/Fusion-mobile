import 'dart:convert';

import 'package:fusion/api.dart';
import 'package:fusion/models/user.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> login(String username, String password) async {
    try {
      Map<String, String> data = {"username": username, "password": password};
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8'
      };

      print(data);

      var client = http.Client();
      var response = await client.post(
          Uri.http(
            kAuthUrl, // constant api url
            kAuthLogin, //constant api auth point
          ),
          headers: headers,
          body: jsonEncode(data));
      var prefs = await StorageService.getInstance();
      print("response.body: ${response.body}");

      var storageService = await StorageService.getInstance();
      storageService!.saveUserInDB(User((jsonDecode(response.body))["token"]));
      storageService.saveToDisk<List<String>>(
        'designations',
        (jsonDecode(response.body)["designations"] as List<dynamic>)
            .map((dynamic item) => item.toString())
            .toList(),
      );
      storageService.saveStringToDisk("Current_designation",jsonDecode(response.body)["designations"][0]);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  void logout() async {
    try {
      var storageService = await StorageService.getInstance();
      storageService!.deleteKey("user");
    } catch (e) {
      rethrow;
    }
  }
}