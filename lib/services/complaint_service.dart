import 'dart:core';
import 'dart:convert';
import 'dart:io';
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
      String? complaint_finish,
      String? complaint_type,
      String? location,
      String? specific_location,
      String? details,
      String? status,
      String? remarks,
      String? flag,
      String? reason,
      String? feedback,
      String? comment,
      String? complainer,
      String? worker_id,
      File? selectedFile, // Change the type to File
      ) async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      // Create a new multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.http(
          getLink(),
          kComplaintNew, // constant new complaint path
        ),
      );

      // Add form fields
      request.fields['complaint_finish'] = complaint_finish!;
      request.fields['complaint_type'] = complaint_type!;
      request.fields['location'] = location!;
      request.fields['specific_location'] = specific_location!;
      request.fields['details'] = details!;
      request.fields['status'] = status!;
      request.fields['remarks'] = remarks!;
      request.fields['flag'] = flag!;
      request.fields['reason'] = reason!;
      request.fields['feedback'] = feedback!;
      request.fields['comment'] = comment!;
      request.fields['complainer'] = complainer!;
      request.fields['worker_id'] = worker_id!;

      // Check if a file is selected
      if (selectedFile != null) {
        // Create a file part
        var filePart = http.MultipartFile(
          'upload_complaint',
          selectedFile.readAsBytes().asStream(),
          selectedFile.lengthSync(),
          filename: selectedFile.path.split('/').last, // Get the file name
        );

        print(filePart);

        // Add the file part to the request
        request.files.add(filePart);
      }

      // Add authorization header
      request.headers['Authorization'] =
      'Token ${storage_service.userInDB?.token ?? ""}';

      // Send the request
      var response = await http.Response.fromStream(await request.send());

      // Check the response status code
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
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
      // print(response.statusCode);
      if (response.statusCode == 404) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
