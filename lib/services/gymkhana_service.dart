import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class GymkhanaService {
  static const List<String> urls = const [
    '/api/gymkhana/club_details',
    '/api/gymkhana/members_record'
  ];

  Future<http.Response> getGymkhanaData({int urlIdx = 0}) async {
    try {
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
          urls[urlIdx],
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
