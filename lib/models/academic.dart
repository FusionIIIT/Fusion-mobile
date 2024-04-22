class AcademicData {
  //<Notification>? notifications;
  Map? details;
  Map? profile;
  Map? attendance;
  List? currently_registered;
  List? pre_registered_courses;
  List? pre_registered_courses_show;
  List? final_registered_courses;
  var current_credits;
  List? courses_list;
  Map? fee_payment_mode_list;
  List? next_sem_branch_registration_courses;
  List? final_registration_choices;
  List? performance_list;
  List? thesis_request_list;
  List? add_courses_options;
  List? drop_courses_options;
  List? backlogCourseList;
  var user_sem;
  var student_flag;
  var ug_flag;
  var masters_flag;
  var phd_flag;
  var fac_flag;
  var des_flag;
  var thesis_flag;
  var dropped_courses_count;
  var added_course_count;
  var pre_registration_date_flag;
  var final_registration_date_flag;
  var add_or_drop_course_date_flag;
  var pre_registration_flag;
  var final_registration_flag;
  List? teaching_credit_registration_course;
  var lib_d;
  var acad_d;
  var mess_d;
  var pc_d;
  var hos_d;
  var tot_d;
  var Branch_Change_Flag;

  AcademicData(
      {this.details,
      this.profile,
      this.attendance,
      this.currently_registered,
      this.pre_registered_courses,
      this.pre_registered_courses_show,
      this.final_registered_courses,
      this.current_credits,
      this.courses_list,
      this.fee_payment_mode_list,
      this.next_sem_branch_registration_courses,
      this.final_registration_choices,
      this.performance_list,
      this.thesis_request_list,
      this.add_courses_options,
      this.backlogCourseList,
      this.drop_courses_options,
      this.user_sem,
      this.student_flag,
      this.ug_flag,
      this.masters_flag,
      this.phd_flag,
      this.fac_flag,
      this.des_flag,
      this.thesis_flag,
      this.dropped_courses_count,
      this.added_course_count,
      this.pre_registration_date_flag,
      this.final_registration_date_flag,
      this.add_or_drop_course_date_flag,
      this.pre_registration_flag,
      this.final_registration_flag,
      this.teaching_credit_registration_course,
      this.lib_d,
      this.acad_d,
      this.mess_d,
      this.pc_d,
      this.hos_d,
      this.tot_d,
      this.Branch_Change_Flag});

  factory AcademicData.fromJson(Map json) {
    return AcademicData(
      details: json["details"],
      profile: json["profile"],
      attendance: json["attendance"],
      currently_registered: json["currently_registered"],
      pre_registered_courses: json["pre_registered_courses"],
      pre_registered_courses_show: json["pre_registered_courses_show"],
      final_registered_courses: json["final_registered_courses"],
      current_credits: json["current_credits"],
      courses_list: json["courses_list"],
      fee_payment_mode_list: json["fee_payment_mode_list"],
      next_sem_branch_registration_courses:
          json["next_sem_branch_registration_courses"],
      final_registration_choices: json["final_registration_choices"],
      performance_list: json["performance_list"],
      thesis_request_list: json["thesis_request_list"],
      add_courses_options: json["add_courses_options"],
      backlogCourseList: json["backlogCourseList"],
      drop_courses_options: json["drop_courses_options"],
      user_sem: json["user_sem"],
      student_flag: json["student_flag"],
      ug_flag: json["ug_flag"],
      masters_flag: json["masters_flag"],
      phd_flag: json["phd_flag"],
      fac_flag: json["fac_flag"],
      des_flag: json["des_flag"],
      thesis_flag: json["thesis_flag"],
      dropped_courses_count: json["dropped_courses_count"],
      added_course_count: json["added_course_count"],
      pre_registration_date_flag: json["pre_registration_date_flag"],
      final_registration_date_flag: json["final_registration_date_flag"],
      add_or_drop_course_date_flag: json["add_or_drop_course_date_flag"],
      pre_registration_flag: json["pre_registration_flag"],
      final_registration_flag: json["final_registration_flag"],
      teaching_credit_registration_course:
          json["teaching_credit_registration_course"],
      lib_d: json["lib_d"],
      acad_d: json["acad_d"],
      mess_d: json["mess_d"],
      pc_d: json["pc_d"],
      hos_d: json["hos_d"],
      tot_d: json["tot_d"],
      Branch_Change_Flag: json["Branch_Change_Flag"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "details": this.details,
      "profile": this.profile,
      "attendance": this.attendance,
      "currently_registered": this.currently_registered,
      "pre_registered_courses": this.pre_registered_courses,
      "pre_registered_courses_show": this.pre_registered_courses_show,
      "final_registered_courses": this.final_registered_courses,
      "current_credits": this.current_credits,
      "courses_list": this.courses_list,
      "fee_payment_mode_list": this.fee_payment_mode_list,
      "next_sem_branch_registration_courses":
          this.next_sem_branch_registration_courses,
      "final_registration_choices": this.final_registration_choices,
      "performance_list": this.performance_list,
      "thesis_request_list": this.thesis_request_list,
      "add_courses_options": this.add_courses_options,
      "backlogCourseList": this.backlogCourseList,
      "drop_courses_options": this.drop_courses_options,
      "user_sem": this.user_sem,
      "student_flag": this.student_flag,
      "ug_flag": this.ug_flag,
      "masters_flag": this.masters_flag,
      "phd_flag": this.phd_flag,
      "fac_flag": this.fac_flag,
      "des_flag": this.des_flag,
      "thesis_flag": this.thesis_flag,
      "dropped_courses_count": this.dropped_courses_count,
      "added_course_count": this.added_course_count,
      "add_or_drop_course_date_flag": this.add_or_drop_course_date_flag,
      "pre_registration_flag": this.pre_registration_flag,
      "final_registration_flag": this.final_registration_flag,
      "pre_registration_date_flag": this.pre_registration_date_flag,
      "final_registration_date_flag": this.final_registration_date_flag,
      "teaching_credit_registration_course":
          this.teaching_credit_registration_course,
      "lib_d": this.lib_d,
      "acad_d": this.acad_d,
      "mess_d": this.mess_d,
      "pc_d": this.pc_d,
      "hos_d": this.hos_d,
      "tot_d": this.tot_d,
      "Branch_Change_Flag": this.Branch_Change_Flag,
    };
  }
}
