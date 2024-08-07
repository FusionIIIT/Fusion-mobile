//Server and local links
String klocalLink = "172.27.16.214:8000";
String kserverLink = "172.27.16.214:8000";

//Login Service
String kAuthUrl = "172.27.16.214:8000";
String kAuthLogin = "/api/auth/login/";
// String kAuthLogin = "/accounts/login";

//Profile Service
String kProfile = "/api/profile/";

//Academic Procedures
String kAcademicProcedures = "/academic-procedures/api/stu/details";

String kAcademicCourseList = "/academic-procedures/api/stu/details";

String kConfigurePreRegistration =
    "/academic-procedures/api/acad/configure_pre_registration/";
String kConfigureFinalRegistration =
    "/academic-procedures/api/acad/configure_final_registration/";
String kFacultyGetAssignedCourses =
    "/academic-procedures/api/fac/view_assigned_courses/";
String kAcadGetCoursesList = "/academic-procedures/api/acad/get_course_list/";
String kFinalRegistration = "/academic-procedures/api/stu/final_registration/";
String kGetAllCourses = "/academic-procedures/api/acad/get_all_courses/";
String kGenerateRollList = "/academic-procedures/api/acad/gen_roll_list/";
String KManageSchedule = "/aims/api/calendar/";
String KUpdateSchedule = "/aims/api/update-calendar/";
String kRemoveCourseFromSlot =
    "/academic-procedures/api/acad/remove_course_from_slot/";
String kAddCourseToSlot = "/academic-procedures/api/acad/add_course_to_slot/";
String kPreRegAddOneCourse = "/academic-procedures/api/stu/add_one_course/";
String kGetNextSemCourses = "/academic-procedures/api/get_next_sem_courses/";
String kPreRegFinal = "/academic-procedures/api/stu/pre_registration";
String kAddCourses = "/academic-procedures/api/stu/add_course";

//Central Mess
String kCentralMess = "172.27.16.214:8000";
String kFeedbackEndpoint = "/mess/api/feedbackApi";
String kMenuEndpoint = "/mess/api/menuApi";
String kMessBillBase = "/mess/api/messBillBaseApi";
String kMonthlyBillEndpoint = "/mess/api/monthlyBillApi";
String kMonthlyPaymentEndpoint = "/mess/api/paymentsApi";
String kRebateEndpoint = "/mess/api/rebateApi";
String kSpecialRequestEndpoint = "/mess/api/specialRequestApi";
String kVacationFoodRequestEndpoint = "/mess/api/vacationFoodApi";
String kMessInfoEndpoint = "/mess/api/messInfoApi";
String kRegistrationRequestEndpoint = "/mess/api/registrationRequestApi";
String kDeregistrationRequestEndpoint = "/mess/api/deRegistrationRequestApi";
String kRegMainEndpoint = "/mess/api/get_mess_students";
String kStudentAllDetails = "/mess/api/get_student_all_details";
String kStudentRegRecords = "/mess/api/get_reg_records";
String kDeregistrationEndpoint = "/mess/api/deRegistrationApi";
String kUpdatePaymentRequestEndpoint = "/mess/api/updatePaymentApi";

//Complaint
String kComplaintService = "/complaint/api/studentcomplain";
String kComplaintNew = "/complaint/api/newcomplain";
String kComplaintUpdate = "complaint/api/updatecomplain/";
String kComplaintRemove = "/complaint/api/removecomplain/";
String kViewCaretaker = "/complaint/api/caretakers/";
String kViewSupervisor = "/complaint/api/supervisors/";
String kForward = "/complaint/api/forward/";

//Dashboard
String kDashboard = "/api/dashboard/";
String kNotification = "/api/notification/";
String kNotificationRead = "/notifications/api/mark_as_read/";
String kNotificationDelete = "/notifications/api/delete/";


//Gymkhana
const kGymkhanaClubDetails = '/api/gymkhana/club_details';
const kGymkhanaMemberRecords = '/api/gymkhana/members_record';

//HealthCentre
String kHealthCentreStudent = "/healthcenter/api/student";


//Examination




String kRegisteredStudentDetails = "/examination/api/registered_student_details";
String kUpdateAuthenticator = "/examination/api/update_authenticator/";
String kCheckAllAuthenticators = "/examination/api/check_all_authenticators/";
String kCourseDetails = "/examination/api/get_course_names/";
String kUpdateGradesEndpoint = "/examination/api/update_grades/";
String kRegisteredStudentDetailsAndRollNo = "/examination/api/get_registered_students_roll_no/";
String kGenerateTranscriptForm = "/examination/api/generate_transcript_form/";
String kGenerateTranscript = "/examination/api/generate_transcript/"; 
String kAnnounce = "/examination/api/announce/";
String kGradesForCourseEndpoint = "/examination/api/getGrade";
String kSubmitGrade ="/examination/api/submit_grades/";
String kGetAuthStatus ="/examination/api/get_auth_status/";

//  generate_transcript_form    generate_transcript   

//------------Screens------------

//screens/Academic/Current_Semester
String kAcademicProceduresCalender =
    "/static/academic_procedures/academic_calender.pdf";
String kAcademicProceduresEndTT =
    "/static/academic_procedures/END_SEM_EXAM_TT.pdf";
String kAcademicProceduresHolidaysTT =
    "/static/academic_procedures/List_of_Holidays.pdf";
String kAcademicProceduresTT = "/static/academic_procedures/";

// programme and curriculumns
String kugprogrammes = "/programme_curriculum/api/programmes_ug/";
String kpgprogrammes = "/programme_curriculum/api/programmes_pg/";
String kphdprogrammes = "/programme_curriculum/api/programmes_phd/";
String kProgrammeInfo = "/programme_curriculum/api/programme_info/";
String kCurriculumns = "/programme_curriculum/api/curriculumns/";
String kAddProgrammes = "/programme_curriculum/api/add_programme/";
