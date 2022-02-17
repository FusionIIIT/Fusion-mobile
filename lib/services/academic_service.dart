import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;

class AcademicService {
  Future<http.Response> getAcademicDetails(String token) async {
    late http.Response response;
    try {
      Map<String, String> headers = {'Authorization': 'Token ' + token};

      print("fetching Academic Details");

      var client = http.Client();
      response = await client.get(
        Uri.http(
          getLink(),
          "academic-procedures/api/stu/",
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("successfully fetched details");
        return response;
      } else
        print("error fetching details");
      throw Exception('Can\'t load');
    } catch (e) {
      return response;
    }
  }
}
