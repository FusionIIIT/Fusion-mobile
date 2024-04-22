import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart'; // Import if needed
import 'package:fusion/services/storage_service.dart'; // Import if needed
import 'package:fusion/constants.dart'; // Import if needed
import 'package:fusion/services/service_locator.dart'; // Import if needed

class ApproveMember {
  Future<void> approveMember(int id) async {
    try {
      print('Approving member with ID: $id');
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        'id': id,
        // Add any additional parameters needed for approving a member
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kApproveMemberPath, // Replace with the correct path for approving a member
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        print("Member with ID $id approved successfully");
      } else {
        print("Failed to approve member with ID $id: ${response.body}");
        throw Exception('Failed to approve member');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
