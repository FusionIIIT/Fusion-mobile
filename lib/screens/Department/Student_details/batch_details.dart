import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class BatchDetailsScreen extends StatefulWidget {
  // final Map<String, dynamic>? jsonResponse;
  final String selectedProgramme;
  BatchDetailsScreen({required this.selectedProgramme});

  @override
  _BatchDetailsScreenState createState() => _BatchDetailsScreenState();
}

class _BatchDetailsScreenState extends State<BatchDetailsScreen>
    with SingleTickerProviderStateMixin {
  ProfileData? data;
  late TabController _tabController;

  List<Map<String, String>> batchDetails = [];

  // Future<void> fetchBatchDetails() async {
  //   // Your existing fetchBatchDetails logic
  // }

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
    // fetchBatchDetails();
  }

  int _calculateTabCount() {
    int tabCount = 0;
    String programme = widget.selectedProgramme;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Students',
          style: TextStyle(fontSize: 25, color: Colors.white),
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
        bottom: TabBar(
          isScrollable: true,
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
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text('ID',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('BATCH',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('START DATE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('END DATE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('PROGRAMME',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                        ],
                        rows: batchDetails
                            .map(
                              (batch) => DataRow(
                                cells: [
                                  DataCell(Text(batch['ID'] ?? '')),
                                  DataCell(Text(batch['Batch Name'] ?? '')),
                                  DataCell(Text(batch['Start Date'] ?? '')),
                                  DataCell(Text(batch['End Date'] ?? '')),
                                  DataCell(Text(batch['Programme'] ?? '')),
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

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];
    // String programme = widget.jsonResponse!['programme'];
    // String department = widget.jsonResponse!['department'];
    String programme = widget.selectedProgramme;

    if (programme == 'PhD') {
      tabs.add(Tab(
        child: Text(
          '${widget.selectedProgramme}  ',
        ),
      ));
    } else if (programme == 'M.Tech') {
      tabs.add(Tab(
        child: Text(
          'M.Tech 1st Year',
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'M.Tech 2nd Year',
        ),
      ));
    } else if (programme == 'B.Tech') {
      tabs.add(Tab(
        child: Text(
          'B.Tech 1st Year',
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'B.Tech 2nd Year',
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'B.Tech 3rd Year',
        ),
      ));
      tabs.add(Tab(
        child: Text(
          'B.Tech 4th Year',
        ),
      ));
    }
    return tabs;
  }
}
