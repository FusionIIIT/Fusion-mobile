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
  Map<int, int> final_choices = {};
  int index = -1;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  String user = "";
  List<Map<String, dynamic>> finalCourses = [];
  Map<int, int> indexes = {};

  List<dynamic> pre_registered_courses_show = [];

  @override
  void initState() {
    super.initState();
    academicService = AcademicService();
    getAssignedCourses();
    pre_registered_courses_show =
        service.academicData.pre_registered_courses_show ?? [];
    print(pre_registered_courses_show);
  }

  addOneCourse(int courseId, int slotId, int semester, String user,
      BuildContext context) async {
    String heading = "";
    String body = "";
    try {
      Response response = await academicService.preRegAddOneCourse(
          courseId, slotId, semester, user);
      heading = 'Pre Registraion';
      body = jsonDecode(response.body)['message'];
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(heading),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print(e);
      heading = 'Error';
      body = 'Please Try Again!';
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(heading),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  handleSubmit() async {
    int sem = service.academicData.user_sem;
    for (var key in preferences.keys) {
      if (preferences[key] == "Choose") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Success!'),
            content: Text("Please select course for " + key.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return;
      }
    }
    print("regitered_courses: ");
    for (var ele in finalCourses) {
      for (var key in ele.keys) {
        print(key.toString() + " " + ele[key].toString());
      }
    }
    try {
      Response response =
          await academicService.preRegistration(sem, final_choices);
      service.updatePreFlag(finalCourses);
      setState(() {
        pre_registered_courses_show = finalCourses;
      });
      print(finalCourses);
      print(service.academicData.pre_registered_courses_show);
      print(service.academicData.pre_registration_flag);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success!'),
          content: Text((jsonDecode(response.body))["message"] ?? ""),
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
          title: const Text('Failure!'),
          content: const Text("Couldn't Perform Pre Registration"),
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
        preferences[courseList[i]['slot_name']] = "Choose";
        final_choices[courseList[i]['slot_id']] = 1;
        indexes[courseList[i]['slot_id']] = i;
        Map<String, dynamic> m1 = {};
        m1["slot_name"] = courseList[i]['slot_name'];
        m1["course_code"] = "";
        m1["course_name"] = "";
        m1["course_credit"] = courseList[i]['courses'][0]['credit'];
        m1["priority"] = 1;
        finalCourses.add(m1);
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
          : pre_registered_courses_show.length != 0
              ? Column(
                  children: [
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                      'Pre Registration completed!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
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
                                DataCell(
                                    Text(course['course_credit'].toString())),
                              ]);
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
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
                                courseNames.add('Choose');
                                Map<String, int> courseCodes = Map.fromIterable(
                                    courses,
                                    key: (item) => item['name'],
                                    value: (item) => item['course_id']);
                                Map<String, String> courseIds =
                                    Map.fromIterable(courses,
                                        key: (item) => item['name'],
                                        value: (item) => item['course_code']);

                                return DataRow(cells: [
                                  DataCell(Text(data['slot_name'].toString())),
                                  DataCell(Text(data['slot_type'].toString())),
                                  DataCell(Text(data['semester'].toString())),
                                  DataCell(Text(
                                      data['courses'][0]['credit'].toString())),
                                  DataCell(DropdownButton<String>(
                                    value: preferences[data['slot_name']],
                                    onChanged: preferences[data['slot_name']] !=
                                            "Choose"
                                        ? null
                                        : (String? newValue) {
                                            setState(() {
                                              if (newValue != "Choose") {
                                                preferences[data['slot_name']] =
                                                    newValue;
                                                final_choices[data['slot_id']] =
                                                    courseCodes[newValue] ?? 1;
                                                addOneCourse(
                                                    courseCodes[newValue] ?? 1,
                                                    data['slot_id'],
                                                    data['semester'],
                                                    user,
                                                    context);
                                                finalCourses[indexes[
                                                            data['slot_id']] ??
                                                        1]['course_code'] =
                                                    courseIds[newValue] ?? "1";
                                                ;
                                                finalCourses[indexes[
                                                            data['slot_id']] ??
                                                        1]['course_name'] =
                                                    newValue;
                                              }
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
                                handleSubmit();
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
