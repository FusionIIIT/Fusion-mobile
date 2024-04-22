import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart'; // Import if needed
import 'package:fusion/services/storage_service.dart'; // Import if needed
import 'package:fusion/constants.dart'; // Import if needed
import 'package:fusion/services/service_locator.dart'; // Import if needed

class ViewMembersRecord {
  Future<List<dynamic>> getMembersRecord() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };

      http.Response response = await http.get(
        Uri.http(
          getLink(),
          kMembersRecordPath, // Replace with the correct path for members record
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Members record fetched successfully");
        List<dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        throw Exception('Failed to fetch members record');
      }
    } catch (e) {
      rethrow;
    }
  }
}
