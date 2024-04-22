import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart'; // Import if needed
import 'package:fusion/services/storage_service.dart'; // Import if needed
import 'package:fusion/constants.dart'; // Import if needed
import 'package:fusion/services/service_locator.dart'; // Import if needed

class NewEventCreate {
  Future<void> createNewEvent({
    required String eventName,
    required String inCharge,
    required String date,
    required String venue,
    required String startTime,
    required String endTime,
    required String details,
  }) async {
    try {
      print('Creating new event...');
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        'event_name': eventName,
        'incharge': inCharge,
        'date': date,
        'venue': venue,
        'start_time': startTime,
        'end_time': endTime,
        'details': details,
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kNewEventCreatePath, // Replace with the correct path for creating a new event
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 201) {
        print("New event created successfully");
      } else {
        print("Failed to create new event: ${response.body}");
        throw Exception('Failed to create new event');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
