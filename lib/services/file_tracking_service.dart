import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/models/file_tracking.dart';

class FileTrackingService extends ChangeNotifier {
  FileTrackingService() {
    this.fetchFiles();
  }

  List<File> _files = [];

  UnmodifiableListView<File> get allFiles => UnmodifiableListView(_files);

  void compose_file(File file) async {
    final response = await http.post(
      "http://127.0.0.1:8000/filetracking/" as Uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(file),
    );
    if (response.statusCode == 201) {
      file.id = json.decode(response.body)['id'];
      file.subject = json.decode(response.body)['subject'];
      file.description = json.decode(response.body)['description'];
      file.upload_date = json.decode(response.body)['upload_date'];
      file.upload_file = json.decode(response.body)['upload_file'];
      file.is_read = json.decode(response.body)['is_read'];
      file.designation_id = json.decode(response.body)['designation_id'];
      file.uploader_id = json.decode(response.body)['uploader_id'];
      _files.add(file);
      notifyListeners();
    }
  }

  fetchFiles() async {
    final response =
        await http.get("http://127.0.0.1:8000/filetracking/" as Uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _files = data.map<File>((json) => File.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
