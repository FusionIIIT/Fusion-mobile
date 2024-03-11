import 'dart:core';
import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ExaminationService {
  Future<List<dynamic>> getRegisteredStudents(int courseId) async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      http.Response response = await http.get(
        Uri.http(
          getLink(),
          kRegisteredStudentDetails, // Update API endpoint
          {
            'course_id': courseId.toString()
          }, // Pass courseId as query parameter
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Parse the response body (assuming it's JSON)
        var data = jsonDecode(response.body);
        // Return the list of registered students
        return data['objt'];
      } else {
        throw Exception('Failed to fetch registered students');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkAllAuthenticators(int courseId, int year) async {
    try {
      var storageService = locator<StorageService>();

      if (storageService.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };

      http.Response response = await http.get(
        Uri.http(
          getLink(),
          kCheckAllAuthenticators,
          {'course_id': courseId.toString(), 'year': year.toString()},
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Parse the response body (assuming it's JSON)
        var data = jsonDecode(response.body);
        // Check if all authenticators are authenticated

        return data['all_authenticated'];
      } else {
        throw Exception('Failed to check all authenticators');
      }
    } catch (e) {
      rethrow;
    }
  }
}
