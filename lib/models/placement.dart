class Projects {
  List? projects;
  Projects({this.projects});
  factory Projects.fromJson(Map json) {
    return Projects(
      projects: json["projects"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "projects": this.projects,
    };
  }
}

class Experiences {
  List? experiences;
  Experiences({this.experiences});
  factory Experiences.fromJson(Map json) {
    return Experiences(
      experiences: json["experiences"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "experiences": this.experiences,
    };
  }
}

class Skills {
  List? skills;
  Skills({this.skills});
  factory Skills.fromJson(Map json) {
    return Skills(
      skills: json["skills"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "skills": this.skills,
    };
  }
}

class Has_Skills {
  List? has_skills;
  Has_Skills({this.has_skills});
  factory Has_Skills.fromJson(Map json) {
    return Has_Skills(
      has_skills: json["has_skills"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "has_skills": this.has_skills,
    };
  }
}

class EducationDetails {
  List? education_details;
  EducationDetails({this.education_details});
  factory EducationDetails.fromJson(Map json) {
    return EducationDetails(
      education_details: json["education_details"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "education_details": this.education_details,
    };
  }
}

class Courses {
  List? courses;
  Courses({this.courses});
  factory Courses.fromJson(Map json) {
    return Courses(
      courses: json["experiences"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "experiences": this.courses,
    };
  }
}

class Conference {
  List? conferences;
  Conference({this.conferences});
  factory Conference.fromJson(Map json) {
    return Conference(
      conferences: json["experiences"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "experiences": this.conferences,
    };
  }
}

class Publications {
  List? publications;
  Publications({this.publications});
  factory Publications.fromJson(Map json) {
    return Publications(
      publications: json["experiences"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "experiences": this.publications,
    };
  }
}

class References {
  List? references;
  References({this.references});
  factory References.fromJson(Map json) {
    return References(
      references: json["references"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "references": this.references,
    };
  }
}

class CoAuthor {
  List? co_authors;
  CoAuthor({this.co_authors});
  factory CoAuthor.fromJson(Map json) {
    return CoAuthor(
      co_authors: json["coauthor"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "coauthor": this.co_authors,
    };
  }
}

class Patent {
  List? patents;
  Patent({this.patents});
  factory Patent.fromJson(Map json) {
    return Patent(
      patents: json["patent"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "patent": this.patents,
    };
  }
}

class CoInventor {
  List? co_inventors;
  CoInventor({this.co_inventors});
  factory CoInventor.fromJson(Map json) {
    return CoInventor(
      co_inventors: json["coinventor"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "coinventor": this.co_inventors,
    };
  }
}

class Interest {
  List? interests;
  Interest({this.interests});
  factory Interest.fromJson(Map json) {
    return Interest(
      interests: json["interest"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "interest": this.interests,
    };
  }
}

class Achievement {
  List? achievements;
  Achievement({this.achievements});
  factory Achievement.fromJson(Map json) {
    return Achievement(
      achievements: json["achievement"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "achievement": this.achievements,
    };
  }
}

class extraCurricular {
  List? extra_curriculars;
  extraCurricular({this.extra_curriculars});
  factory extraCurricular.fromJson(Map json) {
    return extraCurricular(
      extra_curriculars: json["extracurricular"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "extracurricular": this.extra_curriculars,
    };
  }
}

class MessageOfficer {
  List? message_officers;
  MessageOfficer({this.message_officers});
  factory MessageOfficer.fromJson(Map json) {
    return MessageOfficer(
      message_officers: json["messageofficer"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "messageofficer": this.message_officers,
    };
  }
}

class NotifyStudent {
  List? notify_students;
  NotifyStudent({this.notify_students});
  factory NotifyStudent.fromJson(Map json) {
    return NotifyStudent(
      notify_students: json["notifystudent"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "notifystudent": this.notify_students,
    };
  }
}

class Role {
  List? roles;
  Role({this.roles});
  factory Role.fromJson(Map json) {
    return Role(
      roles: json["role"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "role": this.roles,
    };
  }
}

class CompanyDetails {
  List? company_details;
  CompanyDetails({this.company_details});
  factory CompanyDetails.fromJson(Map json) {
    return CompanyDetails(
      company_details: json["company_details"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "company_details": this.company_details,
    };
  }
}

class PlacementStatus {
  List? placement_status;
  PlacementStatus({this.placement_status});
  factory PlacementStatus.fromJson(Map json) {
    return PlacementStatus(
      placement_status: json["placement_status"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "placement_status": this.placement_status,
    };
  }
}

class PlacementRecord {
  var id;
  var placement_type;
  var name;
  var branch;
  var ctc;
  var year;
  var test_score;
  var test_type;
  var unique_id_id;
  PlacementRecord({
    this.id,
    this.placement_type,
    this.name,
    this.branch,
    this.ctc,
    this.year,
    this.test_score,
    this.test_type,
    this.unique_id_id,
  });
  factory PlacementRecord.fromJson(Map<String, dynamic> json) {
    return PlacementRecord(
      id: json["id"],
      placement_type: json["placement_type"],
      name: json["name"],
      branch: json["branch"],
      ctc: json["ctc"],
      year: json["year"],
      test_score: json["test_score"],
      test_type: json["test_type"],
      unique_id_id: json["unique_id_id"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "placement_type": this.placement_type,
      "name": this.name,
      "branch": this.branch,
      "ctc": this.ctc,
      "year": this.year,
      "test_score": this.test_score,
      "test_type": this.test_type,
      "unique_id_id": this.unique_id_id,
    };
  }
}

class StudentRecord {
  List? student_records;
  StudentRecord({this.student_records});
  factory StudentRecord.fromJson(Map json) {
    return StudentRecord(
      student_records: json["studentrecord"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "studentrecord": this.student_records,
    };
  }
}

class ChairmanVisit {
  List? chairman_visits;
  ChairmanVisit({this.chairman_visits});
  factory ChairmanVisit.fromJson(Map json) {
    return ChairmanVisit(
      chairman_visits: json["chairmanvisit"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "chairmanvisit": this.chairman_visits,
    };
  }
}

class PlacementSchedule {
  int? id;
  String? placement_type;
  String? name;
  String? branch;
  double? ctc;
  int? year;
  int? test_score;
  String? test_type;
  PlacementSchedule({
    this.id,
    this.placement_type,
    this.name,
    this.branch,
    this.ctc,
    this.year,
    this.test_score,
    this.test_type,
  });
  factory PlacementSchedule.fromJson(Map json) {
    return PlacementSchedule(
        id: json["id"],
        placement_type: json["placement_type"],
        name: json["name"],
        branch: json["branch"],
        ctc: json["ctc"],
        year: json["year"],
        test_score: json["test_score"],
        test_type: json["test_type"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "placement_type": this.placement_type,
      "name": this.name,
      "branch": this.branch,
      "ctc": this.ctc,
      "year": this.year,
      "test_score": this.test_score,
      "test_type": this.test_type,
    };
  }
}

class StudentPlacement {
  List? student_placements;
  StudentPlacement({this.student_placements});
  factory StudentPlacement.fromJson(Map json) {
    return StudentPlacement(
      student_placements: json["studentplacement"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "studentplacement": this.student_placements,
    };
  }
}
