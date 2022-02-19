// import 'dart:convert';

import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
// import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class GymkhanaService {
  // getGymkhanaClubsData() async {
  //   return getGymkhanaData(urls[0]);
  // }
  // getGymkhanaMembersData() async {
  //   return getGymkhanaData(urls[1]);
  // }

  getGymkhanaData({int urlIdx = 0}) async {
    try {
      var service = locator<StorageService>();
      if (service.userInDB?.token == null)
        throw Exception('Can\'t load Gymkhanadata');
      Map<String, String> headers = {
        'Authorization': 'Token ' + (service.userInDB?.token ?? "")
      };
      print("fetching Gymkhana");
      var client = http.Client();
      http.Response response = await client.get(
        Uri.http(
          getLink(),
          kGymkhanaUrls[
              urlIdx], //kGymkhanaUrls is a list of gymkhana end points
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
      print(e);
    }
  }
}
