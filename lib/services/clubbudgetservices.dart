import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

import '../api.dart';
import 'storage_service.dart';

class ClubBudgetServices {
  Future<void> createClubBudget({
    required String club,
    required String budgetFor,
    
    required int budgetAmt,
    required String budgetFile,
    required String status,
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
        'budget_file': budgetFile,
        'status': status,
      };

      // Convert integer values to strings for JSON serialization
      Map<String, String> stringBody = body.map((key, value) => MapEntry(key, value.toString()));

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kCreateBudgetPath, // Replace with the correct path for creating budget
        ),
        headers: headers,
        body: jsonEncode(stringBody),
      );

      if (response.statusCode == 201) { // Updated to check for status code 201
        print("Club budget created successfully");
      } else {
        print("Failed to create club budget. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to create club budget');
      }
    } catch (e) {
      rethrow;
    }
  }
}














