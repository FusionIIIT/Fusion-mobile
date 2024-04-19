import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';

class AlumniDetails extends StatefulWidget {
  @override
  _AlumniDetailsState createState() => _AlumniDetailsState();
}

class _AlumniDetailsState extends State<AlumniDetails>
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
    _tabController.index = 0; 
  }

  void _handleTabSelection() {
    setState(() {
      selectedDepartment = departmentOptions[_tabController.index];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 16),
          Container(
            color: kPrimaryColor, 
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor:
                  Colors.white, 
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
                        columns: [
                          DataColumn(
                            label: Text('ID',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('Alumni Name',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('Sex',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('Date of Birth',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('Address',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('Phone Number',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
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
    );
  }
}
