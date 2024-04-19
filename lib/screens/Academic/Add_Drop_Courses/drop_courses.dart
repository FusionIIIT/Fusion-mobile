import 'package:flutter/material.dart';
class Course {
  String id;
  String name;
  int credits;
  int priority;

  Course({required this.id, required this.name, required this.credits, required this.priority});
}

class AddDropCourses extends StatefulWidget {
  @override
  _AddDropCoursesState createState() => _AddDropCoursesState();
}

class _AddDropCoursesState extends State<AddDropCourses> {
  final List<Course> courses = List.generate(9, (index) => Course(
    id: 'ID ${index + 1}',
    name: 'Course ${index + 1}',
    credits: (index + 1) * 3,
    priority: 1,
  )); // Generate 9 courses with different details
  List<int> priorities = List.generate(9, (index) => index + 1); // List of priorities from 1 to 9

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Setting background color of app bar
        title: Text(
          'Add Courses',
          style: TextStyle(color: Colors.white), // Setting text color to white
        ),
      ),
      body: SingleChildScrollView(
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
            SizedBox(height: 20), // Adding spacing between table and submit button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange[900]), // Setting background color of button to blue
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Add Courses',
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Adding spacing between submit button and bottom
          ],
        ),
      ),
    );
  }
}

