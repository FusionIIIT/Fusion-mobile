class ComplaintData {
  Map? complainer;
  Map? complainer_extra_info;
  Map? complaint_details;
  Map? worker_details;

  ComplaintData(
      // ignore: non_constant_identifier_names
      {this.complainer,
      // ignore: non_constant_identifier_names
      this.complainer_extra_info,
      // ignore: non_constant_identifier_names
      this.complaint_details,
      // ignore: non_constant_identifier_names
      this.worker_details});

  factory ComplaintData.fromJson(Map json) {
    return ComplaintData(
      complainer: json["complainer"],
      complainer_extra_info: json["complainer_extra_info"],
      complaint_details: json["complaint_details"],
      worker_details: json["worker_details"],
    );
  }
}
