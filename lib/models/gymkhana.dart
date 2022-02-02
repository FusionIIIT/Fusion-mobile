class GymkhanaData {
  //<Notification>? notifications;

  List? clubNames;
  List? membersDetails;
  List? clubDetails;
  List? clubSessions;
  List? clubEvents;

  GymkhanaData(
      {
        this.clubNames,
        this.membersDetails,
        this.clubDetails,
        this.clubSessions,
        this.clubEvents,
      });

  factory GymkhanaData.fromJson(Map json) {
    return GymkhanaData(
      clubNames: json["clubNames"],
      membersDetails: json["membersDetails"],
      clubDetails: json["clubDetails"],
      clubSessions: json["clubSessions"],
      clubEvents: json["clubEvents"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "clubNames": this.clubNames,
      "membersDetails": this.membersDetails,
      "clubDetails": this.clubDetails,
      "clubSessions": this.clubSessions,
      "clubEvents": this.clubEvents,
    };
  }
}
