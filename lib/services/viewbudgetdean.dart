import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

import '../api.dart';
import '../constants.dart';

class ViewBudgetDean {
  Future<List<Map<String, dynamic>>> viewBudget() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json',
      };

      http.Response response = await http.get(
        Uri.http(
          getLink(),
          kViewBudgetDeanPath, // Replace with the correct path for viewing budget details
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonData =
            List<Map<String, dynamic>>.from(jsonDecode(response.body));
        return jsonData;
      } else {
        print("Failed to fetch budget details: ${response.body}");
        throw Exception('Failed to fetch budget details');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
