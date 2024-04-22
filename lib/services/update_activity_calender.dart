// import 'dart:convert';
// import 'dart:html' as html;
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:fusion/api.dart';
// import 'package:fusion/services/storage_service.dart';
// import 'package:fusion/constants.dart';
// import 'package:fusion/services/service_locator.dart';

// class UpdateActivityCalendarService {
//   Future<void> updateActivityCalendar({
//     required String clubName,
//     required html.FormData activityCalendar,
//   }) async {
//     try {
//       print('Updating activity calendar...');
//       var storageService = locator<StorageService>();
//       if (storageService.userInDB?.token == null) {
//         throw Exception('Token Error');
//       }

//       // Prepare headers
//       Map<String, String> headers = {
//         'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
//       };

//       // Prepare body
//       var request = await http.MultipartRequest(
//         'POST',
//         Uri.http(
//           getLink(),
//           kUpdateActivityCalendarPath, // Replace with the correct path for updating the activity calendar
//         ),
//       );
//       request.headers.addAll(headers);
//       request.fields['club_name'] = clubName;

//       // Convert FormData to Stream<List<int>>
//       var reader = html.FileReader();
//       reader.readAsArrayBuffer(activityCalendar as html.Blob);
//       await reader.onLoadEnd.first;
//       var activityCalendarStream = reader.result as ByteBuffer?;
//       if (activityCalendarStream == null) {
//         throw Exception('Error reading file');
//       }
//       var stream = Stream.fromIterable([Uint8List.view(activityCalendarStream)]);

//       // Calculate the length of the file
//       int length = Uint8List.view(activityCalendarStream).length;

//       // Add the file to the request
//       request.files.add(http.MultipartFile(
//         'activity_calendar',
//         stream,
//         length, // Use the calculated length
//         filename: 'activity_calendar',
//         contentType: MediaType('application', 'octet-stream'), // Set the content type
//       ));

//       // Send request
//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);

//       print('Response status code: ${response.statusCode}');
//       if (response.statusCode == 200) {
//         print("Activity calendar updated successfully");
//       } else {
//         print("Failed to update activity calendar: ${response.body}");
//         throw Exception('Failed to update activity calendar');
//       }
//     } catch (e) {
//       print('Error: $e');
//       rethrow;
//     }
//   }
// }

import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:fusion/api.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

class UpdateActivityCalendarService {
  Future<void> updateActivityCalendar({
    required String clubName,
    required http.MultipartFile
        activityCalendar, // Change parameter type to MultipartFile
  }) async {
    try {
      print('Updating activity calendar...');
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      // Prepare headers
      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
      };

      // Prepare body
      var request = http.MultipartRequest(
        'POST',
        Uri.http(
          getLink(),
          kUpdateActivityCalendarPath, // Replace with the correct path for updating the activity calendar
        ),
      );
      request.headers.addAll(headers);
      request.fields['club_name'] = clubName;

      // Add the file to the request
      request.files.add(activityCalendar);

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        print(activityCalendar);
        print("Activity calendar updated successfully");
      } else {
        print("Failed to update activity calendar: ${response.body}");
        throw Exception('Failed to update activity calendar');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
