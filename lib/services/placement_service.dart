import 'dart:core';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;

class PlacementService {
  getPlacement(String token) async {
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        kPlacementCellRecord, //constant api
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("successfully fetched profile");
      return response;
    }
  }
}
