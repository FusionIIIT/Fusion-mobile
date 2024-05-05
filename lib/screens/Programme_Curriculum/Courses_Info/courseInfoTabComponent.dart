import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/dashboard.dart';
import 'package:fusion/services/dashboard_service.dart';
import 'package:http/http.dart';

class CourseInfoTabComponent extends StatefulWidget {
  final data;
  const CourseInfoTabComponent({Key? key, this.data}) : super(key: key);

  @override
  _CourseInfoTabComponentState createState() => _CourseInfoTabComponentState();
}

class _CourseInfoTabComponentState extends State<CourseInfoTabComponent> {
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
                  visible: userType != 'student',
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(
                          context, '/programme_curriculum_home/courses_update',
                          arguments: {'e': rows})
                    },
                    child: Text('Update'),
                  ),
                ),
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
