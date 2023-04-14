class Announcements {
  final String makerId;
  final DateTime annDate;
  final String message;
  final String batch;
  final String department;
  final String programme;
  final String? uploadAnnouncement;
  final String id;

  Announcements({
    required this.makerId,
    required this.annDate,
    required this.message,
    required this.batch,
    required this.department,
    required this.programme,
    this.uploadAnnouncement,
    required this.id,
  });

  factory Announcements.fromJson(Map<String, dynamic> json) {
    return Announcements(
      makerId: json['maker_id'],
      annDate: DateTime.parse(json['ann_date']),
      message: json['message'],
      batch: json['batch'],
      department: json['department'],
      programme: json['programme'],
      uploadAnnouncement: json['upload_announcement'],
      id: json['id'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'maker_id': makerId,
        'ann_date': annDate.toIso8601String(),
        'message': message,
        'batch': batch,
        'department': department,
        'programme': programme,
        'upload_announcement': uploadAnnouncement,
        'id': id,
      };
}
