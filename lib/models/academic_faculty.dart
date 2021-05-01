class AcademicDataFaculty{
  var student_flag;
  var fac_flag;
  List? thesis_supervision_request_list;
  List? pending_thesis_request_list;
  List? approved_thesis_request_list;
  List? courses_list;
  Map? faculty;

  AcademicDataFaculty(
  {
    this.student_flag,
    this.fac_flag,
    this.thesis_supervision_request_list,
    this.pending_thesis_request_list,
    this.approved_thesis_request_list,
    this.courses_list,
    this.faculty});

  factory AcademicDataFaculty.fromJson(Map json){
    return AcademicDataFaculty(
      student_flag: json["student_flag"],
      fac_flag: json["fac_flag"],
      thesis_supervision_request_list: json["thesis_supervision_request_list"],
      pending_thesis_request_list: json["pending_thesis_request_list"],
      approved_thesis_request_list: json["approved_thesis_request_list"],
      courses_list: json["courses_list"],
      faculty: json["faculty"],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "student_flag":this.student_flag,
      "fac_flag":this.fac_flag,
      "thesis_supervision_request_list":this.thesis_supervision_request_list,
      "pending_thesis_request_list":this.pending_thesis_request_list,
      "approved_thesis_request_list":this.approved_thesis_request_list,
      "courses_list":this.courses_list,
      "faculty":this.faculty,
    };
  }
}