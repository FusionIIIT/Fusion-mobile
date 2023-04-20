import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class File {
  late final String id;
  late final String subject;
  late final String description;
  late final String upload_date;
  late final String upload_file;
  late final String is_read;
  late final String designation_id;
  late final String uploader_id;

  File(
      {required this.id,
      required this.subject,
      required this.description,
      required this.upload_date,
      required this.upload_file,
      required this.is_read,
      required this.designation_id,
      required this.uploader_id});

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      id: json['id'],
      subject: json['subject'],
      description: json['description'],
      upload_date: json['upload_date'],
      upload_file: json['upload_file'],
      is_read: json['is_read'],
      designation_id: json['designation_id'],
      uploader_id: json['uploader_id'],
    );
  }

  dynamic toJson() => {
        'id': id,
        'subject': subject,
        'description': description,
        'upload_date': upload_date,
        'upload_file': upload_file,
        'is_read': is_read,
        'designation_id': designation_id,
        'uploader_id': uploader_id
      };
}
