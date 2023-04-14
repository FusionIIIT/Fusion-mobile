import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:fusion/models/department.dart';
import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:path/path.dart';

class AnnouncementService {
  final String baseUrl = "http://172.27.16.214";
  // ignore: non_constant_identifier_names
  var token = "134712e89ec9dce6dc7b6c2313a7c0b7d5a82128";
  var storage_service = locator<StorageService>();

  Future<List<Announcements>> fetchAnnouncements() async {
    //storage_service.userInDB?.token ;
    // var token =
    //     storage_service.userInDB?.token; //this is the line for actual token
    final response = await http.get(Uri.parse(baseUrl + kFetchAnnouncement),
        headers: {'Authorization': 'Token ' + (token ?? "")});
    // print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['payload'];
      List<Announcements> announcements =
          body.map((dynamic item) => Announcements.fromJson(item)).toList();
      return announcements;
    } else {
      throw Exception('Failed to load announcements');
    }
  }

  Future<String> addNewAnnouncement(
    String batch,
    String programme,
    String department,
    String message,
    String? upload_announcement,
  ) async {
    // var token = storage_service.userInDB?.token;     //this is the line for actual token
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + kAddNewAnnouncement));
    request.headers.addAll({
      'Authorization': 'Token ${token ?? ""}',
    });
    request.fields['batch'] = batch;
    request.fields['programme'] = programme;
    request.fields['department'] = department;
    request.fields['message'] = message;

    if (upload_announcement != null) {
      var file = new File(upload_announcement);
      var fileStream = http.ByteStream(file.openRead());
      var fileLength = await file.length();
      var fileName = file.path.split('/').last;
      var multipartFile = http.MultipartFile(
        'upload_announcement',
        fileStream,
        fileLength,
        filename: fileName,
      );
      request.files.add(multipartFile);
    } else {
      request.fields['upload_announcement'] = "";
    }

    final response = await request.send();
    final responseStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      // print("done");
      return "Announcement added successfully";
    } else {
      throw Exception('Failed to add announcement: $responseStr');
    }
  }
}
