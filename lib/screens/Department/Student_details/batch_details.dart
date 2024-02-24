import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

void main() async {
  Map<String, dynamic>? jsonResponse = await fetchData();
  runApp(BatchDetailsScreen(jsonResponse: jsonResponse));
}

Future<Map<String, dynamic>?> fetchData() async {
  // Implement your logic to fetch data

  // final response = await http.get('your_api_endpoint');
  // if (response.statusCode == 200) {
  //   return json.decode(response.body);
  // } else {
  //   throw Exception('Failed to load data');
  // }
  return null; // Replace this with actual fetched data
}

class BatchDetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? jsonResponse;
  BatchDetailsScreen({required this.jsonResponse});

  @override
  _BatchDetailsScreenState createState() => _BatchDetailsScreenState();
}

class _BatchDetailsScreenState extends State<BatchDetailsScreen>
    with SingleTickerProviderStateMixin {
  ProfileData? data;
  late TabController _tabController;

  List<Map<String, String>> batchDetails = [];

  Future<void> fetchBatchDetails() async {
    // Your existing fetchBatchDetails logic
  }

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    data = service.profileData;

    _tabController = TabController(
      length: _calculateTabCount(),
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 0; // Initialize the index
    fetchBatchDetails();
  }

  int _calculateTabCount() {
    // Logic to determine the number of tabs based on the JSON response
    int tabCount = 0;
    String programme = widget.jsonResponse!['programme'];
    if (programme == 'PhD') {
      tabCount = 1;
    } else if (programme == 'M.Tech') {
      tabCount = 2;
    } else if (programme == 'B.Tech') {
      tabCount = 4;
    }
    return tabCount;
  }

  void _handleTabSelection() {
    // You can perform actions when a tab is selected if needed
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Students',
            style: TextStyle(fontSize: 25, color: Colors.grey),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            controller: _tabController,
            tabs: _buildTabs(),
          ),
        ),
        drawer: SideDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 84, 83, 83)),
                          columns: [
                            DataColumn(
                              label: Text('ID',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Batch Name',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Start Date',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('End Date',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('Programme',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                          rows: batchDetails
                              .map(
                                (batch) => DataRow(
                                  cells: [
                                    DataCell(Text(batch['ID']!)),
                                    DataCell(Text(batch['Batch Name']!)),
                                    DataCell(Text(batch['Start Date']!)),
                                    DataCell(Text(batch['End Date']!)),
                                    DataCell(Text(batch['Programme']!)),
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

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];
    String programme = widget.jsonResponse!['programme'];
    String department = widget.jsonResponse!['department'];

    if (programme == 'PhD') {
      tabs.add(Tab(
        child: Text(
          'PhD $department',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ));
    } else if (programme == 'M.Tech') {
      tabs.add(Tab(
        child: Text(
          'M.Tech 1st Year',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'M.Tech 2nd Year',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ));
    } else if (programme == 'B.Tech') {
      tabs.add(Tab(
        child: Text(
          'B.Tech 1st Year',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'B.Tech 2nd Year',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'B.Tech 3rd Year',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'B.Tech 4th Year',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ));
    }
    return tabs;
  }
}
