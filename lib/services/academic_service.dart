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
      String user,
      int semester,
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
        'user': user,
        'semester': semester,
        'mode': 'NEFT',
        'transaction_id': transactionId,
        'deposit_date': depositDate,
        'utr_number': utrNumber,
        'fee_paid': feePaid,
        'actual_fee': actualFee,
        'reason': 'feePayment',
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

  // choice: courseId,
  // slot: slotId,
  // semester: semesterId,
  // user: userId

  Future<http.Response> preRegAddOneCourse(
      int courseId, int slotId, int semester, String user) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      final body = {
        'choice': courseId,
        'slot': slotId,
        'semester': semester,
        'user': user
      };

      final jsonString = json.encode(body);

      print("pre reg: submitting priority");
      var client = http.Client();
      http.Response response = await client.post(
          Uri.http(
            getLink(),
            kPreRegAddOneCourse, //Constant api path
          ),
          headers: headers,
          body: jsonString);
      if (response.statusCode != 200) {
        print(response.body);
        throw Exception('Can\'t submit priority');
      }
      // print(jsonDecode(response.body)['message']);
      print("successfully submitted course");
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
          headers: headers);
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

  Future<http.Response> getAcademicCalender() async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      print("fetching academic calender");
      var client = http.Client();
      http.Response response = await client.get(
          Uri.http(
            getLink(),
            KManageSchedule, //Constant api path
          ),
          headers: headers);
      if (response.statusCode != 200) {
        throw Exception('Can\'t get academic calender');
      }
      print("successfully fetched academic calender");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> EditAcademicCalendar(
      int id, String description, String startDate, String endDate) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };
      final body = {
        "id": id,
        "description": description,
        "from_date": startDate,
        "to_date": endDate
      };
      final jsonString = json.encode(body);
      print(jsonString);
      print(body);
      print("Editing calender");

      var client = http.Client();
      http.Response response = await client.put(
        Uri.http(
          getLink(),
          KUpdateSchedule, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        print(response.body);
        throw Exception('Can\'t edit data');
      }
      print("successfully eddited data");
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<http.Response> AddAcademicCalendar(
      String description, String startDate, String endDate) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };
      final body = {
        "description": description,
        "from_date": startDate,
        "to_date": endDate
      };
      final jsonString = json.encode(body);
      print(jsonString);
      
      print("Adding in  calender");

      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          KManageSchedule, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 201) {
        print(response.body);
        throw Exception('Can\'t add data');
      }
      print("successfully added data");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> removeCourseFromSlot(String code, String slot) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      final body = {"course_code": code, "course_slot_name": slot};

      final jsonString = json.encode(body);

      print("removing course from slot");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kRemoveCourseFromSlot, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t remove course from slot');
      }
      print("successfully removed course from slot");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> addCourseToSlot(String code, String slot) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      final body = {"course_code": code, "course_slot_name": slot};

      final jsonString = json.encode(body);

      print("adding course to slot");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kAddCourseToSlot, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t add course to slot');
      }
      print("successfully added course to slot");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getNextSemCourses(
      int next_sem, String branch, String programme, String batch) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      final body = {
        "next_sem": next_sem,
        "branch": branch,
        "programme": programme,
        "batch": batch
      };

      final jsonString = json.encode(body);

      print("fetching next sem courses");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kGetNextSemCourses, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get next sem courses');
      }
      print("successfully fetched next sem courses");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> preRegistration(
      int sem, Map<int, int> final_choices) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      List<String> course_slot = [];
      for (var key in final_choices.keys) {
        course_slot.add(key.toString());
      }

      var body = {"semester": sem, "course_slot": course_slot};

      for (var key in final_choices.keys) {
        body['course_priority-' + key.toString()] = [
          "1-" + final_choices[key].toString()
        ];
      }

      final jsonString = json.encode(body);
      print(jsonString);

      print("pushing request");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kPreRegFinal, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        print(response.body);
        throw Exception('Can\'t perform pre registration');
      }
      print("Pre registration successful");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> addCourses(
      int sem, int ct, Map<int, int> choices) async {
    try {
      var _prefs = await StorageService.getInstance();
      String token = _prefs!.userInDB?.token ?? "";
      Map<String, String> headers = {
        'Authorization': 'Token ' + token,
        'Content-Type': 'application/json'
      };

      var body = {"semester": sem, "ct": ct};

      int index = 1;
      for (var key in choices.keys) {
        body['choice[' + index.toString() + ']'] = choices[key] ?? 0;
        body['slot[' + index.toString() + ']'] = key;
        index++;
      }

      final jsonString = json.encode(body);
      print(jsonString);

      print("pushing request");
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kAddCourses, //Constant api path
        ),
        headers: headers,
        body: jsonString,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t add courses');
      }
      print("Added courses successfully");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
