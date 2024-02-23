import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

class UpdateBudget {
  Future<void> updateBudget({
    required String club,
    required String budgetFor,
    required int budgetAmt,
    required String status,
    required int id,
  }) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token ${storageService.userInDB?.token ?? ""}',
      };

      Map<String, dynamic> body = {
        'club': club,
        'budget_for': budgetFor,
        'budget_amt': budgetAmt,
        'status': status,
        'id': id,
      };

      // Convert integer values to strings for JSON serialization
      Map<String, String> stringBody = body.map((key, value) => MapEntry(key, value.toString()));

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kUpdateBudgetPath, // Replace with the correct path for updating budget
        ),
        headers: headers,
        body: jsonEncode(stringBody),
      );

      if (response.statusCode == 200) {
        print("Budget updated successfully");
      } else {
        print("Failed to update budget. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to update budget');
      }
    } catch (e) {
      rethrow;
    }
  }
}
