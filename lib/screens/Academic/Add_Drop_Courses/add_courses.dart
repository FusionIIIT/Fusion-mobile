import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

class Course {
  String id;
  String name;
  int credits;
  int priority;

  Course(
      {required this.id,
      required this.name,
      required this.credits,
      required this.priority});
}

class AddCourses extends StatefulWidget {
  @override
  _AddCoursesState createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  final List<Course> courses = List.generate(
      9,
      (index) => Course(
            id: 'ID ${index + 1}',
            name: 'Course ${index + 1}',
            credits: (index + 1) * 3,
            priority: 1,
          )); // Generate 9 courses with different details
  List<int> priorities =
      List.generate(9, (index) => index + 1); // List of priorities from 1 to 9
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

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
                      ],
                      rows: courses.map((course) {
                        return DataRow(cells: [
                          DataCell(Text(course.id)),
                          DataCell(Text(course.name)),
                          DataCell(Text(course.credits.toString())),
                          DataCell(DropdownButton<int>(
                            value: course.priority,
                            onChanged: (int? newValue) {
                              setState(() {
                                course.priority = newValue!;
                              });
                            },
                            items: priorities.map((int priority) {
                              return DropdownMenuItem<int>(
                                value: priority,
                                child: Text(priority.toString()),
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
