import 'dart:convert';

import 'package:fusion/constants.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class GymkhanaService {
  static const List<String>urls = const ['/api/gymkhana/club_details', '/api/gymkhana/members_record'];

  // getGymkhanaClubsData() async {
  //   return getGymkhanaData(urls[0]);
  // }
  // getGymkhanaMembersData() async {
  //   return getGymkhanaData(urls[1]);
  // }

  getGymkhanaData({int urlIdx = 0}) async {
    var service = locator<StorageService>();
    Map<String, String> headers = {
      'Authorization': 'Token ' + service.userInDB.token!

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
    }
    else{
      print("error fetching Gymkhanadata");
    }
    throw Exception('Can\'t load Gymkhanadata');
  }
}
