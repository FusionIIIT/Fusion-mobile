// import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class Announcement {
  final String ann_date;
  final String maker_id;
  final String programme;
  final String batch;
  final String department;
  final String message;
  final String? upload_announncement;

  Announcement({
    required this.ann_date,
    required this.maker_id,
    required this.programme,
    required this.batch,
    required this.department,
    required this.message,
    this.upload_announncement,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      ann_date: json['ann_date'],
      maker_id: json['maker_id'],
      programme: json['programme'],
      batch: json['batch'],
      department: json['department'],
      message: json['message'],
      upload_announncement: json['upload_announncement'],
    );
  }
}

class DepartmentService {
  Future<http.Response> getAnnouncements() async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(getLink(), kDepartmentAnnouncements),
        headers: headers,
      );
      // print('Response Status Code: ${response.statusCode}');
      // print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load announcements');
      }
    } catch (e) {
      print('Error in getAnnouncements: $e');
      rethrow;
    }
  }
}
