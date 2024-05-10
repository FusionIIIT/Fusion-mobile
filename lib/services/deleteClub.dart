import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class DeleteClubService {
  Future<void> deleteClub({
    required String clubName,
    required String coordinator,
    required String coCoordinator,
    required String category,
    required String facultyIncharge,
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
        'category': category,
        'faculty_incharge': facultyIncharge,
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kDeleteClubPath, // Define the correct path for deleting the club
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("Club deleted successfully");
      } else {
        print("Failed to delete club. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to delete club');
      }
    } catch (e) {
      rethrow;
    }
  }
}
