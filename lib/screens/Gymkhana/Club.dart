import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/Gymkhana/clubsession.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:fusion/services/viewsessiondetails.dart';
import 'package:fusion/services/vieweventservice.dart';

class Club extends StatefulWidget {
  const Club({Key? key}) : super(key: key);

  @override
  _ClubState createState() => _ClubState();
}

class _ClubState extends State<Club> {
  List<Map<String, dynamic>> clubDetails = [];
  List<Map<String, dynamic>> sessionDetails = [];
  List<Map<String, dynamic>> eventDetails = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchClubDetails();
    fetchSessionDetails();
    fetchEventDetails(); // Call fetchEventDetails here
  }

  // Fetch club details from backend
  Future<void> fetchClubDetails() async {
    try {
      ViewClubDetails _clubDetailsFetcher = ViewClubDetails();
      List<dynamic> data = await _clubDetailsFetcher.getClubDetails();

      setState(() {
        clubDetails = data
            .map<Map<String, dynamic>>((item) => {
                  'club_name': item['club_name'] ?? '',
                  'co_ordinator': item['co_ordinator'] ?? '',
                  'co_coordinator': item['co_coordinator'] ?? '',
                  'activity_calender': item['activity_calender'] ?? '',
                })
            .toList();
      });
    } catch (e) {
      print("Error fetching club details: $e");
    }
  }

  // Fetch session details from backend
  Future<void> fetchSessionDetails() async {
    try {
      SessionDetailsService _sessionDetailsFetcher = SessionDetailsService();
      List<dynamic> data = await _sessionDetailsFetcher.getSessionDetails();

      setState(() {
        sessionDetails = data
            .map<Map<String, dynamic>>((item) => {
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

  // Fetch event details from backend
  Future<void> fetchEventDetails() async {
    try {
      EventDetailsService _eventDetailsService = EventDetailsService();
      List<dynamic> data = await _eventDetailsService.getEventDetails();

      setState(() {
        eventDetails = data
            .map<Map<String, dynamic>>((item) => {
                  'club': item['club'] ?? '',
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
        appBar: AppBar(
          title: Text(
            'View Club Details',
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
          bottom: TabBar(
            labelColor: Colors.deepOrange,
            indicatorColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.white,
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Visibility(
                visible: _selectedIndex == 0,
                child: Center(child: clubDetailsWidget()),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: _selectedIndex == 1,
                child: Center(child: clubSessionWidget()),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: _selectedIndex == 2,
                child: Center(child: clubEvents()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget clubDetailsWidget() {
    return DataTable(
      columnSpacing: 20,
      dataRowHeight: 60,
      headingRowHeight: 70,
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      dataTextStyle: TextStyle(color: Colors.black),
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.deepOrangeAccent),
      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Club',
          ),
        ),
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
      rows: clubDetails.map(
            (detail) => DataRow(
          cells: [
            DataCell(Text(detail['club_name'])),
            DataCell(Text(detail['co_ordinator'])),
            DataCell(Text(detail['co_coordinator'])),
            DataCell(Text(detail['activity_calender'])),
          ],
        ),
      ).toList(),
    );
  }

  Widget clubSessionWidget() {
    return DataTable(
      columnSpacing: 20,
      dataRowHeight: 60,
      headingRowHeight: 70,
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      dataTextStyle: TextStyle(color: Colors.black),
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.deepOrangeAccent),
      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
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
      rows: sessionDetails.map(
            (detail) => DataRow(
          cells: [
            DataCell(Text(detail['venue'])),
            DataCell(Text(detail['date'])),
            DataCell(Text(detail['start_time'])),
            DataCell(Text(detail['details'])),
          ],
        ),
      ).toList(),
    );
  }

  Widget clubEvents() {
    return DataTable(
      columnSpacing: 20,
      dataRowHeight: 60,
      headingRowHeight: 70,
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      dataTextStyle: TextStyle(color: Colors.black),
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.deepOrangeAccent),
      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Club',
          ),
        ),
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
      rows: eventDetails.map(
            (detail) => DataRow(
          cells: [
            DataCell(Text(detail['club'])),
            DataCell(Text(detail['event_name'])),
            DataCell(Text(detail['incharge'])),
            DataCell(Text(detail['date'])),
          ],
        ),
      ).toList(),
    );
  }
}
