// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(FacultyDetailsScreen());
}

class FacultyDetailsScreen extends StatefulWidget {
  @override
  _FacultyDetailsState createState() => _FacultyDetailsState();
}

class _FacultyDetailsState extends State<FacultyDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> departmentOptions = [
    'CSE Department',
    'ECE Department',
    'ME Department',
    'SM Department'
  ];
  String selectedDepartment = 'CSE Department';
  Color outlineColor = Colors.grey;

  List<Map<String, String>> facultyDetails = [];

  //API section
  // Future<void> fetchFacultyDetails() async {
  //   final response = await http.get(
  //     Uri.parse('https://your-django-api-endpoint/faculty-details'),
  //   );

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);

  //     setState(() {
  //       facultyDetails.clear();
  //       for (final Map<String, dynamic> faculty in data) {
  //         facultyDetails.add({
  //           'ID': faculty['id'].toString(),
  //           'Faculty Name': faculty['name'],
  //           'Sex': faculty['sex'],
  //           'Date of Birth': faculty['date_of_birth'],
  //           'Address': faculty['address'],
  //           'Phone Number': faculty['phone_no'],
  //         });
  //       }
  //     });
  //   } else {
  //     throw Exception('Failed to load faculty details');
  //   }
  // }
  Future<void> fetchFacultyDetails() async {
    // Load CSV data from asset file based on selected department
    String departmentCSV;
    switch (selectedDepartment) {
      case 'CSE Department':
        departmentCSV = "db/cse_faculty.csv";
        break;
      case 'ECE Department':
        departmentCSV = "db/ece_faculty.csv";
        break;
      case 'ME Department':
        departmentCSV = "db/mech_faculty.csv";
        break;
      case 'SM Department':
        departmentCSV = "db/sm_faculty.csv";
        break;
      default:
        departmentCSV = "db/cse_faculty.csv";
    }

    String csvData = await rootBundle.loadString(departmentCSV);

    // Parse CSV data
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    // Convert CSV table to faculty details list
    List<Map<String, String>> facultyList = [];
    for (int i = 1; i < csvTable.length; i++) {
      facultyList.add({
        'ID': csvTable[i][0].toString(),
        'Faculty Name': csvTable[i][1].toString(),
        'Sex': csvTable[i][2].toString(),
        'Date of Birth': csvTable[i][3].toString(),
        'Address': csvTable[i][4].toString(),
        'Phone Number': csvTable[i][5].toString(),
        'Department': csvTable[i][6].toString(), // Add department information
      });
    }

    // Set faculty details
    setState(() {
      facultyDetails = facultyList;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: departmentOptions.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 0; // Initialize the index
    fetchFacultyDetails();
  }

  void _handleTabSelection() {
    setState(() {
      selectedDepartment = departmentOptions[_tabController.index];
      fetchFacultyDetails();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 16),
            Container(
              color: Colors.deepOrangeAccent, // Set background color here
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor:
                    Colors.white, // Set unselected font color here
                tabs: departmentOptions
                    .map((department) => Tab(
                          text: department,
                        ))
                    .toList(),
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.black),
                          columns: [
                            DataColumn(
                              label: Text('ID',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Faculty Name',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Sex',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Date of Birth',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Address',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Phone Number',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                          rows: facultyDetails
                              .map(
                                (batch) => DataRow(
                                  cells: [
                                    DataCell(Text(batch['ID']!)),
                                    DataCell(Text(batch['Faculty Name']!)),
                                    DataCell(Text(batch['Sex']!)),
                                    DataCell(Text(batch['Date of Birth']!)),
                                    DataCell(Text(batch['Address']!)),
                                    DataCell(Text(batch['Phone Number']!)),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
