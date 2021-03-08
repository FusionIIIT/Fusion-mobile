import 'dart:convert';
import 'dart:io';

import 'package:fusion/models/user.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';

class LoginService {
  User? user;

  login(String username, String password) async {
    // TODO Add Try Except cases for Login

    HttpClient client = HttpClient();

    HttpClientRequest request =
        await client.post("172.27.17.216", 80, "/api/auth/login/");

    print(client);

    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    request.write(jsonEncode({"username": "2018225", "password": "dgVUwBc"}));

    HttpClientResponse response = await request.close();

    response.transform(utf8.decoder).listen((contents) {
      print(contents);
    });

    var prefs = await StorageService.getInstance();

    prefs!.saveUserInDB(User(username));
  }

  void logout() async {
    var prefs = await StorageService.getInstance();
    prefs!.deleteKey("user");
  }
}
