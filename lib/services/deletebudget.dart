import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/constants.dart';

import '../api.dart';

class DeleteBudgetService {
  Future<void> deleteBudget(int id) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token ${storageService.userInDB?.token ?? ""}',
      };

      Map<String, dynamic> requestData = {
        'id': id,
      };

      http.Response response = await http.post(
        Uri.http(getLink(), kDeleteBudgetEndpoint),
        headers: headers,
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Budget deleted successfully");
      } else {
        print(response.body);
        throw Exception('Failed to delete budget');
      }
    } catch (e) {
      rethrow;
    }
  }
}
