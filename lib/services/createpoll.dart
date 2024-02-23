import 'dart:convert';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';

import '../api.dart';

class CreatePoll {
  Future<void> createPoll({
    required String title,
    required String pubDate,
    required String expDate,
    required String createdBy,
    required String groups,
    required List<Map<String, String>> choices,
  }) async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> pollData = {
        "title": title,
        "pub_date": pubDate,
        "exp_date": expDate,
        "created_by": createdBy,
        "groups": groups,
        "choices": choices,
      };

      http.Response response = await http.post(
        Uri.http(getLink(), kCreatePollPath),
        headers: headers,
        body: jsonEncode(pollData),
      );

      if (response.statusCode == 201) {
        print("Poll created successfully");
      } else {
        print(jsonEncode(pollData));
        throw Exception('Failed to create poll');
      }
    } catch (e) {
      rethrow;
    }
  }
}
