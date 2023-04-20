// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import '../api.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ProjectService {
  getProjectData() async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching Penalty");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kResearchProjects,
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched Project Data");
        return response;
      } else {
        print("error fetching Project Data");
      }
      throw Exception('Can\'t load Project Data');
    } catch (e) {
      rethrow;
    }
  }
}
