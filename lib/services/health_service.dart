import 'dart:core';
import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/models/health.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class HeathService {
  Future<http.Response> getHealth() async {
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
          kHealthCentreStudent, //constant api
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched profile");
        return response;
      }
      throw Exception('Can\'t load');
    }
    catch (e) {
      rethrow;
    }
  }

  //---- start-here --------

  Future<bool> getAmbulence(
      // here we have to all data point
      // String? user_id,
      // String? date_request,
      String? start_date,
      String? end_date,
      String? reason,
      ) async {
    try {
      Map<String, dynamic> data = {
        // we have to write all point here
        // "user_id": user_id!,
        // "date_request": date_request!
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
          headers:headers ,
          body: body,);
      print("Fetched Data");
      print(response.statusCode);
      // print(jsonDecode(response.body));
      if (response.statusCode == 201) return true;
      else return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> doctorAppoinment(
      // String user_id,
      int?  doctor_id,
      String? date,
      String? from_time,
      String? to_time,
      String? issue,
      ) async {
    try {
      // here we have to write all data point
      Map<String, dynamic> data = {
        "doctor_id": doctor_id!,
        "date": date!,
        "description": issue,
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
      var response = await client.post(
          Uri.http(
            getLink(),
            KHealthCenterStudentRequest, //constant update path
          ),
          headers: headers,
          body: json.encode(data));
      print("Fetched Data");
      print(response.statusCode);
      print(response.body);
      print("Fetched Dated");
      if (response.statusCode == 201) return true;
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
  Future<List<Doctor>> fetchDoctors() async {
    List<Doctor> doctors = [];
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
        kHealthCentreStudent, //constant api
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
        doctors = (json.decode(response.body) as List).map((data) => Doctor.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
    return(doctors);
    print(doctors);
  }
}