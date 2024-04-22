import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class UpdateClubNameService {
  Future<void> updateClubName({
    required String clubName,
    required String coordinator,
    required String coCoordinator,
    required String facultyIncharge,
    required String newClubName,
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
        'faculty_incharge': facultyIncharge,
        'new_club': newClubName,
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kUpdateClubNamePath, // Define the correct path for updating club name
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("Club name updated successfully");
      } else {
        print("Failed to update club name. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to update club name');
      }
    } catch (e) {
      rethrow;
    }
  }
}
