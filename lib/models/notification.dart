import 'dart:convert';

class Notification {
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
        data: jsonDecode(json["data"].replaceAll("'", '"')),
        verb: json["verb"],
        unread: json["unread"],
        timestamp: DateTime.parse(json["timestamp"]),
        public: json["public"]);
  }

  static List<Notification> fromListJson(json) {
    List<Notification> notifs = [];
    json.forEach((v) {
      notifs.add(Notification.fromJson(v));
    });
    return notifs;
  }
}
