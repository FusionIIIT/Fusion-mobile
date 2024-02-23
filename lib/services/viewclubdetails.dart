import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

class ViewClubDetails {
  Future<List<dynamic>> getClubDetails() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };

      http.Response response = await http.get(
        Uri.http(
          getLink(),
          kClubDetailsPath, // Replace with the correct path for club details
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Club data fetched successfully");
        List<dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        throw Exception('Failed to fetch club details');
      }
    } catch (e) {
      rethrow;
    }
  }
}











