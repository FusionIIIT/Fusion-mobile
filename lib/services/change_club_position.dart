import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart'; // Import your constants file here
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class ChangeClubPositionService {
  Future<void> changeClubPosition({
    required String clubName,
    required String coordinator,
    required String coCoordinator,
  }) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token ${storageService.userInDB?.token ?? ""}',
      };

      Map<String, dynamic> body = {
        'club_name': clubName,
        'co_ordinator': coordinator,
        'co_coordinator': coCoordinator,
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(), // Replace getLink() with your method to get the API link
          kChangeClubPositionPath, // Replace with the correct path for changing club positions
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("Club positions updated successfully");
      } else {
        print(
            "Failed to update club positions. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to update club positions');
      }
    } catch (e) {
      rethrow;
    }
  }
}
