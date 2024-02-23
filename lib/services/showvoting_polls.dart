import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

class ShowVotingPollsService {
  Future<List<Map<String, dynamic>>> getShowVotingPolls() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ${storageService.userInDB?.token ?? ""}'
      };

      http.Response response = await http.get(
        Uri.http(
          getLink(),
          kViewShowVotingPollsPath, // Replace with the correct path for view event details
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Data fetched successfully"); // Logging message
        List<dynamic> jsonData = jsonDecode(response.body);
        // Convert dynamic list to List<Map<String, dynamic>> and return
        return jsonData.map((e) => e as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to fetch view event details: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}