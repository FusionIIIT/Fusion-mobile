import 'dart:core';
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
    // here we have to all data point
    String? user_id,
    // String? date_request,
    String? start_date,
    String? end_date,
    String? reason,
  ) async {
    try {
      Map<String, dynamic> data = {
        // we have to write all point here
        "user_id": user_id!,
        // "date_request": date_request!,
        "start_date": start_date!,
        "end_date": end_date!,
        "reason": reason,
      };
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      // print(headers);

      var client = http.Client();
      var response = await client.post(
          Uri.http(
            getLink(),
            KHealthCenterStudentRequest, //constant update path
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

  Future<bool> doctorAppoinment(
    // String user_id,
    // String? doctor_id,
    String? date,
    String? start_date,
    String? end_date,
    String? description,
  ) async {
    try {
      // here we have to write all data point
      Map<String, dynamic> data = {};
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
            KHealthCenterStudentRequest, //constant update path
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

  Future<bool> Student_history(
      // yaha parameters dalna hai form ke
      ) async {
    try {
      Map<String, dynamic> data = {
        // yaha par key value pair banana hai param se
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
            kHealthCentreStudent, //change karna hai endpoint ko
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
}
