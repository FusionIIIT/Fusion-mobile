import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/Gymkhana/clubsession.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:fusion/services/viewsessiondetails.dart';
import 'package:fusion/services/vieweventservice.dart';

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';

class Club extends StatefulWidget {
  const Club({Key? key}) : super(key: key);

  @override
  _ClubState createState() => _ClubState();
}

class _ClubState extends State<Club> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  List<Map<String, dynamic>> clubDetails = [];
  List<Map<String, dynamic>> sessionDetails = [];
  List<Map<String, dynamic>> eventDetails = [];
  int _selectedIndex = 0;
  String? selectedClub;
  List<String> clubNames = [];

  @override
  void initState() {
    super.initState();
    fetchClubDetails();
    fetchSessionDetails();
    fetchEventDetails();
  }

  Future<void> fetchClubDetails() async {
    try {
      ViewClubDetails _clubDetailsFetcher = ViewClubDetails();
      List<dynamic> data = await _clubDetailsFetcher.getClubDetails();

      // Filter club details with status 'confirmed' or handle null status
      List<dynamic> filteredData = data
          .where(
              (item) => item['status'] == 'confirmed' || item['status'] == null)
          .toList();

      setState(() {
        clubNames = filteredData
            .map<String>((item) => item['club_name'] as String)
            .toList();
        selectedClub = clubNames.isNotEmpty ? clubNames.first : null;
        clubDetails = filteredData
            .map<Map<String, dynamic>>((item) => {
                  'club_name': item['club_name'] ?? '',
                  'co_ordinator': item['co_ordinator'] ?? '',
                  'co_coordinator': item['co_coordinator'] ?? '',
                  'activity_calender': item['activity_calender'] ??
                      '/media/gymkhana/activity_calender/Copy_of_SA-3_Gymkhana_App_Assignment-2_11_sh3s9EN.pdf',
                })
            .toList();
      });
    } catch (e) {
      print("Error fetching club details: $e");
    }
  }

  Future<void> fetchSessionDetails() async {
    try {
      SessionDetailsService _sessionDetailsFetcher = SessionDetailsService();
      List<dynamic> data = await _sessionDetailsFetcher.getSessionDetails();

      setState(() {
        // Assuming session details are associated with clubs, filter session details based on club status
        List<dynamic> filteredData = data.where((item) {
          // Get the status of the club associated with the session
          String? clubStatus = clubDetails.firstWhere(
              (club) => club['club_name'] == item['club'],
              orElse: () => {'status': 'unconfirmed'})['status'];
          // Return true if the club status is 'confirmed' or null
          return clubStatus == 'confirmed' || clubStatus == null;
        }).toList();

        sessionDetails = filteredData
            .map<Map<String, dynamic>>((item) => {
                  'club': item['club'] ?? '',
                  'venue': item['venue'] ?? '',
                  'date': item['date'] ?? '',
                  'start_time': item['start_time'] ?? '',
                  'details': item['details'] ?? '',
                })
            .toList();
      });
    } catch (e) {
      print("Error fetching session details: $e");
    }
  }

  Future<void> fetchEventDetails() async {
    try {
      EventDetailsService _eventDetailsService = EventDetailsService();
      List<dynamic> data = await _eventDetailsService.getEventDetails();

      setState(() {
        eventDetails = data
            .map<Map<String, dynamic>>((item) => {
                  'event_name': item['event_name'] ?? '',
                  'incharge': item['incharge'] ?? '',
                  'date': item['date'] ?? '',
                })
            .toList();
      });
    } catch (e) {
      print("Error fetching event details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final GymkhanaData? data =
        ModalRoute.of(context)!.settings.arguments as GymkhanaData?;

    if (data == null) {
      return Scaffold(
        body: Center(
          child: Text('Error: Data is null'),
        ),
      );
    }
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          curr_desig: curr_desig,
          headerTitle: 'Club Details', // Set your app bar title
          onDesignationChanged: (newValue) {
            // Handle designation change if needed
          },
        ),
        drawer: SideDrawer(curr_desig: curr_desig),
        bottomNavigationBar: MyBottomNavigationBar(),
        body: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: 8), // Add padding if needed
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 8), // Add spacing if needed
                  TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    tabs: [
                      Tab(
                        child: Text(
                          "Club Details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Club Session",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Club Event",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      // Added SingleChildScrollView for vertical scrolling
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Visibility(
                            visible: _selectedIndex == 0,
                            child: clubDetailsWidget(),
                          ),
                          SizedBox(width: 20),
                          Visibility(
                            visible: _selectedIndex == 1,
                            child: clubSessionWidget(),
                          ),
                          SizedBox(width: 20),
                          Visibility(
                            visible: _selectedIndex == 2,
                            child: clubEvents(),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget clubDetailsWidget() {
   if (clubDetails.isEmpty) {
    return Center(
      child: Text('No records to show'),
    );
  }

  List<Map<String, dynamic>> detailsForSelectedClub = clubDetails
      .where((detail) => detail['club_name'] == selectedClub)
      .toList();

  if (detailsForSelectedClub.isEmpty) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedClub ?? clubNames.first,
          onChanged: (String? newValue) {
            setState(() {
              selectedClub = newValue;
            });
          },
          items: clubNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Center(
          child: Text('No records found for selected club'),
        ),
      ],
    );
  }
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedClub ?? clubNames.first,
          onChanged: (String? newValue) {
            setState(() {
              selectedClub = newValue;
            });
          },
          items: clubNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        DataTable(
          columnSpacing: 20,
          dataRowHeight: 60,
          headingRowHeight: 70,
          headingTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          dataTextStyle: TextStyle(color: Colors.black),
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.deepOrangeAccent),
          dataRowColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'Coordinator',
              ),
            ),
            DataColumn(
              label: Text(
                'Co-Coordinator',
              ),
            ),
            DataColumn(
              label: Text(
                'Activity Calendar',
              ),
            ),
          ],
          rows: clubDetails
              .where((detail) => detail['club_name'] == selectedClub)
              .map(
                (detail) => DataRow(
                  cells: [
                    DataCell(Text(detail['co_ordinator'])),
                    DataCell(Text(detail['co_coordinator'])),
                    DataCell(Text(detail['activity_calender'])),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget clubSessionWidget() {
   if (sessionDetails.isEmpty) {
    return Center(
      child: Text('No records to show'),
    );
  }

  List<Map<String, dynamic>> sessionsForSelectedClub = sessionDetails
      .where((detail) => detail['club'] == selectedClub)
      .toList();

  if (sessionsForSelectedClub.isEmpty) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedClub ?? clubNames.first,
          onChanged: (String? newValue) {
            setState(() {
              selectedClub = newValue;
            });
          },
          items: clubNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Center(
          child: Text('No records found for selected club'),
        ),
      ],
    );
  }
    if (sessionDetails.isEmpty) {
      return Center(
        child:
            CircularProgressIndicator(), // Show loading indicator while data is being fetched
      );
    }

    return Column(
      children: [
        DropdownButton<String>(
          value: selectedClub ?? clubNames.first,
          onChanged: (String? newValue) {
            setState(() {
              selectedClub = newValue;
            });
          },
          items: clubNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        DataTable(
          columnSpacing: 20,
          dataRowHeight: 60,
          headingRowHeight: 70,
          headingTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          dataTextStyle: TextStyle(color: Colors.black),
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.deepOrangeAccent),
          dataRowColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'Venue',
              ),
            ),
            DataColumn(
              label: Text(
                'Date',
              ),
            ),
            DataColumn(
              label: Text(
                'Start Time',
              ),
            ),
            DataColumn(
              label: Text(
                'Details',
              ),
            ),
          ],
          rows: sessionDetails
              .where((detail) => detail['club'] == selectedClub)
              .map(
                (detail) => DataRow(
                  cells: [
                    DataCell(Text(detail['venue'])),
                    DataCell(Text(detail['date'])),
                    DataCell(Text(detail['start_time'])),
                    DataCell(Text(detail['details'])),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }

 Widget clubEvents() {
  if (eventDetails.isEmpty) {
    return Center(
      child: Text('No records to show'),
    );
  }
    return DataTable(
      columnSpacing: 20,
      dataRowHeight: 60,
      headingRowHeight: 70,
      headingTextStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      dataTextStyle: TextStyle(color: Colors.black),
      headingRowColor:
          MaterialStateColor.resolveWith((states) => Colors.deepOrangeAccent),
      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Event Name',
          ),
        ),
        DataColumn(
          label: Text(
            'Incharge',
          ),
        ),
        DataColumn(
          label: Text(
            'Date',
          ),
        ),
      ],
      rows: eventDetails
          .map(
            (detail) => DataRow(
              cells: [
                DataCell(Text(detail['event_name'])),
                DataCell(Text(detail['incharge'])),
                DataCell(Text(detail['date'])),
              ],
            ),
          )
          .toList(),
    );
  }
}
