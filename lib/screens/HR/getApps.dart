import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';

class GetApplications {
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data;
  var service;

   _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();
    try {
      print("hello");
      data = service.profileData;
      _loading1 = false;
      showData();
    } catch (e) {
      getData();
      showData();
    }

  void getApplications() async {
    final String host = "127.0.0.1:8000";
    final String path = "/hr2/formManagement/";
    final queryParameters = {
      'username': data.user!['username'],
      'designation': data.profile!['user_type'],
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    print(uri);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Token ' + (service.userInDB?.token ?? "")
    };

    print(uri);
    print(headers);

    var client = http.Client();
    print("ab request jayegi");
    var response = await client.get(uri, headers: headers);
    print("ab response.statuscode print hoga");
    print((response.statusCode));
  }
}
