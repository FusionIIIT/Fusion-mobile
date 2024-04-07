import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
// import 'package:fusion/constants.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';

class CentralMessService {

  ProfileService _profileService = ProfileService();

  Future<http.Response> initAuth() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token error');
      }

      http.Response response2 = await _profileService.getProfile();
      ProfileData _profileData = await ProfileData.fromJson(jsonDecode(response2.body));

      Map<String, String> body = {
        'username': await _profileData.user!['username'],
        'password': 'user@123'
      };

      http.Response response0 = await http.post(
        Uri.http(
          kCentralMess,
          kAuthLogin, //constant api EndPoint
        ),
        body: body,
      );

      return response0;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<MessFeedback>> getFeedback() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching feedbacks");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kFeedbackEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable feedbackList = json.decode(response.body)['payload'];
          return feedbackList.map((model) => MessFeedback.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load feedback');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendFeedback(MessFeedback data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': '21BCS064',
          'mess': data.mess,
          'feedback_type': data.feedbackType,
          'fdate': data.fdate.toString().substring(0, 10),
          'description': data.description,
          'mess_rating': 5,
        };

        print("Sending Feedback");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kFeedbackEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Feedback sent successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to send feedback');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateFeedbackRequest(MessFeedback data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'mess': data.mess,
          'feedback_type': data.feedbackType,
          'fdate': data.fdate.toString().substring(0, 10),
          'description': data.description,
          'mess_rating': 5,
          'feedback_remark': data.feedbackRemark,
        };

        print("Updating Feedback Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kFeedbackEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Feedback Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update feedback request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessMenu>> getMenu() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Menus");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kMenuEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable menuList = json.decode(response.body)['payload'];
          return menuList.map((model) => MessMenu.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load menu');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateMenu(MessMenu data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, String> body = {
          'mess_option': data.messOption,
          'meal_time': data.mealTime,
          'dish': data.dish,
        };

        print("Updating Menu");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kMenuEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Menu updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update menu');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MonthlyBill>> getMonthlyBill() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Bill");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kMonthlyBillEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable billList = json.decode(response.body)['payload'];
          return billList.map((model) => MonthlyBill.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load Bill');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<List<Rebate>> getRebate() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching rebate");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kRebateEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable rebateList = json.decode(response.body)['payload'];
          return rebateList.map((model) => Rebate.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load rebate');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendRebateRequest(Rebate data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': '21BCS064',
          'leave_type' : data.leaveType,
          'rebate_remark': '',
          'app_date' : data.appDate.toString().substring(0, 10),
          'status' : data.status,
          'purpose' : data.purpose,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Sending Rebate Request");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kRebateEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Rebate Request sent successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to send rebate request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateRebateRequest(Rebate data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'leave_type' : data.leaveType,
          'rebate_remark': data.rebateRemark,
          'app_date' : data.appDate.toString().substring(0, 10),
          'status' : data.status,
          'purpose' : data.purpose,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Updating Rebate Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kRebateEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Rebate Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update rebate request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SpecialRequest>> getSpecialRequest() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching special request");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kSpecialRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable specialRequestList = json.decode(response.body)['payload'];
          return specialRequestList.map((model) => SpecialRequest.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load special request');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateSpecialRequest(SpecialRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'item1' : data.item1,
          'item2' : data.item2,
          'app_date' : data.appDate.toString().substring(0, 10),
          'status' : data.status,
          'request' : data.request,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Updating Special Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kSpecialRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Special Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update special request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<http.Response> getMessInfo() async {
  //   try {
  //     var storageService = locator<StorageService>();
  //     if (storageService.userInDB?.token == null) {
  //       throw Exception('Token error');
  //     }
  //
  //     Map<String, String> headers = {
  //       'Authorization': 'Token ${storageService.userInDB!.token}',
  //     };
  //
  //     http.Response response = await http.get(
  //       Uri.http(
  //         getLink(),
  //         kMessInfoEndpoint,
  //       ),
  //       headers: headers,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return response;
  //     } else {
  //       throw Exception('Can\'t load mess info');
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

// TODO: Add more methods for other Central Mess APIs as needed
}


// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:fusion/api.dart';
// import 'package:fusion/constants.dart';
// import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';
//
// class CentralMessService {
//   final StorageService _storageService = locator<StorageService>();
//
//   Future<http.Response> getFeedback() async {
//     try {
//       if (_storageService.userInDB?.token == null) {
//         throw Exception('Token error');
//       }
//
//       final String? token = _storageService.userInDB!.token;
//       final Map<String, String> headers = {
//         'Authorization': 'Token $token',
//       };
//
//       final http.Response response = await http.get(
//         Uri.http(getLink(), kFeedback), // Adjust the endpoint as needed
//         headers: headers,
//       );
//
//       if (response.statusCode == 200) {
//         print('Successfully fetched feedback');
//         return response;
//       }
//       throw Exception('Failed to fetch feedback');
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<http.Response> getMenu() async {
//     try {
//       if (_storageService.userInDB?.token == null) {
//         throw Exception('Token error');
//       }
//
//       final String token = _storageService.userInDB!.token;
//       final Map<String, String> headers = {
//         'Authorization': 'Token $token',
//       };
//
//       final http.Response response = await http.get(
//         Uri.http(getLink(), kMenu), // Adjust the endpoint as needed
//         headers: headers,
//       );
//
//       if (response.statusCode == 200) {
//         print('Successfully fetched menu');
//         return response;
//       }
//       throw Exception('Failed to fetch menu');
//     } catch (e) {
//       rethrow;
//     }
//   }
//
// // TODO: Add more methods for other relevant APIs
// }
