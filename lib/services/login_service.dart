// // import 'dart:convert';

// // import 'package:fusion/constants.dart';
// // import 'package:fusion/api.dart';
// // import 'package:fusion/models/user.dart';
// // import 'package:fusion/services/storage_service.dart';
// // import 'package:http/http.dart' as http;

// // class LoginService {
// //   Future<bool> login(String username, String password) async {
// //     try {
// //       Map<String, String> data = {"username": username, "password": password};
// //       Map<String, String> headers = {
// //         'Content-Type': 'application/json; charset=UTF-8'
// //       };

// //       var client = http.Client();
// //       var response = await client.post(
// //           Uri.http(
// //             kAuthUrl, // constant api url
// //             kAuthLogin, //constant api auth point
// //           ),
// //           headers: headers,
// //           body: jsonEncode(data));
// //       var prefs = await StorageService.getInstance();
// //       print("response.body: ${response.body}");

// //       var storage_service = await StorageService.getInstance();
// //       storage_service!.saveUserInDB(User((jsonDecode(response.body))["token"]));
// //       return true;
// //     } catch (e) {
// //       rethrow;
// //     }
// //   }

// //   void logout() async {
// //     try {
// //       var storage_service = await StorageService.getInstance();
// //       storage_service!.deleteKey("user");
// //     } catch (e) {
// //       rethrow;
// //     }
// //   }
// // }

// import 'dart:convert';

// import 'package:fusion/constants.dart';
// import 'package:fusion/api.dart';
// import 'package:fusion/models/user.dart';
// import 'package:fusion/services/storage_service.dart';
// import 'package:http/http.dart' as http;

// class LoginService {
//   Future<bool> login(String username, String password) async {

//     print(username);
//     try {
//       Map<String, String> data = {"username": username, "password": password};
//       Map<String, String> headers = {
//         'Content-Type': 'application/json; charset=UTF-8'
//       };

//       var client = http.Client();
//       var response = await client.post(
//           Uri.http(
//             kAuthUrl, // constant api url
//             kAuthLogin, // constant api auth point
//           ),
//           headers: headers,
//           body: jsonEncode(data));
//       var storageService = await StorageService.getInstance();
//       print("response.body: ${response.body}");

//       var storage_service = await StorageService.getInstance();
//       storage_service!.saveUserInDB(User((jsonDecode(response.body))["token"]));
//       return true;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   void logout() async {
//     try {
//       var storageService = await StorageService.getInstance();
//       storageService!.deleteKey("user");
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<String> getCurrentUsername() async {
//     // Logic to retrieve current username, possibly from StorageService
//     // For example, if you store the username during login, you can retrieve it here
//     var storageService = await StorageService.getInstance();
//     var user = storageService?.getUserFromDB();
//     return user?.username ??
//         ""; // Assuming you have a username field in your User model
//   }
// }




import 'dart:convert';

import 'package:fusion/constants.dart';
import 'package:fusion/api.dart';
import 'package:fusion/models/user.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> login(String username, String password) async {
    try {
      Map<String, String> data = {"username": username, "password": password};
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8'
      };

      var client = http.Client();
      var response = await client.post(
          Uri.http(
            kAuthUrl, // constant api url
            kAuthLogin, //constant api auth point
          ),
          headers: headers,
          body: jsonEncode(data));
      var prefs = await StorageService.getInstance();
      print("response.body: ${response.body}");

      var storage_service = await StorageService.getInstance();
      storage_service!.saveUserInDB(User((jsonDecode(response.body))["token"]));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  void logout() async {
    try {
      var storage_service = await StorageService.getInstance();
      storage_service!.deleteKey("user");
    } catch (e) {
      rethrow;
    }
  }
}