import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';

class ViewRegistration extends StatefulWidget {
  final List? data;
  const ViewRegistration({Key? key, this.data}) : super(key: key);

  @override
  _ViewRegistrationState createState() => _ViewRegistrationState();
}

class _ViewRegistrationState extends State<ViewRegistration> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> pre_registered_courses_show = [];

  @override
  void initState() {
    super.initState();
    pre_registered_courses_show =
        service.academicData.pre_registered_courses_show ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Registered Courses",
        // overflow: TextOverflow.ellipsis,
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: pre_registered_courses_show.length == 0
          ? Center(
              child: Text(
              'Registration not done yet!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ))
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text("Slot Name"),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text("Course Name"),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text("Course Code"),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text("Credits"),
                            numeric: false,
                          ),
                        ],
                        rows: pre_registered_courses_show.map((course) {
                          return DataRow(cells: [
                            DataCell(Text(course['slot_name'])),
                            DataCell(Text(course['course_name'])),
                            DataCell(Text(course['course_code'])),
                            DataCell(Text(course['course_credit'].toString())),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
