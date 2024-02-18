import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class AcademicService {
  var service = locator<StorageService>();
  Future<http.Response> getAcademicDetails(String token) async {
    try {
      Map<String, String> headers = {'Authorization': 'Token ' + token};
      print("fetching Academic Details");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kAcademicProcedures, //Constant api path
        ),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get Academic data');
      }
      print("successfully fetched details");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getRegistrationCourses(String token) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };
      final body = {"programme": "B.Tech", "branch": "CSE", "batch": "2018"};
      final jsonString = json.encode(body);

      print("fetching next semester courses list");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kAcademicCourseList, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get Courses List');
      }
      print("successfully fetched details");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> configurePreRegistration(
      String startDate, String endDate, int semester) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };
      final body = {
        "from_date": startDate,
        "to_date": endDate,
        "semester": semester
      };
      final jsonString = json.encode(body);
      print(jsonString);

      print("pushing pre registration configuration");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kConfigurePreRegistration, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        print(response.body);
        throw Exception('Can\'t configure pre registration');
      }
      print("successfully configured pre registration");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> configureFinalRegistration(
      String startDate, String endDate) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };
      final body = {
        "from_date": startDate,
        "to_date": endDate,
      };
      final jsonString = json.encode(body);

      print("pushing final registration configuration");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kConfigurePreRegistration, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t configure final registration');
      }
      print("successfully configured final registration");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
