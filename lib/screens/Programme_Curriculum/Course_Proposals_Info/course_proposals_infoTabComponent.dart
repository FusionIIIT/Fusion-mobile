import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CourseProposalsInfoTabComponent extends StatefulWidget {
  final data;
  const CourseProposalsInfoTabComponent({Key? key, this.data})
      : super(key: key);

  @override
  _CourseProposalsInfoTabComponentState createState() =>
      _CourseProposalsInfoTabComponentState();
}

class _CourseProposalsInfoTabComponentState
    extends State<CourseProposalsInfoTabComponent> {
  late String name = "";
  late String studentType = "";
  late String userType = "";
  // Stream Controller for API
  late StreamController _dashboardController;
  late DashboardService dashboardService;
  late DashboardData data;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData data2;
  bool _loading = true;

  late Map? table;
  late String? column1;
  late String? column2;
  var rows;
  var columns;

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
      ),
    );
  }

  void sendData(
      BuildContext context,
      String code,
      String name,
      int credit,
      int lecture_hours,
      int tutorial_hours,
      int practical_hours,
      int discussion_hours,
      int project_hours,
      String pre_requisits,
      String syllabus,
      String ref_books,
      int percent_course_attendance,
      int percent_endsem,
      int percent_midsem,
      int percent_project,
      int percent_quiz_1,
      int percent_quiz_2,
      int percent_lab_evaluation,
      String proposedby,
      String status) async {
    var url =
        'https://script.google.com/macros/s/AKfycbzp1LzaPD6F_MJYyk-nCUY64GhyhkKjuOOwi5nj6pyt2wqlOWMavmoB-6V0As-RDj-u/exec';

    var url1 =
        'https://script.google.com/macros/s/AKfycbw0oi0VyhdlZ97ENHdUW8iQXNjpZZ4Yb42fl0sIbCFLED3tygO7aRM6VX_02afff6ImNg/exec';

    var body = {'code': code, 'name': name, 'credit': credit};

    var body1 = {
      'code': code,
      'name': name,
      'credit': credit,
      'lecture_hours': lecture_hours,
      'tutorial_hours': tutorial_hours,
      'practical_hours': practical_hours,
      'discussion_hours': discussion_hours,
      'project_hours': project_hours,
      'pre_requisites': pre_requisits,
      'syllabus': syllabus,
      'ref_books': ref_books,
      'percent_course_attendance': percent_course_attendance,
      'percent_endsem': percent_endsem,
      'percent_midsem': percent_midsem,
      'percent_project': percent_project,
      'percent_quiz_1': percent_quiz_1,
      'percent_quiz_2': percent_quiz_2,
      'percent_lab_evaluation': percent_lab_evaluation,
      'proposedby': proposedby,
      'status': status
    };

    var response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(body));

    var response1 = await http.post(Uri.parse(url1),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(body1));

    if (response.statusCode == 200 && response1.statusCode == 200) {
      print('Data sent successfully');
      print('Response: ${response.body}');
      _showSnackbar(context, 'Course Approved successfully');
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  }

  @override
  void initState() {
    super.initState();
    table = widget.data?['table'];
    rows = table?['rows'];
    columns = table?['columns'];
    _dashboardController = StreamController();
    dashboardService = DashboardService();
    _profileController = StreamController();
    profileService = ProfileService();
    getData();
  }

  getData() async {
    try {
      Response response = await dashboardService.getDashboard();
      Response response2 = await profileService.getProfile();
      setState(() {
        data = DashboardData.fromJson(jsonDecode(response.body));
        data2 = ProfileData.fromJson(jsonDecode(response2.body));
        _loading = false;
      });
      name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
      studentType = data2.profile!['department']!['name'] +
          '  ' +
          data2.profile!['user_type'];
      userType = data2.profile!['user_type'];
      print("this is name: $name");
      print("this is UserType: $userType");
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _dashboardController.add(res);
      _profileController.add(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(rows[18][1]);
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //Component to lay table on the page
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                DataTable(
                  // headingRowColor:
                  //     MaterialStateColor.resolveWith((states) => Colors.blue),
                  // dataRowHeight: 80,
                  columnSpacing: 25.0,
                  columns: tabColumnList(),
                  rows: tabRowList(),
                ),
                Visibility(
                  visible: (userType != 'student' && rows[18][1] == name),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context,
                          '/programme_curriculum_home/coursesProposalUpdate_form',
                          arguments: {'e': rows})
                    },
                    child: Text('Update'),
                  ),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: (userType != 'student' && rows[18][1] == name),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context,
                          '/programme_curriculum_home/coursesProposalApprove_form',
                          arguments: {'e': rows})
                    },
                    child: Text('Approve'),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          )),
    );
  }

  List<DataColumn> tabColumnList() {
    //Get the list of json and map through, to select each json and lay row to the table..

    List<DataColumn> data = [];
    data = columns
        .map(
          (el) {
            return DataColumn(
                label: Text(el.toString().toUpperCase(),
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)));
          },
        )
        .toList()
        .cast<DataColumn>();
    return data;
  }

  List<DataRow> tabRowList() {
    //Get the list of json and map through, to select each json and lay row to the table..
    List<DataRow> data = [];
    data = rows
        .map(
          (el) {
            return DataRow(
              cells: el
                  .map((e) => DataCell(GestureDetector(
                        onTap: () => {
                          // Navigator.pushNamed(context,
                          //     '/programme_curriculum_home/programme_info',
                          //     arguments: {'e': e})
                        },
                        child: Container(
                            //SET width
                            // constraints: BoxConstraints(maxWidth: 180),
                            child: Text(e.toString())),
                      )))
                  .toList()
                  .cast<DataCell>(),
            );
          },
        )
        .toList()
        .cast<DataRow>();
    return data;
  }
}
