// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

void main() {
  runApp(AlumniDetailsScreen());
}

class AlumniDetailsScreen extends StatefulWidget {
  @override
  _AlumniDetailsState createState() => _AlumniDetailsState();
}

class _AlumniDetailsState extends State<AlumniDetailsScreen>
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

  List<Map<String, String>> alumniDetails = [];

  //API section
  // Future<void> fetchAlumniDetails() async {
  //   final response = await http.get(
  //     Uri.parse('https://your-django-api-endpoint/alumni-details'),
  //   );

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);

  //     setState(() {
  //       alumniDetails.clear();
  //       for (final Map<String, dynamic> alumni in data) {
  //         alumniDetails.add({
  //           'ID': alumni['id'].toString(),
  //           'Alumni Name': alumni['name'],
  //           'Sex': alumni['sex'],
  //           'Date of Birth': alumni['date_of_birth'],
  //           'Address': alumni['address'],
  //           'Phone Number': alumni['phone_no'],
  //         });
  //       }
  //     });
  //   } else {
  //     throw Exception('Failed to load alumni details');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: departmentOptions.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 0; // Initialize the index
    // fetchAlumnniDetails();
  }

  void _handleTabSelection() {
    setState(() {
      selectedDepartment = departmentOptions[_tabController.index];
      // fetchAlumniDetails();
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
                              label: Text('Alumni Name',
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
                          rows: alumniDetails
                              .map(
                                (batch) => DataRow(
                                  cells: [
                                    DataCell(Text(batch['ID']!)),
                                    DataCell(Text(batch['Alumni Name']!)),
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
