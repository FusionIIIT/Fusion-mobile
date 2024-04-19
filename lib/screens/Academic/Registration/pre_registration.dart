import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:http/http.dart';

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
  int index = -1;

  @override
  void initState() {
    super.initState();
    academicService = AcademicService();
    getAssignedCourses();
  }

  getAssignedCourses() async {
    try {
      Response response = await academicService.getRegistrationCourses();
      setState(() {
        courseList = jsonDecode(response.body)['next_sem_registration_courses'];
        for (var i = 0; i < courseList.length; i++) {
          preferences[courseList[i]['slot_name']] =
              courseList[i]['courses'][0]['name'].toString();
        }
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Setting background color of app bar
        title: Text(
          'Pre Registration',
          style: TextStyle(color: Colors.white), // Setting text color to white
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _loading1 == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
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
