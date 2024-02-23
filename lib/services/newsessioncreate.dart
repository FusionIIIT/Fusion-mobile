import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart'; // Import if needed
import 'package:fusion/services/storage_service.dart'; // Import if needed
import 'package:fusion/constants.dart'; // Import if needed
import 'package:fusion/services/service_locator.dart'; // Import if needed

class NewSessionCreate {
  Future<void> createNewSession({
  required String venue,
  required String date,
  required String startTime,
  required String endTime,
  required String details,
  //required String status,
}) async {
  try {
    print('Creating new session...');
    var storageService = locator<StorageService>();
    if (storageService.userInDB?.token == null) {
      throw Exception('Token Error');
    }

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      'venue': venue,
      'date': date,
      'start_time': startTime,
      'end_time': endTime,
      'details': details,
      //'status': status,
    };

    http.Response response = await http.post(
      Uri.http(
        getLink(),
        kNewSessionCreatePath, // Replace with the correct path for creating a new session
      ),
      headers: headers,
      body: jsonEncode(body),
    );

    print('Response status code: ${response.statusCode}');
    if (response.statusCode == 201) {
      print("New session created successfully");
    } else {
      print("Failed to create new session: ${response.body}");
      throw Exception('Failed to create new session');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}
}
