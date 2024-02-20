import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
// import 'package:fusion/constants.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class CentralMessService {
  Future<List<MessFeedback>> getFeedback() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token error');
      }

      Map<String, String> body = {
        'username': '21bcs064',
        'password': 'user@123'
      };

      http.Response response0 = await http.post(
        Uri.http(
          kCentralMess,
          kAuthLogin, //constant api EndPoint
        ),
        body: body,
      );

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

  Future<List<MessMenu>> getMenu() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token error');
      }

      Map<String, String> body = {
        'username': '21bcs064',
        'password': 'user@123'
      };

      http.Response response0 = await http.post(
        Uri.http(
          kCentralMess,
          kAuthLogin, //constant api EndPoint
        ),
        body: body,
      );

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


  Future<List<MonthlyBill>> getMonthlyBill() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token error');
      }

      Map<String, String> body = {
        'username': '21bcs064',
        'password': 'user@123'
      };

      http.Response response0 = await http.post(
        Uri.http(
          kCentralMess,
          kAuthLogin, //constant api EndPoint
        ),
        body: body,
      );

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
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token error');
      }

      Map<String, String> body = {
        'username': '21bcs064',
        'password': 'user@123'
      };

      http.Response response0 = await http.post(
        Uri.http(
          kCentralMess,
          kAuthLogin, //constant api EndPoint
        ),
        body: body,
      );

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
