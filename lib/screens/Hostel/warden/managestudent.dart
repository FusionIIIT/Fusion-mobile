//All the 4 functionalities like add new student,edit existing student details,delete a student,search a student
// by his/her name via search bar are all perfectly working in this code.No need further debugging except to integrate API's.

import 'dart:convert';
import 'package:flutter/material.dart';



class Student {
  final String rollNo;
  String name;
  int batch;
  String program;
  String specialization;
  String hallNo;
  String roomNo;
  String contactNo;
  String address;

  Student({
    required this.rollNo,
    required this.name,
    required this.batch,
    required this.program,
    required this.specialization,
    required this.hallNo,
    required this.roomNo,
    required this.contactNo,
    required this.address,
  });
}

class Managestudent extends StatefulWidget {
  const Managestudent({Key? key}) : super(key: key);

  @override
  _ManagestudentState createState() => _ManagestudentState();
}

class _ManagestudentState extends State<Managestudent> {
  List<Student> students = [];
  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _fetchStudentDetails();
  }

  Future<void> _fetchStudentDetails() async {
    // Simulating GET API call to fetch student details
    final String studentData = '''
    [
      {"rollNo": "21bcs001", "name": "Rahul", "batch": 2021, "program": "B.Tech", "specialization": "CSE", "hallNo": "Hall-4", "roomNo": "G-31", "contactNo": "+911234567890", "address": "Address 1, City 1, State 1, Country 1"},
      {"rollNo": "21bme002", "name": "Kiran", "batch": 2021, "program": "B.Tech", "specialization": "MEE", "hallNo": "Hall-4", "roomNo": "F-24", "contactNo": "+919876543210", "address": "Address 2, City 2, State 2, Country 2"},
      {"rollNo": "21bcs003", "name": "Amit", "batch": 2021, "program": "B.Tech", "specialization": "CSE", "hallNo": "Hall-4", "roomNo": "S-12", "contactNo": "+914561237890", "address": "Address 3, City 3, State 3, Country 3"},
      {"rollNo": "21sm004", "name": "Kunal", "batch": 2021, "program": "B.Tech", "specialization": "SM", "hallNo": "Hall-4", "roomNo": "G-31", "contactNo": "+911234567890", "address": "Address 4, City 4, State 4, Country 4"},
      {"rollNo": "21bcs005", "name": "Vishal", "batch": 2021, "program": "B.Tech", "specialization": "CSE", "hallNo": "Hall-4", "roomNo": "F-24", "contactNo": "+919876543210", "address": "Address 5, City 5, State 5, Country 5"},
      {"rollNo": "23me116", "name": "Divyanshu", "batch": 2023, "program": "B.Tech", "specialization": "ME", "hallNo": "Hall-4", "roomNo": "S-12", "contactNo": "+914561237890", "address": "Address 6, City 6, State 6, Country 6"},
      {"rollNo": "23bec117", "name": "Raj", "batch": 2023, "program": "B.Tech", "specialization": "ECE", "hallNo": "Hall-4", "roomNo": "G-31", "contactNo": "+911234567890", "address": "Address 7, City 7, State 7, Country 7"},
      {"rollNo": "23bds118", "name": "Anurag", "batch": 2023, "program": "B.Des", "specialization": "DS", "hallNo": "Hall-4", "roomNo": "F-24", "contactNo": "+919876543210", "address": "Address 8, City 8, State 8, Country 8"}
    ]
    ''';
    final List<dynamic> studentList = json.decode(studentData);
    setState(() {
      students = studentList.map((student) => Student(
        rollNo: student['rollNo'],
        name: student['name'],
        batch: student['batch'],
        program: student['program'],
        specialization: student['specialization'],
        hallNo: student['hallNo'],
        roomNo: student['roomNo'],
        contactNo: student['contactNo'],
        address: student['address'],
      )).toList();
      filteredStudents = List.from(students);
    });
  }

  Future<void> _editStudentDetails(Student student) async {
    // Display dialog to edit student details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = student.name;
        int batch = student.batch;
        String program = student.program;
        String specialization = student.specialization;
        String hallNo = student.hallNo;
        String roomNo = student.roomNo;
        String contactNo = student.contactNo;
        String address = student.address;

        return AlertDialog(
          title: Text('Edit Student Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: TextEditingController(text: name),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Batch'),
                  controller: TextEditingController(text: batch.toString()),
                  onChanged: (value) {
                    batch = int.tryParse(value) ?? 0;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Program'),
                  controller: TextEditingController(text: program),
                  onChanged: (value) {
                    program = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Specialization'),
                  controller: TextEditingController(text: specialization),
                  onChanged: (value) {
                    specialization = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Hall No'),
                  controller: TextEditingController(text: hallNo),
                  onChanged: (value) {
                    hallNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Room No'),
                  controller: TextEditingController(text: roomNo),
                  onChanged: (value) {
                    roomNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Contact No'),
                  controller: TextEditingController(text: contactNo),
                  onChanged: (value) {
                    contactNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Address'),
                  controller: TextEditingController(text: address),
                  onChanged: (value) {
                    address = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform the edit operation here
                setState(() {
                  student.name = name;
                  student.batch = batch;
                  student.program = program;
                  student.specialization = specialization;
                  student.hallNo = hallNo;
                  student.roomNo = roomNo;
                  student.contactNo = contactNo;
                  student.address = address;
                });
                // Simulate POST API call to update student details
                // _updateStudentDetails(student);
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteStudentDetails(Student student) async {
    // Show confirmation dialog before deleting the student
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this student?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Delete the student
                _deleteStudent(student);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteStudent(Student student) {
    setState(() {
      students.remove(student);
      filteredStudents.remove(student);
    });
    // Simulate DELETE API call to delete student details
    // _invokeDeleteAPI(student.rollNo);
  }

  Future<void> _showAddDialog() async {
    String rollNo = '';
    String name = '';
    int batch = 0;
    String program = '';
    String specialization = '';
    String hallNo = '';
    String roomNo = '';
    String contactNo = '';
    String address = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Student'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Roll No'),
                  onChanged: (value) {
                    rollNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Batch'),
                  onChanged: (value) {
                    batch = int.tryParse(value) ?? 0;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Program'),
                  onChanged: (value) {
                    program = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Specialization'),
                  onChanged: (value) {
                    specialization = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Hall No'),
                  onChanged: (value) {
                    hallNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Room No'),
                  onChanged: (value) {
                    roomNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Contact No'),
                  onChanged: (value) {
                    contactNo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Address'),
                  onChanged: (value) {
                    address = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform the add operation here
                setState(() {
                  final newStudent = Student(
                    rollNo: rollNo,
                    name: name,
                    batch: batch,
                    program: program,
                    specialization: specialization,
                    hallNo: hallNo,
                    roomNo: roomNo,
                    contactNo: contactNo,
                    address: address,
                  );
                  students.add(newStudent);
                  filteredStudents.add(newStudent);
                });
                // Simulate POST API call to add new student details
                // _addStudentDetails(rollNo, name, batch, program, specialization, hallNo, roomNo, contactNo, address);
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _searchStudents(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredStudents = students.where((student) {
          return student.rollNo.contains(query) || student.name.contains(query);
        }).toList();
      } else {
        filteredStudents = List.from(students);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Students'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? result = await showSearch<String?>(
                context: context,
                delegate: StudentSearchDelegate(students: students),
              );
              if (result != null) {
                _searchStudents(result);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Roll No')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Batch')),
            DataColumn(label: Text('Program')),
            DataColumn(label: Text('Specialization')),
            DataColumn(label: Text('Hall No')),
            DataColumn(label: Text('Room No')),
            DataColumn(label: Text('Contact No')),
            DataColumn(label: Text('Address')),
            DataColumn(label: Text('Edit')),
            DataColumn(label: Text('Remove')),
          ],
          rows: List<DataRow>.generate(
            filteredStudents.length,
                (index) => DataRow(
              cells: <DataCell>[
                DataCell(Text(filteredStudents[index].rollNo)),
                DataCell(Text(filteredStudents[index].name)),
                DataCell(Text(filteredStudents[index].batch.toString())),
                DataCell(Text(filteredStudents[index].program)),
                DataCell(Text(filteredStudents[index].specialization)),
                DataCell(Text(filteredStudents[index].hallNo)),
                DataCell(Text(filteredStudents[index].roomNo)),
                DataCell(Text(filteredStudents[index].contactNo)),
                DataCell(Text(filteredStudents[index].address)),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editStudentDetails(filteredStudents[index]);
                    },
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteStudentDetails(filteredStudents[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
      ),
    );
  }
}

class StudentSearchDelegate extends SearchDelegate<String?> {
  final List<Student> students;

  StudentSearchDelegate({required this.students});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.scaffoldBackgroundColor, // Match with screen's UI theme
        iconTheme: IconThemeData(color: theme.primaryColor), // Match with screen's UI theme
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
    final List<Student> filteredStudents = students.where((student) {
      final String lowercaseQuery = query.toLowerCase();
      return student.rollNo.toLowerCase().contains(lowercaseQuery) || student.name.toLowerCase().contains(lowercaseQuery);
    }).toList();
    return ListView.builder(
      itemCount: filteredStudents.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredStudents[index].name),
          subtitle: Text(filteredStudents[index].rollNo),
          onTap: () {
            close(context, filteredStudents[index].rollNo);
          },
        );
      },
    );
  }
}



void main() {
  runApp(MaterialApp(
    home: Managestudent(),
  ));
}
