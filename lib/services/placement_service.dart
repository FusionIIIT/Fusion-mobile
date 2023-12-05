import 'dart:core';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;

class PlacementService {
  Future<http.Response> getPlacementRecord(String token) async {
    try {
      Map<String, String> headers = {'Authorization': 'Token ' + token};
      print("fetching Academic Details");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kPlacementRecord, //Constant api path
        ),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get Placement records');
      }
      print("successfully fetched Placement Records");
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
