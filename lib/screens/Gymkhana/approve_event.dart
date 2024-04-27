import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fusion/services/viewsessiondetails.dart';
import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/help.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';
import '../LoginandDashboard/dashboard.dart';
import 'editRequest.dart';
import 'editrequestevent.dart';
import 'package:fusion/services/updatesession.dart';
import 'package:fusion/services/updateevent.dart';
import 'package:fusion/services/vieweventservice.dart';
import 'package:fusion/services/deletesession.dart';
import 'package:fusion/services/deleteevent.dart';
import 'package:fusion/services/approve_event.dart';

class ApproveEvent extends StatefulWidget {
  @override
  _ApproveEventState createState() => _ApproveEventState();
}

class _ApproveEventState extends State<ApproveEvent> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  late Future<List<Map<String, dynamic>>> _eventDetails;
  List<EventRequest> eventRequests = [];
  List<String> selectedEventIds = [];
  List<dynamic> EventRequests = [];

  final deleteEventService = DeleteEventService();

  @override
  void initState() {
    super.initState();
    _eventDetails = EventDetailsService().getEventDetails();
  }

  void updateEventDetails({
    required int id,
    required String venue,
    required DateTime date,
    required String incharge,
    required String eventName,
    required String details,
  }) async {
    try {
      await UpdateEventService().updateEvent(
        id: id,
        venue: venue,
        date: date,
        incharge: incharge,
        eventName: eventName,
        details: details,
      );
      setState(() {
        _eventDetails = EventDetailsService().getEventDetails();
      });
    } catch (e) {
      print('Error updating event details: $e');
    }
  }

  void approveEvent(int id, String eventName, String inCharge, DateTime date,
      String venue) async {
    try {
      String formattedDate =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      await ApproveEventService().sendApproveEventRequest({
        'id': id,
        'event_name': eventName,
        'incharge': inCharge,
        'date': formattedDate,
        'venue': venue,
        'status': 'confirmed',
      });
      setState(() {
        _eventDetails = EventDetailsService().getEventDetails();
      });
    } catch (e) {
      print('Error approving event: $e');
    }
  }

  void cancelEvent(int id) async {
    try {
      print(id); // Print the id for debugging purposes

      // Call the deleteEvent service method with only the 'id' parameter
      await deleteEventService.deleteEvent(id: id);

      print('Event canceled successfully');
      setState(() {
        _eventDetails = EventDetailsService().getEventDetails();
      });
    } catch (e) {
      print('Error canceling event: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: 'Approve Event', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _eventDetails,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Map<String, dynamic>> openEvents = [];
                  for (var eventData in snapshot.data!) {
                    if (eventData['status'] == 'open') {
                      openEvents.add(eventData);
                    }
                  }

                  eventRequests = openEvents.map((eventData) {
                    return EventRequest(
                      id: eventData['id'],
                      eventName: eventData['event_name'],
                      inCharge: eventData['incharge'],
                      venue: eventData['venue'],
                      date: DateTime.now(),
                      details: eventData['details'],
                    );
                  }).toList();

                  return DataTable(
                    columnSpacing: 35,
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.deepOrangeAccent),
                    columns: [
                      DataColumn(
                          label: Text('Event',
                              style: TextStyle(color: Colors.black))),
                      DataColumn(
                          label: Text('In Charge',
                              style: TextStyle(color: Colors.black))),
                      DataColumn(
                          label: Text('Date',
                              style: TextStyle(color: Colors.black))),
                      DataColumn(
                          label: Text('Venue',
                              style: TextStyle(color: Colors.black))),
                      DataColumn(
                          label: Text('Actions',
                              style: TextStyle(color: Colors.black))),
                    ],
                    rows: eventRequests.map((request) {
                      return DataRow(cells: [
                        DataCell(Text(request.eventName)),
                        DataCell(Text(request.inCharge)),
                        DataCell(Text(
                            DateFormat('yyyy-MM-dd').format(request.date))),
                        DataCell(Text(request.venue)),
                        DataCell(Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                cancelEvent(
                                  request.id,
                                );
                              },
                              child: Text('Cancel'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                approveEvent(
                                  request.id,
                                  request.eventName,
                                  request.inCharge,
                                  request.date,
                                  request.venue,
                                );
                              },
                              child: Text('Approve'),
                            ),
                          ],
                        )),
                      ]);
                    }).toList(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class EventRequest {
  final int id;
  final String eventName;
  final String inCharge;
  final DateTime date;
  final String details;
  final String venue;

  EventRequest({
    required this.id,
    String? eventName,
    String? inCharge,
    required this.date,
    String? details,
    String? venue,
  })  : eventName = eventName ?? '',
        inCharge = inCharge ?? '',
        details = details ?? 'No details',
        venue = venue ?? '';
}
