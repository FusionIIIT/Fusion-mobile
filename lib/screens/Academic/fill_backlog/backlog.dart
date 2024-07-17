import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';

class FillBacklog extends StatefulWidget {
  @override
  _FillBacklogState createState() => _FillBacklogState();
}

class _FillBacklogState extends State<FillBacklog> {
  int index = 0;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> backlogCourses = [];

  @override
  void initState() {
    super.initState();
    backlogCourses = service.academicData.backlogCourseList ?? [];
  }

// final appBarServices _appBarServices = appBarServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Backlog Courses",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: DataTable(
                  columnSpacing: 10, // Adjust spacing between columns
                  columns: [
                    DataColumn(label: Text('Course Name')),
                    DataColumn(label: Text('Course Code')),
                    DataColumn(label: Text('Version')),
                    DataColumn(label: Text('Credit')),
                    DataColumn(label: Text('Grade')),
                  ],
                  rows: backlogCourses.map((data) {
                    return DataRow(cells: [
                      DataCell(Text(data['course_name'].toString())),
                      DataCell(Text(data['course_code'].toString())),
                      DataCell(Text(data['course_version'].toString())),
                      DataCell(Text(data['course_credit'].toString())),
                      DataCell(Text(data['course_grade'].toString())),
                    ]);
                  }).toList(),
                ),
              ),
              backlogCourses.length == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 130, vertical: 30),
                      child: Text("No backlog courses!"))
                  : SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
