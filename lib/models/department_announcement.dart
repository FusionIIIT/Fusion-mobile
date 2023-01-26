class DepartmentAnnouncements {
  String? maker_id;
  DateTime? ann_date;
  String? message;
  String? batch;
  String? department;
  String? programme;

  DepartmentAnnouncements({
    this.maker_id, //id of announcement maker
    this.ann_date, //announcement date and time
    this.message, //message in the announcement
    this.batch,
    this.department,
    this.programme,
  });
  factory DepartmentAnnouncements.fromJson(json) {
    return DepartmentAnnouncements(
      maker_id: json["maker_id"],
      ann_date: DateTime.parse(json["timestamp"]),
      message: json["message"],
      batch: json["batch"],
      department: json["department"],
      programme: json["programme"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "maker_id": this.maker_id,
      "ann_date": this.ann_date,
      "message": this.message,
      "batch": this.batch,
      "department": this.department,
      "programme": this.programme,
    };
  }
}
