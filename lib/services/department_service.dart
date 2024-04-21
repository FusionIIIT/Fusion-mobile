import 'dart:convert';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class Student {
  final String id;
  final String programme;
  final int batch;
  final double cpi;
  final String category;
  final String fatherName;
  final String motherName;
  final int hallNo;
  final int? roomNo;
  final String specialization;
  final int currSemesterNo;
  final int batchId;

  Student({
    required this.id,
    required this.programme,
    required this.batch,
    required this.cpi,
    required this.category,
    required this.fatherName,
    required this.motherName,
    required this.hallNo,
    required this.roomNo,
    required this.specialization,
    required this.currSemesterNo,
    required this.batchId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] ?? '',
      programme: json['programme'] ?? '',
      batch: json['batch'] ?? 0,
      cpi: json['cpi'] != null ? json['cpi'].toDouble() : 0.0,
      category: json['category'] ?? '',
      fatherName: json['father_name'] ?? '',
      motherName: json['mother_name'] ?? '',
      hallNo: json['hall_no'] ?? 0,
      roomNo: json['room_no'],
      specialization: json['specialization'] ?? '',
      currSemesterNo: json['curr_semester_no'] ?? 0,
      batchId: json['batch_id'] ?? 0,
    );
  }
}

class FacultyDetails {
  final String id;
  final String title;
  final String sex;
  final String dateOfBirth;
  final String userStatus;
  final String address;
  final String userType;
  final String profilePicture;
  final String aboutMe;
  final String dateModified;
  final int phoneNumber;
  final int user;
  final int department;

  FacultyDetails({
    required this.id,
    required this.title,
    required this.sex,
    required this.dateOfBirth,
    required this.userStatus,
    required this.address,
    required this.phoneNumber,
    required this.userType,
    required this.profilePicture,
    required this.aboutMe,
    required this.dateModified,
    required this.user,
    required this.department,
  });

  factory FacultyDetails.fromJson(Map<String, dynamic> json) {
    return FacultyDetails(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      sex: json['sex'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      userStatus: json['user_status'] ?? '',
      address: json['address'] ?? '',
      phoneNumber: json['phone_no'] ?? '',
      userType: json['user_type'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      aboutMe: json['about_me'] ?? '',
      dateModified: json['date_modified'] ?? '',
      user: json['user'] ?? 0,
      department: json['department'] ?? 0,
    );
  }

  get entries => null;
}

class Announcement {
  final String ann_date;
  final String maker_id;
  final String programme;
  final String batch;
  final String department;
  final String message;
  final String? upload_announcement;

  Announcement({
    required this.ann_date,
    required this.maker_id,
    required this.programme,
    required this.batch,
    required this.department,
    required this.message,
    this.upload_announcement,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      ann_date: json['ann_date'],
      maker_id: json['maker_id'],
      programme: json['programme'],
      batch: json['batch'],
      department: json['department'],
      message: json['message'],
      upload_announcement: json['upload_announcement'],
    );
  }
}

class DepartmentService {
  // Future<Map<String, dynamic>> fetchDepartmentInfo(String departmentId) async {
  //   try {
  //     var storage_service = locator<StorageService>();
  //     if (storage_service.userInDB?.token == null)
  //       throw Exception('Token Error');

  //     Map<String, String> headers = {
  //       'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
  //     };

  //     http.Response response = await http.get(
  //       Uri.http(getLink(), kDepartmentInfo),
  //       headers: headers,
  //     );
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> departmentInfo = jsonDecode(response.body);
  //       return departmentInfo;
  //     } else {
  //       throw Exception('Failed to fetch department information.');
  //     }
  //   } catch (e) {
  //     print('Error in fetchDepartmentInfo: $e');
  //     rethrow;
  //   }
  // }

  Future<List<Map<String, dynamic>>> getFacultyDetails(
      String department) async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      http.Response response = await http.get(
        Uri.http(getLink(), kDepMain),
        headers: headers,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<Map<String, dynamic>> facultyList = [];
        List<Map<String, dynamic>>? departmentFacultyList = jsonData['fac_list']
                ?[department.toLowerCase() + '_f']
            ?.cast<Map<String, dynamic>>();
        facultyList.addAll(departmentFacultyList ?? []);
        // print(facultyList);
        return facultyList;
      } else {
        throw Exception('Failed to load faculty details for $department');
      }
    } catch (e) {
      print('Error in getFacultyDetails: $e');
      rethrow;
    }
  }

  Future<List<Announcement>> getDepartmentsAnnouncements(
      String department) async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null)
        throw Exception('Token Error');

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      http.Response response = await http.get(
        Uri.http(getLink(), kDepMain),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<dynamic> departmentAnnouncements = [];
        if (department.toLowerCase() == 'all') {
          departmentAnnouncements.addAll(jsonData['announcements']['all']);
          departmentAnnouncements.addAll(jsonData['announcements']['cse']);
          departmentAnnouncements.addAll(jsonData['announcements']['ece']);
          departmentAnnouncements.addAll(jsonData['announcements']['me']);
          departmentAnnouncements.addAll(jsonData['announcements']['sm']);
        } else {
          departmentAnnouncements =
              jsonData['announcements'][department.toLowerCase()];
        }
        // print(departmentAnnouncements);
        List<Announcement> announcements = departmentAnnouncements.map((item) {
          return Announcement.fromJson(item);
        }).toList();
        return announcements;
      } else {
        throw Exception('Failed to load announcements for $department');
      }
    } catch (e) {
      print('Error in getAnnouncements: $e');
      rethrow;
    }
  }

  Future<bool> createAnnouncement(Map<String, dynamic> announcementData) async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? ""),
      };

      if (announcementData['upload_announcement'] != null) {
        var request = http.MultipartRequest(
          'POST',
          Uri.http(getLink(), kDepMain),
        );

        request.headers.addAll(headers);
        announcementData.forEach((key, value) {
          if (key != 'upload_announcement') {
            request.fields[key] = value.toString();
          }
        });
        var multipartFile = await http.MultipartFile.fromPath(
          'upload_announcement',
          announcementData['upload_announcement'],
          contentType: MediaType('file', 'pdf,jpeg,png,jpg'),
        );

        request.files.add(multipartFile);
        print(request);
        var response = await http.Response.fromStream(await request.send());
        if (response.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      } else {
        headers['Content-Type'] = 'application/json';
        http.Response response = await http.post(
          Uri.http(getLink(), kDepartmentAnnouncements),
          headers: headers,
          body: jsonEncode(announcementData),
        );

        if (response.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print('Exception occurred while creating announcement: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getStudents(int bid) async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null) {
        throw Exception('Token Error');
      }

      Map<String, String> headers = {
        'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
      };

      http.Response response = await http.get(
        Uri.http(getLink(), '$kAllStudents$bid'),
        headers: headers,
      );
      print('$kAllStudents$bid');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<Map<String, dynamic>> studentList =
            jsonResponse['student_list'].cast<Map<String, dynamic>>();
        print(studentList);
        return studentList;
      } else {
        print('Failed to get students. Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Exception occurred while getting students: $e');
      return [];
    }
  }
}
