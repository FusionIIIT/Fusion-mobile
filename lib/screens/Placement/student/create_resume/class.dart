class Resume {
  String? title;
  String? name;
  double? cpi;
  String? email;
  String? phoneNumber;
  String? linkedinId;
  String? githubId;
  List<CodingPlatformProfile> codingPlatformProfiles;
  List<Education> educationBackground;
  List<Project> projects;
  List<String> skills;
  List<WorkExperience> workExperiences;

  Resume({
    this.title,
    this.name,
    this.cpi,
    this.email,
    this.phoneNumber,
    this.linkedinId,
    this.githubId,
    this.codingPlatformProfiles = const [],
    this.educationBackground = const [],
    this.projects = const [],
    this.skills = const [],
    this.workExperiences = const [],
  });
}

class CodingPlatformProfile {
  String? platformName;
  String? profileLink;

  CodingPlatformProfile({this.platformName, this.profileLink});
}

class Education {
  DateTime? startDate;
  DateTime? endDate;
  String? institution;
  String? degree;

  Education({this.startDate, this.endDate, this.institution, this.degree});
}

class Project {
  String? title;
  String? description;
  String? link;

  Project({this.title, this.description, this.link});
}

class WorkExperience {
  DateTime? startDate;
  DateTime? endDate;
  String? companyName;
  String? position;

  WorkExperience(
      {this.startDate, this.endDate, this.companyName, this.position});
}
