import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;

class MessService {
  Future<http.Response> getMessMenu(String token) async {
    try {
      Map<String, String> headers = {'Authorization': 'Token ' + token};
      print("fetching menu Details");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kMessMenu, //Constant api path
        ),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get Mess data');
      }
      print("successfully fetched details");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
