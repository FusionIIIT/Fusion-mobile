// import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class Announcement {
  final String annDate;
  final String makerId;
  final String programme;
  final String batch;
  final String department;
  final String message;
  final String upload_announncement;

  Announcement({
    required this.annDate,
    required this.makerId,
    required this.programme,
    required this.batch,
    required this.department,
    required this.message,
    required this.upload_announncement,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      annDate: json['ann_date'],
      makerId: json['maker_id'],
      programme: json['programme'],
      batch: json['batch'],
      department: json['department'],
      message: json['message'],
      upload_announncement: json['upload_announncement'],
    );
  }
}

class DepartmentService {
  Future<Map<String, String>> _getHeaders() async {
    var storageService = locator<StorageService>();
    final String authToken = storageService.userInDB?.token ?? '';

    return {'Authorization': 'Token $authToken'};
  }

  Future<http.Response> getAnnouncements() async {
    try {
      final headers = await _getHeaders();
      print('Request Headers: $headers');
      final response = await http.get(
        Uri.http(getLink(), kDepartmentAnnouncements),
        headers: headers,
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

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
