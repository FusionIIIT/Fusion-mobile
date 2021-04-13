import 'dart:convert';

import 'package:fusion/constants.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  getProfile(String token) async {
    //print('Token '+token);
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    print("fetching profile");
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        "/api/profile/",
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("successfully fetched profile");
      var service = locator<StorageService>();
      service.saveStringToDisk("ProfileKey",
          jsonEncode(ProfileData.fromJson(jsonDecode(response.body)).toJson()));
      return response;
    }
    throw Exception('Can\'t load');
  }
}
