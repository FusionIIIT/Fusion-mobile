import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  getDashboard() async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          "/api/dashboard/",
        ),
        headers: headers,
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

  markRead(String id) async {
    try {
      StorageService? storage_service = await StorageService.getInstance();

      if (storage_service?.userInDB?.token == null)
        throw Exception('Token Error');

      String token = storage_service?.userInDB?.token ?? "";
      Map<String, String> headers = {'Authorization': 'Token ' + token};
      Map<String, String> body = {"id": id};
      var client = http.Client();
      http.Response response = await client.post(
        Uri.http(
          getLink(),
          "/api/notification/read/",
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
