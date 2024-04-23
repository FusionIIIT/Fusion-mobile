import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';

class Student {
  final String name;
  final String rollNumber;
  final double cpi;
  final String gender;
  final String branch;
  final String batch;

  Student({
    required this.name,
    required this.rollNumber,
    required this.cpi,
    required this.gender,
    required this.branch,
    required this.batch,
  });
}

class FilterStudents extends StatefulWidget {
  final List<Student> students = [
  Student(name:'Jayanth Prajapati', rollNumber:'20bcs137', batch:'2020', branch:'CSE', gender:'Male', cpi:8.5),
  Student(name:'Jahnavi Kaushal', rollNumber:'22bec234', batch:'2022', branch:'ECE', gender:'Female', cpi:9.0),
  Student(name:'Deekshith Ranjan', rollNumber:'21bcs104', batch:'2021', branch:'CSE', gender:'Male', cpi:7.5),
  Student(name:'Ankita Dvivedhi', rollNumber:'23bme034', batch:'2023', branch:'ME', gender:'Female', cpi:8.0),
  Student(name:'Anand', rollNumber:'21bcs001', batch:'2021', branch:'CSE', gender:'Male', cpi:8.1),
  Student(name:'Roopa', rollNumber:'21bcs002', batch:'2021', branch:'CSE', gender:'Female', cpi:8.5),
  Student(name:'Arjun', rollNumber:'21bcs003', batch:'2021', branch:'CSE', gender:'Male', cpi:8.5),
  Student(name:'Abhi', rollNumber:'23bcs002', batch:'2023', branch:'CSE', gender:'Male', cpi:8.2),
  Student(name:'Ram', rollNumber:'21bcs141', batch:'2021', branch:'CSE', gender:'Male', cpi:8.1),
  Student(name:'Vishnu Mishra', rollNumber:'21bcs165', batch:'2021', branch:'CSE', gender:'Male', cpi:8.1),
  Student(name:'Sita', rollNumber:'22bcs216', batch:'2022', branch:'CSE', gender:'Female', cpi:7.5),
  Student(name:'Vishnu Rajput', rollNumber:'22bcs165', batch:'2022', branch:'CSE', gender:'Male', cpi:8.1),
  Student(name:'Bruhath', rollNumber:'21bcs149', batch:'2021', branch:'CSE', gender:'Male', cpi:8.1),
  Student(name:'Ananya Patel', rollNumber:'21bcs150', batch:'2021', branch:'CSE', gender:'Female', cpi:9.2),
  Student(name:'Arnav Gupta', rollNumber:'21bcs151', batch:'2021', branch:'CSE', gender:'Male', cpi:8.7),
  Student(name:'Khushi Kumari', rollNumber:'22bcs152', batch:'2022', branch:'CSE', gender:'Female', cpi:8.5),
  Student(name:'Sahil Singh', rollNumber:'22bcs153', batch:'2022', branch:'CSE', gender:'Male', cpi:7.9),
  Student(name:'Neha Shah', rollNumber:'23bcs154', batch:'2023', branch:'CSE', gender:'Female', cpi:9.0),
  Student(name:'Aryan Reddy', rollNumber:'23bcs155', batch:'2023', branch:'CSE', gender:'Male', cpi:8.3),
  Student(name:'Deepika Singh', rollNumber:'21bec156', batch:'2021', branch:'ECE', gender:'Female', cpi:8.1),
  Student(name:'Aruna Sharma', rollNumber:'21bec157', batch:'2021', branch:'ECE', gender:'Female', cpi:7.5),
  Student(name:'Rohan Patel', rollNumber:'22bec158', batch:'2022', branch:'ECE', gender:'Male', cpi:8.8),
  Student(name:'Ananya Das', rollNumber:'22bec159', batch:'2022', branch:'ECE', gender:'Female', cpi:8.2),
  Student(name:'Neha Rao', rollNumber:'23bec160', batch:'2023', branch:'ECE', gender:'Female', cpi:8.7),
  Student(name:'Arnav Patel', rollNumber:'23bec161', batch:'2023', branch:'ECE', gender:'Male', cpi:8.6),
  Student(name:'Khushi Gupta', rollNumber:'21bme162', batch:'2021', branch:'ME', gender:'Female', cpi:8.0),
  Student(name:'Aryan Kumar', rollNumber:'21bme163', batch:'2021', branch:'ME', gender:'Male', cpi:7.8),
  Student(name:'Sahil Rao', rollNumber:'22bme164', batch:'2022', branch:'ME', gender:'Male', cpi:8.4),
  Student(name:'Ananya Mishra', rollNumber:'22bme165', batch:'2022', branch:'ME', gender:'Female', cpi:7.9),
  Student(name:'Arnav Iyer', rollNumber:'23bme166', batch:'2023', branch:'ME', gender:'Male', cpi:8.2),
  Student(name:'Khushi Singh', rollNumber:'23bme167', batch:'2023', branch:'ME', gender:'Female', cpi:8.3),
  Student(name:'Aditya Rao', rollNumber:'21bsm168', batch:'2021', branch:'SM', gender:'Male', cpi:8.2),
  Student(name:'Arun Mehra', rollNumber:'21bsm169', batch:'2021', branch:'SM', gender:'Male', cpi:7.6),
  Student(name:'Rajesh Chauhan', rollNumber:'22bsm170', batch:'2022', branch:'SM', gender:'Male', cpi:8.9),
  Student(name:'Karthik Menon', rollNumber:'22bsm171', batch:'2022', branch:'SM', gender:'Male', cpi:8.1),
  Student(name:'Priya Sharma', rollNumber:'23bsm172', batch:'2023', branch:'SM', gender:'Female', cpi:8.5),
  Student(name:'Meera Reddy', rollNumber:'23bsm173', batch:'2023', branch:'SM', gender:'Female', cpi:8.4),
  Student(name:'Ananya Tiwari', rollNumber:'20bcs174', batch:'2020', branch:'CSE', gender:'Female', cpi:8.6),
  Student(name:'Arnav Reddy', rollNumber:'20bcs175', batch:'2020', branch:'CSE', gender:'Male', cpi:8.2),
  Student(name:'Khushi Mehta', rollNumber:'20bec176', batch:'2020', branch:'ECE', gender:'Female', cpi:8.4),
  Student(name:'Sahil Tiwari', rollNumber:'20bec177', batch:'2020', branch:'ECE', gender:'Male', cpi:8.0),
  Student(name:'Neha Reddy', rollNumber:'20bme178', batch:'2020', branch:'ME', gender:'Female', cpi:8.3),
  Student(name:'Aryan Mehta', rollNumber:'20bme179', batch:'2020', branch:'ME', gender:'Male', cpi:7.9),
  Student(name:'Deepika Tiwari', rollNumber:'20bsm180', batch:'2020', branch:'SM', gender:'Female', cpi:8.1),
  Student(name:'Arun Reddy', rollNumber:'20bsm181', batch:'2020', branch:'SM', gender:'Male', cpi:8.5)
  ];

