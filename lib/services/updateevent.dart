// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:fusion/api.dart';
// import 'package:fusion/constants.dart';
// import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';

// class UpdateEventService {
//   Future<void> updateEvent({
//     required int id,
//     required String venue,
//     required String date,
//     required String eventName,
//     required String incharge,
//     required String details,
//   }) async {
//     try {
//       var storageService = locator<StorageService>();
//       if (storageService.userInDB?.token == null) {
//         throw Exception('Token Error');
//       }

//       Map<String, String> headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Token ${storageService.userInDB?.token ?? ""}',
//       };

//       Map<String, dynamic> body = {
//         'id': id,
//         'venue': venue,
//         'date': date,
//         'event_name': eventName,
//         'incharge': incharge,
//         'details': details,
//       };

//       http.Response response = await http.post(
//         Uri.http(
//           getLink(),
//           kUpdateEventPath, // Replace with the correct path for updating event
//         ),
//         headers: headers,
//         body: jsonEncode(body),
//       );

//       if (response.statusCode == 200) {
//         print("Event updated successfully");
//       } else {
//         print("Failed to update event. Status code: ${response.statusCode}");
//         print("Response body: ${response.body}");
//         throw Exception('Failed to update event');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';

class UpdateEventService {
  Future<void> updateEvent({
    required int id,
    required String venue,
    //required String date,
    required DateTime date,
    required String eventName,
    required String incharge,
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
        'date': DateFormat('yyyy-MM-dd').format(date),
        'event_name': eventName,
        'incharge': incharge,
        'details': details,
      };

      http.Response response = await http.post(
        Uri.http(
          getLink(),
          kUpdateEventPath, // Replace with the correct path for updating event
        ),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("Event updated successfully");
      } else {
        print("Failed to update event. Status code: ${response.statusCode}");
        print(jsonEncode(body));
        throw Exception('Failed to update event');
      }
    } catch (e) {
      rethrow;
    }
  }
}
