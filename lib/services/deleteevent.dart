import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart'; // Import your API configuration file
import 'package:fusion/constants.dart'; // Import your constants file
import 'package:fusion/services/service_locator.dart'; // Import your service locator
import 'package:fusion/services/storage_service.dart'; // Import your storage service for accessing the user's token

class DeleteEventService {
  Future<void> deleteEvent({
    required int id,
  }) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      // Define headers with authentication token
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token ${storageService.userInDB?.token ?? ""}',
      };

      // Define the request body with only the 'id' parameter
      Map<String, dynamic> body = {
        'id': id,
      };

      // Sending POST request to delete the event
      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kDeleteEventPath, // Define the correct path for deleting the event
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      // Checking the response status
      if (response.statusCode == 200) {
        print("Event deleted successfully");
      } else {
        print("Failed to delete event. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to delete event');
      }
    } catch (e) {
      // Catch and rethrow any errors that occur during the process
      rethrow;
    }
  }
}
