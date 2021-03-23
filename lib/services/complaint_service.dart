import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;

class ComplaintService {
  getComplaint(String token) async {
    //print('Token '+token);
    Map<String, String> headers = {'Authorization': 'Token ' + token};
    print("fetching complaints");
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        "/complaint/api/user/detail/394/",
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("successfully fetched complaints");
      return response;
    }
    throw Exception('Can\'t load');
  }
}
