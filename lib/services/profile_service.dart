import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ProfileService {

  StorageService storage_service = StorageService();

  Future<http.Response> initAuth() async {
    try {

      Map<String, String> body = {
        'username': '21BCS064',
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

  getProfile() async {
    try {

      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Profile");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kProfile, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          print("successfully fetched profile");
          storage_service
              .saveProfileInDB(ProfileData.fromJson(jsonDecode(response.body)));
          return response;
          // Iterable feedbackList = json.decode(response.body)['payload'];
          // return feedbackList.map((model) => MessFeedback.fromJson(model)).toList();
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

    //   Map<String, String> headers = {
    //     'Authorization': 'Token ' + (jsonDecode(response0.body)['token'] ?? "")
    //   };
    //   print("fetching profile");
    //   var client = http.Client();
    //   http.Response response = await client.get(
    //     Uri.http(
    //       kCentralMess,
    //       kProfile, //constant api EndPoint
    //     ),
    //     headers: headers,
    //   );
    //   if (response.statusCode == 200) {
    //     print("successfully fetched profile");
    //     storage_service
    //         .saveProfileInDB(ProfileData.fromJson(jsonDecode(response.body)));
    //     return response;
    //   }
    //   throw Exception('Can\'t load');
    // } catch (e) {
    //   rethrow;
    // }
  }
}
