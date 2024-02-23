import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final formattedTime = DateFormat('HH:mm:ss').format(dateTime);
  return formattedTime;
}

String formatDate(DateTime dateTime) {
  final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

class UpdateSessionService {
  Future<void> updateSession({
    required int id,
    required String venue,
    required DateTime date,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String details,
  
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
        'id': id,
        'venue': venue,
        'date': formatDate(date), // Format date as hrs:min:sec
        'start_time': formatTimeOfDay(startTime),
        'end_time': formatTimeOfDay(endTime),
        'details': details,
      
      };
      print(body);

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kUpdateSessionPath, // Replace with the correct path for updating session
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("Session updated successfully");
      } else {
        print("Failed to update session. Status code: ${response.statusCode}");
        // print("Response body: ${response.body}");
        print(jsonEncode(body));
        throw Exception('Failed to update session');
      }
    } catch (e) {
      rethrow;
    }
  }
}



