import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;

class AcademicService {
  Future<http.Response> getAcademicDetails(String token) async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token error');
      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      }; 
      
      print("fetching Academic Details");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kAcademicProcedures, //Constant api path
        ),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('Can\'t get Academic data');
      }
      print("successfully fetched details");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
