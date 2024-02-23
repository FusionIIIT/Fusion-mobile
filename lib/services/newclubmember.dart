import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart'; // Import if needed
import 'package:fusion/services/storage_service.dart'; // Import if needed
import 'package:fusion/constants.dart'; // Import if needed
import 'package:fusion/services/service_locator.dart'; // Import if needed

class NewClubMember {
  Future<void> createNewClubMember({
    required String member,
    required String club,
    required String description,
    required String status,
    required String remarks,
  }) async {
    try {
      print('Creating new club member...');
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        'member': member,
        'club': club,
        'description': description,
        'status': status,
        'remarks': remarks,
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kNewClubMemberPath, // Replace with the correct path for creating a new club member
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 201) {
        print("New club member created successfully");
      } else {
        print("Failed to create new club member: ${response.body}");
        throw Exception('Failed to create new club member');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
