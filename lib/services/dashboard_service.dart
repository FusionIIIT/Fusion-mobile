import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  getDashboard() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kDashboard, // constant dashboard path
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("success");
        print(response);
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }


 getNotification() async {
    try {
      print("gett");
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null)
        throw Exception('Token Error');


      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
      };
      print("gett2");

      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kNotification, // constant dashboard path
        ),
        headers: headers,
      );  

      print("gett3");

      if (response.statusCode == 200) {
        print("success");
        print(response);
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }

  markRead(String id) async {
    try {
      StorageService? storageService = await StorageService.getInstance();

      if (storageService?.userInDB?.token == null)
        throw Exception('Token Error');

      String token = storageService?.userInDB?.token ?? "";
      Map<String, String> headers = {'Authorization': 'Token ' + token};
      Map<String, String> body = {"id": id};
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          kNotificationRead, //constant notification read path
        ),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        print("success");
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }
}