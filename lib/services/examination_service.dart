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

  Future<void> updateAuthenticator(
      String course, int year, int authenticatorNumber) async {
    try {
      var storageService = locator<StorageService>();

      if (storageService.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };

      http.Response response = await http.patch(
        Uri.http(
          getLink(),
          kUpdateAuthenticator,
        ),
        headers: headers,
        body: {
          'course_id': course,
          'year': year.toString(),
          'authenticator_number': authenticatorNumber.toString()
        },
      );

      if (response.statusCode == 200) {
        // Authenticator toggled successfully
        print(
            'Authenticator $authenticatorNumber toggled successfully for the year $year and course id $course');
      } else {
        throw Exception('Failed to toggle authenticator');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> generateTranscriptForm(
      String programme, int batch, String specialization) async {
    print(programme);
    print(batch);
    print(specialization);

    try {
      var storageService = locator<StorageService>();

      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };

      http.Response response = await http.post(
        Uri.parse(
            'http://localhost:8000/examination/api/generate_transcript_form/'),
        headers: headers,
        body: {
          'programme': programme,
          'batch': batch.toString(),
          'specialization': specialization,
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        List<dynamic> studentsData = jsonDecode(response.body)['students'];

        // Convert the list of dynamic to List<Map<String, dynamic>>
        List<Map<String, dynamic>> studentsList =
            List<Map<String, dynamic>>.from(studentsData);

        // Print the list of students for debugging
        // print('List of students: $studentsList');

        return studentsList;
      } else {
        throw Exception('Failed to generate transcript form');
      }
    } catch (e) {
      rethrow;
    }
  }




Future<Map<String, dynamic>> generateTranscript(String studentId) async {
  try {
    var storageService = locator<StorageService>();
    if (storageService.userInDB?.token == null) {
      throw Exception('Token Error');
    }

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
    };

    http.Response response = await http.post(
      Uri.parse('http://localhost:8000/examination/api/generate_transcript/'),
      headers: headers,
      body: {'student': studentId},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response directly into a Map<String, dynamic>
      Map<String, dynamic> data = jsonDecode(response.body);
      // Extract the courses grades from the response
      List<dynamic> coursesGrades = data['courses_grades'];
      // Return the courses grades
      print(coursesGrades);
      return {'courses_grades': coursesGrades};
    } else {
      print(response.body); // Print the response body for debugging
      throw Exception('Failed to generate transcript');
    }
  } catch (e) {
    throw Exception('Failed to connect to the server');
  }
}

}
