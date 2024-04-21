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

  Future<http.Response> getRegistrationCourses() async {
    var _prefs = await StorageService.getInstance();
    String token = _prefs!.userInDB?.token ?? "";
    try {
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };
      // final body = {
      //   "programme": "B.Tech",
      //   "branch": branch,
      //   "semester": semester.toString(),
      //   "batch": "2018"
      // };
      // final jsonString = json.encode(body);

      print("fetching next semester courses list");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kAcademicCourseList, //Constant api path
        ),
        headers: headers,
        // body: jsonString,
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
          kConfigureFinalRegistration, //Constant api path
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

  Future<http.Response> finalRegistration(
      String transactionId,
      String depositDate,
      String utrNumber,
      String feePaid,
      String actualFee,
      String mode) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";

      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };
      final body = {
        'transaction_id': transactionId,
        'deposit_date': depositDate,
        'utr_number': utrNumber,
        'fee_paid': feePaid,
        'actual_fee': actualFee,
        'reason': 'feePayment',
        'mode': mode,
        'semester': 5
      };

      final jsonString = json.encode(body);

      print("pushing final registration configuration");

      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kFinalRegistration, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t do final registration');
      }
      print("successfully completed final registration");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getAssignedCourses() async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      print("fetching assigned courses");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kFacultyGetAssignedCourses, //Constant api path
        ),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get assigned courses');
      }
      print("successfully fetched assigned courses");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getCourseList(
      String programme, String branch, String batch) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      final body = {"programme": programme, "branch": branch, "batch": batch};

      final jsonString = json.encode(body);

      print("fetching courses list");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kAcadGetCoursesList, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get courses list');
      }
      print("successfully fetched courses list");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getAllCourses() async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      print("fetching all courses");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kGetAllCourses, //Constant api path
        ),
        headers: headers
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get all courses');
      }
      print("successfully fetched all courses");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> generateRollList(String batch, String course) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      final body = {"batch": batch, "course": course};

      final jsonString = json.encode(body);

      print("fetching roll list");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kGenerateRollList, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get roll list');
      }
      print("successfully fetched roll list");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
