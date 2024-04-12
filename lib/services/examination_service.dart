import 'dart:core';
import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ExaminationService {
  Future<List<dynamic>> getRegisteredStudents(
      int courseId, String semester, String batch) async {
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
            'course': courseId.toString(),
            'semester': semester,
            'batch': batch
          }, // Pass courseId, semester, and batch as query parameters
        ),
        headers: headers,
      );
      // print(response.body);
      if (response.statusCode == 200) {
        // Parse the response body (assuming it's JSON)
        var data = jsonDecode(response.body);
        // Return the list of registered students

        return data['registrations'];
      } else {
        throw Exception('Failed to fetch registered students');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkAllAuthenticators(int courseId, String year) async {
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
          {'course_id': courseId.toString(), 'year': year},
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

  Future<String> getGradesForCourse({
    required int courseId,
    required String batch,
    required String programme,
    required String specialization,
    required String selectedStudentId,
  }) async {
    try {
      var storageService = locator<StorageService>();

      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ${storageService.userInDB!.token}',
      };

      // Construct the query parameters
      Map<String, String> queryParams = {
        'course_id': courseId.toString(),
        'batch': batch,
        'programme': programme,
        'specialization': specialization,
        'selected_student_id': selectedStudentId,
      };

      http.Response response = await http.get(
        Uri.http(
          getLink(),
          kGradesForCourseEndpoint, // Update API endpoint for grades
          queryParams,
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Parse the response body (assuming it's JSON)
        var data = jsonDecode(response.body);
        // Return the grade
        return data['grade'];
      } else {
        throw Exception('Failed to fetch grades for course');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCourseItems() async {
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
          kCourseDetails, // Update API endpoint for course details
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Parse the response body (assuming it's JSON)
        var data = jsonDecode(response.body);

        // Check if the response contains the key 'courses'
        if (data.containsKey('courses')) {
          // Extract course data from the response
          List<Map<String, dynamic>> courseData =
              List<Map<String, dynamic>>.from(data['courses']);
          print(courseData);
          return courseData;
        } else {
          throw Exception('API response does not contain course data');
        }
      } else {
        throw Exception('Failed to fetch course items');
      }
    } catch (e) {
      // Rethrow any exceptions that occur
      rethrow;
    }
  }

  Future<void> updateAuthenticator(
      int courseId, String year, int authenticatorNumber) async {
    print(courseId);
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      var response = await http.patch(
        Uri.http(
          getLink(),
          '/examination/api/update_authenticator/',
        ),
        headers: headers,
        body: {
          'course_id': courseId.toString(),
          'year': year,
          'authenticator_number': authenticatorNumber.toString(),
        },
      );

      if (response.statusCode == 200) {
        print('Authenticator toggled successfully');
      } else {
        throw Exception(
            'Failed to toggle authenticator: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateGrades(
      List<Map<String, dynamic>> updatedStudentsData) async {
    try {
      var storageService = locator<StorageService>();

      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      if (updatedStudentsData.isEmpty) {
        throw Exception('No data provided');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
      };

      // Convert the list of maps to JSON
      String requestBodyJson = json.encode(updatedStudentsData);
      print(updatedStudentsData);
      print('Sending update request...');
      http.Response response = await http.patch(
        Uri.http(
          getLink(),
          kUpdateGradesEndpoint,
        ),
        headers: headers,
        body: requestBodyJson, // Pass the request body as JSON
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Grades updated successfully
        return true;
      } else {
        throw Exception('Failed to update grades: ${response.body}');
      }
    } catch (e) {
      // Handle errors
      print('Error updating grades: $e');
      rethrow;
    }
  }
}
