import 'dart:core';
import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class HeathService {
  getHealth(String token) async {
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        kHealthCentreStudent, //constant api
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("successfully fetched profile");
      return response;
    }
  }

  //---- start-here --------

  Future<bool> getAmbulence(
    String? start_date,
    String? end_date,
    String? reason,
  ) async {
    try {
      Map<String, dynamic> data = {
        "start_date": start_date!,
        "end_date": end_date!,
        "reason": reason,
        "ambulancerequest": "true"
      };
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? ""),
        'Content-type': 'application/json',
      };
      var body = json.encode(data);
      var client = http.Client();
      var response = await client.post(
        Uri.http(
          getLink(),
          KHealthCenterStudentRequest, //constant update path
        ),
        headers: headers,
        body: body,
      );
      print("Fetched Data");
      print(response.statusCode);
      // print(jsonDecode(response.body));
      if (response.statusCode == 201)
        return true;
      else
        return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> doctorAppoinment(
    String? doctor_id,
    String? date,
    String? from_time,
    String? to_time,
    String? description,
  ) async {
    try {
      // here we have to write all data point
      Map<String, dynamic> data = {
        "doctor_id": doctor_id!,
        "date": date!,
        "from_time": from_time!,
        "to_time": to_time!,
        "description": description,
        "appointmentadd": "true"
      };
      print(json.encode(data));
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? ""),
        'Content-type': 'application/json',
      };

      var client = http.Client();
      var body = json.encode(data);
      var response = await client.post(
          Uri.http(
            getLink(),
            KHealthCenterStudentRequest, //constant update path
          ),
          headers: headers,
          // body: json.encode(data),
          body: body);
      print("Fetched Data");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }

// for feedback

  Future<bool> postFeedback(String? feedback) async {
    try {
      // here we have to write all data point
      Map<String, dynamic> data = {
        "feedback": feedback!,
        // "date": date!,
        "complaintadd": "true"
      };
      print(json.encode(data));
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? ""),
        'Content-type': 'application/json',
      };

      var client = http.Client();
      var body = json.encode(data);
      var response = await client.post(
          Uri.http(
            getLink(),
            KHealthCenterStudentRequest, //constant update path
          ),
          headers: headers,
          body: body);
      print("Fetched Data");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }

  // fetching health record here

}
