import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  getDashboard() async {
    try {
      var service = locator<StorageService>();
      if (service.userInDB!.token == null) throw Exception('Can\'t load');
      Map<String, String> headers = {
        'Authorization': 'Token ' + (service.userInDB?.token ?? "")
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
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      print(e);
    }
  }

  markRead(String id) async {
    try {
      StorageService? prefs = await StorageService.getInstance();
      if (prefs!.userInDB?.token == null) throw Exception('Can\'t load');
      String token = prefs.userInDB?.token ?? "";
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
      print(e);
    }
  }
}
