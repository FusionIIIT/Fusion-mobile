import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:http/http.dart';

class AddCourses extends StatefulWidget {
  @override
  _AddCoursesState createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  var service = locator<StorageService>();
  late AcademicService academicService;
  late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> addCouresOptions = [];
  int index = -1;
  Map<String, String?> preferences = {};
  Map<int, int> preferences2 = {};

  @override
  void initState() {
    super.initState();
    addCouresOptions = service.academicData.add_courses_options ?? [];
    academicService = AcademicService();
    print(addCouresOptions);
    for (var i = 0; i < addCouresOptions.length; i++) {
      preferences[addCouresOptions[i]['slot_name']] = "Choose";
      preferences2[addCouresOptions[i]['slot_id']] = 0;
    }
  }

  handleSubmit() async {
    int sem = service.academicData.user_sem;
    Map<int, int> finalChoices = {};
    int ct = 0;
    for (var key in preferences2.keys) {
      if (preferences2[key] != 0) {
        print(key.toString() + " " + preferences2[key].toString());
        finalChoices[key] = preferences2[key] ?? 1;
        ct++;
      }
    }

    try {
      Response response =
          await academicService.addCourses(sem, ct, finalChoices);
      ;
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
          content: const Text("Couldn't Add Courses"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Add Courses",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: service.academicData.add_or_drop_course_date_flag == false
          ? Center(
              child: Text(
              'Add course date has not arrived yet!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Course ID')),
                        DataColumn(label: Text('Course Name')),
                        DataColumn(label: Text('Credits')),
                        DataColumn(label: Text('Priority')),
                        DataColumn(label: Text('Select')),
                      ],
                      rows: addCouresOptions.map((data) {
                        index++;
                        final courses = data['courses'] as List;
                        // Use a map function to get the 'name' property from each course object
                        List<String> courseNames = courses
                            .map((course) => course['name'] as String)
                            .toList();
                        courseNames.add('Choose');
                        Map<String, int> courseCodes = Map.fromIterable(courses,
                            key: (item) => item['name'],
                            value: (item) => item['course_id']);

                        return DataRow(cells: [
                          DataCell(Text(data['slot_name'].toString())),
                          DataCell(Text(data['slot_type'].toString())),
                          DataCell(Text(data['semester'].toString())),
                          DataCell(
                              Text(data['courses'][0]['credit'].toString())),
                          DataCell(DropdownButton<String>(
                            value: preferences[data['slot_name']],
                            onChanged: (String? newValue) {
                              setState(() {
                                preferences[data['slot_name']] = newValue;
                                preferences2[data['slot_id']] =
                                    courseCodes[newValue] ?? 0;
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
                        handleSubmit();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors
                                .orange[
                            900]), // Setting background color of button to blue
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Add Courses',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
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
