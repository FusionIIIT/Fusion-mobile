import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

// import 'package:fusion/Components/side_drawer.dart';
class PreRegistration extends StatefulWidget {
  @override
  _PreRegistrationState createState() => _PreRegistrationState();
}

class _PreRegistrationState extends State<PreRegistration> {
  bool _loading1 = true;
  late AcademicService academicService;
  List<dynamic> courseList = [];
  Map<String, String?> preferences = {};
  Map<String, String> slot_codes = {};
  int index = -1;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  String user = "";

  @override
  void initState() {
    super.initState();
    academicService = AcademicService();
    getAssignedCourses();
    print("acad");
    print(service.academicData.pre_registration_date_flag);
  }

  addOneCourse(int courseId, int slotId, int semester, String user,
      BuildContext context) async {
    try {
      Response response = await academicService.preRegAddOneCourse(
          courseId, slotId, semester, user);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Pre Registraion'),
          content: Text(jsonDecode(response.body)['message']),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please Try Again!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      print(e);
    }
  }

  getAssignedCourses() async {
    try {
      Response response = await academicService.getRegistrationCourses();
      var details = jsonDecode(response.body)['details'];
      var current_user = details['current_user'];
      user = current_user['username'];
      courseList = jsonDecode(response.body)['next_sem_registration_courses'];
      for (var i = 0; i < courseList.length; i++) {
        preferences[courseList[i]['slot_name']] =
            courseList[i]['courses'][0]['name'].toString();
      }
      setState(() {
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Pre Registration",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: _loading1 == true
          ? Center(child: CircularProgressIndicator())
          : service.academicData.pre_registration_date_flag == false
              ? Center(
                  child: Text(
                  'Pre Registration has not started yet!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // const Center(
                      //   child: Dialog(),
                      // ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Slot Name')),
                            DataColumn(label: Text('Slot Type')),
                            DataColumn(label: Text('Semester')),
                            DataColumn(label: Text('Credits')),
                            DataColumn(label: Text('Select')),
                          ],
                          rows: courseList.map((data) {
                            index++;
                            final courses = data['courses'] as List;
                            // Use a map function to get the 'name' property from each course object
                            List<String> courseNames = courses
                                .map((course) => course['name'] as String)
                                .toList();
                            Map<String, int> courseCodes = Map.fromIterable(
                                courses,
                                key: (item) => item['name'],
                                value: (item) => item['course_id']);

                            return DataRow(cells: [
                              DataCell(Text(data['slot_name'].toString())),
                              DataCell(Text(data['slot_type'].toString())),
                              DataCell(Text(data['semester'].toString())),
                              DataCell(Text(
                                  data['courses'][0]['credit'].toString())),
                              DataCell(DropdownButton<String>(
                                value: preferences[data['slot_name']],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    addOneCourse(
                                        courseCodes[newValue] ?? 1,
                                        data['slot_id'],
                                        data['semester'],
                                        user,
                                        context);
                                    preferences[data['slot_name']] = newValue;
                                  });
                                },
                                items: courseNames.map((course) {
                                  return DropdownMenuItem<String>(
                                    value: course,
                                    child: Text(course),
                                  );
                                }).toList(),
                              )),
                            ]);
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Adding spacing between table and submit button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle submit action
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors
                                    .orange[
                                900]), // Setting background color of button to blue
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text('Submit',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Adding spacing between submit button and bottom
                    ],
                  ),
                ),
    );
  }
}

// class Dialog extends StatelessWidget {
//   const Dialog();

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),
//       child: const Text('Show Dialog'),
//     );
//   }
// }







// class _PreRegistrationState extends State<PreRegistration> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 20),
//           Text('Pre-Registration for Next Sem Courses'),
//           Expanded(
//               child: Center(
//                   child: Text(
//             "Pre Registration date hasn't come yet",
//             style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//           )))
//         ],
//       ),
//     );
//   }
// }
