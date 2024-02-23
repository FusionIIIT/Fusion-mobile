import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

class SessionDetailsService {
  Future<List<dynamic>> getSessionDetails() async {
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
          kSessionDetailsPath, // Replace with the correct path for session details
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("data fetched successfully");
        List<dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        throw Exception('Failed to fetch session details');
      }
    } catch (e) {
      rethrow;
    }
  }
}
