import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

import 'storage_service.dart';

class CreateClubService {
  Future<void> createClub({
    required String clubName,
    required String coordinator,
    required String coCoordinator,
    required String category,
    required String facultyIncharge,
    required String clubFile,
    required String description,
    required String status,
    required String headChangedOn, // Added parameter for head_changed_on
    required String createdOn, // Added parameter for created_on
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
        'club_file': clubFile,
        'description': description,
        'status': status,
        'head_changed_on': headChangedOn, // Convert DateTime to ISO 8601 string
        'created_on': createdOn, // Convert DateTime to ISO 8601 string
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kCreateClubPath, // Replace with the correct path for creating club
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        print("Club created successfully");
      } else {
        print("Failed to create club. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to create club');
      }
    } catch (e) {
      rethrow;
    }
  }
}
