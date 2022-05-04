import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class GymkhanaService {
  Future<http.Response> getGymkhanaData({String url = ""}) async {
    try {
      if (url == "") throw Exception('Invalid Gymkhana Url passed');

      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };
      print("fetching Gymkhana");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          url,
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("successfully fetched Gymkhana");
        return response;
      } else {
        print("error fetching Gymkhanadata");
      }
      throw Exception('Can\'t load Gymkhanadata');
    } catch (e) {
      rethrow;
    }
  }
}
