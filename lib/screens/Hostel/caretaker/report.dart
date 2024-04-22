
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class Student {
  final String name;
  final int rollNumber;
  bool isPresent;

  Student({
    required this.name,
    required this.rollNumber,
    this.isPresent = false,
  });
}

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late DateTime selectedDate;
  late List<Student> students;
  late List<Student> filteredStudents;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _fetchStudentDetails();
  }

  Future<void> _fetchStudentDetails() async {
    // Simulating fetching student data from an API
    final String studentData = '''
    [
      {"name": "John Doe", "rollNumber": 101},
      {"name": "Alice Smith", "rollNumber": 102},
      {"name": "Bob Johnson", "rollNumber": 103}
    ]
    ''';
    final List<dynamic> studentList = json.decode(studentData);
    setState(() {
      students = studentList.map((student) => Student(
        name: student['name'],
        rollNumber: student['rollNumber'],
      )).toList();
      filteredStudents = List.from(students);
    });
  }

  void _searchStudents(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredStudents = List.from(students);
      } else {
        filteredStudents = students
            .where((student) =>
        student.name.toLowerCase().contains(query.toLowerCase()) ||
            student.rollNumber.toString().contains(query))
            .toList();
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      selectableDayPredicate: (DateTime date) {
        // Allow only past dates to be selected
        return date.isBefore(DateTime.now());
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Report'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      'Selected Date: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: StudentSearchDelegate(students: students),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    filteredStudents[index].name,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    'Roll No: ${filteredStudents[index].rollNumber}',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: IconButton(
                    icon: filteredStudents[index].isPresent
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        filteredStudents[index].isPresent =
                        !filteredStudents[index].isPresent;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StudentSearchDelegate extends SearchDelegate<Student?> {
  final List<Student> students;

  StudentSearchDelegate({required this.students});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: theme.primaryColor),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(students[index].name),
          subtitle: Text('Roll No: ${students[index].rollNumber}'),
          onTap: () {
            close(context, students[index]);
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Report(),
  ));
}