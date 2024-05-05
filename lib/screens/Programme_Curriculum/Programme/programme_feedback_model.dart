class ProgrammeFeedbackModel {
  String programmes;
  String discipline;

  ProgrammeFeedbackModel({this.programmes = "", this.discipline = ""});

  factory ProgrammeFeedbackModel.fromJson(dynamic json) {
    return ProgrammeFeedbackModel(
      programmes: "${json['programmes']}",
      discipline: "${json['discipline']}",
    );
  }

  Map toJson() => {
        "programmes": programmes,
        "discipline": discipline,
      };
}
