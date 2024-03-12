class DepartmentData {
  List<StudentData> students;
  List<AlumniData> alumni;
  List<FacultyData> faculty;
  List<Announcement> announcements;

  DepartmentData({
    required this.students,
    required this.alumni,
    required this.faculty,
    required this.announcements,
  });

  factory DepartmentData.fromJson(Map<String, dynamic> json) {
    return DepartmentData(
      students: List<StudentData>.from(
          json['students'].map((student) => StudentData.fromJson(student))),
      alumni: List<AlumniData>.from(
          json['alumni'].map((alumni) => AlumniData.fromJson(alumni))),
      faculty: List<FacultyData>.from(
          json['faculty'].map((faculty) => FacultyData.fromJson(faculty))),
      announcements: List<Announcement>.from(json['announcements']
          .map((announcement) => Announcement.fromJson(announcement))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'students': students.map((student) => student.toJson()).toList(),
      'alumni': alumni.map((alumni) => alumni.toJson()).toList(),
      'faculty': faculty.map((faculty) => faculty.toJson()).toList(),
      'announcements':
          announcements.map((announcement) => announcement.toJson()).toList(),
    };
  }
}

class StudentData {
  var id;
  var name;
  var batchId;
  var programme;
  var batch;
  var department;

  StudentData({
    this.id,
    this.name,
    this.batchId,
    this.programme,
    this.batch,
    this.department,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
      id: json['id'],
      name: json['name'],
      batchId: json['batchId'],
      programme: json['programme'],
      batch: json['batch'],
      department: json['department'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'batchId': batchId,
      'programme': programme,
      'batch': batch,
      'department': department,
    };
  }
}

class AlumniData {
  var id;
  var name;
  var batchId;
  var programme;
  var batch;
  var department;

  AlumniData({
    this.id,
    this.name,
    this.batchId,
    this.programme,
    this.batch,
    this.department,
  });

  factory AlumniData.fromJson(Map<String, dynamic> json) {
    return AlumniData(
      id: json['id'],
      name: json['name'],
      batchId: json['batchId'],
      programme: json['programme'],
      batch: json['batch'],
      department: json['department'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'batchId': batchId,
      'programme': programme,
      'batch': batch,
      'department': department,
    };
  }
}

class FacultyData {
  var id;
  var facultyName;
  var sex;
  var dateOfBirth;
  var address;
  var phoneNumber;

  FacultyData({
    this.id,
    this.facultyName,
    this.sex,
    this.dateOfBirth,
    this.address,
    this.phoneNumber,
  });

  factory FacultyData.fromJson(Map<String, dynamic> json) {
    return FacultyData(
      id: json['id'],
      facultyName: json['facultyName'],
      sex: json['sex'],
      dateOfBirth: json['dateOfBirth'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'facultyName': facultyName,
      'sex': sex,
      'dateOfBirth': dateOfBirth,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}

class Announcement {
  final String maker_id;
  final DateTime ann_date;
  final String message;
  final String batch;
  final String department;
  final String programme;
  final String upload_announcement;

  Announcement({
    required this.maker_id,
    required this.ann_date,
    required this.message,
    required this.batch,
    required this.department,
    required this.programme,
    required this.upload_announcement,
  });
  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      maker_id: json['maker_id'],
      ann_date: json['ann_date'],
      message: json['message'],
      batch: json['batch'],
      department: json['department'],
      programme: json['programme'],
      upload_announcement: json['upload_announcement'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maker_id': maker_id,
      'ann_date': ann_date,
      'message': message,
      'batch': batch,
      'department': department,
      'programme': programme,
      'upload_announcement': upload_announcement,
    };
  }
}
