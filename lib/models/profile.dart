class ProfileData {
  //<Notification>? notifications;
  Map? user;
  Map? profile;
  List? skills;
  List? education;
  List? course;
  List? experience;
  List? project;
  List? achievement;
  List? publication;
  List? patent;
  List? current;

  ProfileData({this.user, this.profile, this.skills,
    this.education, this.course, this.experience,
    this.project, this.achievement, this.publication,
    this.patent, this.current});

  factory ProfileData.fromJson(Map json) {
    return ProfileData(
      user: json["user"],
      profile: json["profile"],
      //skills: Notification.fromListJson(json["skills"]),
      skills: json["skills"],
      education: json["education"],
      course: json["course"],
      experience: json["experience"],
      project: json["project"],
      achievement: json["achievement"],
      publication: json["publication"],
      patent: json["patent"],
      current: json["current"],

    );
  }
}