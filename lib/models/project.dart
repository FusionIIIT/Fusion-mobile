class ProjectData {
  List? projects;

  ProjectData({
    this.projects,
  });

  factory ProjectData.fromJson(Map json) {
    return ProjectData(
      projects: json["projects"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "projects": this.projects,
    };
  }
}