  @override
  _FilterStudentsState createState() => _FilterStudentsState();
}

class _FilterStudentsState extends State<FilterStudents> {
  double minCpi = 7.0;
  String selectedGender = "All";
  String selectedBranch = "All";
  String selectedBatch = "All";
  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    filteredStudents = widget.students; // Initially show all students
  }

  void applyFilters() {
    setState(() {
      filteredStudents = widget.students.where((student) =>
      student.cpi >= minCpi &&
          (selectedGender == "All" || student.gender == selectedGender) &&
          (selectedBranch == "All" || student.branch == selectedBranch) &&
          (selectedBatch == "All" || student.batch == selectedBatch)
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Students"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Minimum CPI : '),
            ),
            Slider(
              value: minCpi,
              min: 7.0,
              max: 10.0,
              divisions: 6,
              label: "Minimum CPI: ${minCpi.toStringAsFixed(1)}",
              onChanged: (value) => setState(() => minCpi = value),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Select Gender : '),
            ),
            DropdownButton<String>(
              value: selectedGender,
              items: [
                DropdownMenuItem(value: "All", child: Text("All")),
                DropdownMenuItem(value: "Male", child: Text("Male")),
                DropdownMenuItem(value: "Female", child: Text("Female")),
                DropdownMenuItem(value: "Other", child: Text("Other")),
              ],
              onChanged: (value) => setState(() => selectedGender = value!),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Select Branch : '),
            ),
            DropdownButton<String>(
              value: selectedBranch,
              items: [
                DropdownMenuItem(value: "All", child: Text("All")),
                DropdownMenuItem(value: "CSE", child: Text("CSE")),
                DropdownMenuItem(value: "ECE", child: Text("ECE")),
                DropdownMenuItem(value: "ME", child: Text("ME")),
                DropdownMenuItem(value: "SM", child: Text("SM")),
              ],
              onChanged: (value) => setState(() => selectedBranch = value!),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Select Batch : '),
            ),
            DropdownButton<String>(
              value: selectedBatch,
              items: [
                DropdownMenuItem(value: "All", child: Text("All")),
                DropdownMenuItem(value: "2020", child: Text("2020")),
                DropdownMenuItem(value: "2021", child: Text("2021")),
                DropdownMenuItem(value: "2022", child: Text("2022")),
                DropdownMenuItem(value: "2023", child: Text("2023")),
              ],
              onChanged: (value) => setState(() => selectedBatch = value!),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: applyFilters,
              child: Text("Apply Filters"),
            ),
            SizedBox(height: 20.0),
            filteredStudents.isEmpty
                ? Text("No students found matching your criteria.")
                : ListView.builder(
              shrinkWrap: true,
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                final student = filteredStudents[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text(student.rollNumber),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}