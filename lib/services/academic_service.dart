import 'dart:convert';

import 'package:fusion/constants.dart';
import 'package:fusion/models/academic.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class AcademicService {
  getAcademic(String token) async {
    //print('Token '+token);
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    print("fetching Academic Details");
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        "academic-procedures/api/stu/",
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("successfully fetched details");
      var service = locator<StorageService>();
      service.saveStringToDisk(
          "ProfileKey",
          jsonEncode(
              AcademicData.fromJson(jsonDecode(response.body)).toJson()));
      return response;
    } else
      print("error fetching details");
    throw Exception('Can\'t load');
  }
}
