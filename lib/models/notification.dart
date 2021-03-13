import 'dart:convert';

class Notification {
  String? id;
  bool? unread;
  String? verb;
  Map? data;
  String? description;
  DateTime? timestamp;
  bool? public;
  bool? deleted;
  String? recipient;
  bool? emailed;

  Notification({
    this.id,
    this.data,
    this.deleted,
    this.description,
    this.emailed,
    this.public,
    this.recipient,
    this.unread,
    this.verb,
    this.timestamp,
  });

  factory Notification.fromJson(json) {
    return Notification(
      id: json["id"],
      data: jsonDecode(json["data"].replaceAll("'", '"')),
      verb: json["verb"],
      unread: json["unread"],
      timestamp: DateTime.parse(json["timestamp"]),
      public: json["public"],
      description: json["description"],
      recipient: json["recipient"],
    );
  }

  static List<Notification> fromListJson(json) {
    List<Notification> notifs = [];
    json.forEach((v) {
      notifs.add(Notification.fromJson(v));
    });
    return notifs;
  }
}
