// import 'dart:convert';
import 'dart:core';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ComplaintService {
  Future<http.Response> getComplaint() async {
    try {
      var storage_service = locator<StorageService>();

      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching complaints");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kComplaintService, //constant api path
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched complaints");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> lodgeComplaint(
    // ignore: non_constant_identifier_names
    String? complaint_finish,
    // ignore: non_constant_identifier_names
    String? complaint_type,
    String? location,
    // ignore: non_constant_identifier_names
    String? specific_location,
    String? details,
    String? status,
    String? remarks,
    String? flag,
    String? reason,
    String? feedback,
    String? comment,
    String? complainer,
    // ignore: non_constant_identifier_names
    String? worker_id,
  ) async {
    try {
      Map<String, dynamic> data = {
        "complaint_finish": complaint_finish!,
        "complaint_type": complaint_type!,
        "location": location!,
        "specific_location": specific_location!,
        "details": details!,
        "status": status!,
        "remarks": remarks!,
        "flag": flag!,
        "reason": reason!,
        "feedback": feedback!,
        "comment": comment!,
        "complainer": complainer!,
        "worker_id": worker_id!,
      };
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      var client = http.Client();
      var response = await client.post(
          Uri.http(
            getLink(),
            kComplaintNew, //constant new complaint path
          ),
          headers: headers,
          body: data);
      print(response.statusCode);

      if (response.statusCode == 201) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateComplaint(
    int? id,
    // ignore: non_constant_identifier_names
    String? complaint_date,
    // ignore: non_constant_identifier_names
    String? complaint_finish,
    // ignore: non_constant_identifier_names
    String? complaint_type,
    String? location,
    // ignore: non_constant_identifier_names
    String? specific_location,
    String? details,
    String? status,
    String? remarks,
    String? flag,
    String? reason,
    String? feedback,
    String? comment,
    String? complainer,
  ) async {
    try {
      Map<String, dynamic> data = {
        "complaint_date": complaint_date!,
        "complaint_finish": complaint_finish!,
        "complaint_type": complaint_type!,
        "location": location!,
        "specific_location": specific_location!,
        "details": details!,
        "status": status!,
        "remarks": remarks!,
        "flag": flag!,
        "reason": reason!,
        "feedback": feedback!,
        "comment": comment!,
        "complainer": complainer!,
      };
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      var client = http.Client();
      var response = await client.put(
          Uri.http(
            getLink(),
            "$kComplaintUpdate$id", //constant update path
          ),
          headers: headers,
          body: data);
      print("Fetched Data");
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteComplaint(int? id) async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      var client = http.Client();
      print(id);
      var response = await client.delete(
        Uri.http(
          getLink(),
          "$kComplaintRemove$id", //constant remove path
        ),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 404) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
