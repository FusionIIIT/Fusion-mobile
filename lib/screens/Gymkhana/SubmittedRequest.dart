//-----------------------------code with backendend integration + reload + cancel button  + edit backend---------------------

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fusion/services/viewsessiondetails.dart';
import 'editRequest.dart';
import 'editrequestevent.dart';
import 'package:fusion/services/updatesession.dart';
import 'package:fusion/services/updateevent.dart';
import 'package:fusion/services/vieweventservice.dart';
import 'package:fusion/services/deletesession.dart';
import 'package:fusion/services/deleteevent.dart';

class SubmittedRequest extends StatefulWidget {
  @override
  _SubmittedRequestState createState() => _SubmittedRequestState();
}

class _SubmittedRequestState extends State<SubmittedRequest> {
  late Future<List<dynamic>> _sessionDetails;
  List<String> selectedSessionIds = [];
  List<dynamic> sessionRequests =
      []; // Move this declaration to the class level

  @override
  void initState() {
    super.initState();
    _sessionDetails = fetchSessionDetails();
  }

  Future<List<dynamic>> fetchSessionDetails() async {
    try {
      return await SessionDetailsService().getSessionDetails();
    } catch (e) {
      print('Error fetching session details: $e');
      return [];
    }
  }

  // Function to update session details
  void updateSessionDetails({
    required int id,
    required String venue,
    required DateTime date,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String details,
  }) async {
    try {
      await UpdateSessionService().updateSession(
        id: id,
        venue: venue,
        date: date,
        startTime: startTime,
        endTime: endTime,
        details: details,
      );
      // Reload session details after updating
      setState(() {
        _sessionDetails = fetchSessionDetails();
      });
    } catch (e) {
      print('Error updating session details: $e');
    }
  }

  void deleteSelectedRequests() async {
    try {
      List<Map<String, dynamic>> requestDataList = [];
      print(selectedSessionIds);
      for (String sessionId in selectedSessionIds) {
        // Iterate over the selected session IDs
        List<String> parts = sessionId.split('_');
        Map<String, dynamic>? request = sessionRequests.firstWhere(
          (request) => request['id'].toString() == sessionId,
          orElse: () => null,
        );
        print(request);
        if (parts != null) {
          // If a matching request is found, add its data to the requestDataList
          Map<String, dynamic> requestData = {
            'venue': parts[0],
            'date': parts[1],
            'start_time': parts[2],
            'end_time': parts[3],
            'status': parts[4],
            // Add any other necessary fields (e.g., 'details')
          };
          print("Requestdata :$requestData");
          requestDataList.add(requestData);
        } else {
          print("its null");
        }
      }

      // Print requestDataList for debugging
      print('Request Data List for Deletion: $requestDataList');

      var deleteRequestService = DeleteRequestService();
      print("requestdata :$requestDataList");
      await deleteRequestService.sendDeleteSessionRequest(requestDataList);
      // If deletion is successful, remove the sessions from the UI
      setState(() {
        sessionRequests.removeWhere(
            (request) => selectedSessionIds.contains(request['id'].toString()));
      });
    } catch (e) {
      print('Error deleting sessions: $e');
    } finally {
      // Clear selected session IDs and reload session details
      setState(() {
        selectedSessionIds.clear();
        _sessionDetails = fetchSessionDetails();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        title: Text(
          'Club Session Requests',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _sessionDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<dynamic> sessionRequests = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.deepOrangeAccent),
                    dataRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    columns: [
                      DataColumn(
                          label: Text('Select',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Venue',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Date',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Start Time',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('End Time',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Status',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Edit',
                              style: TextStyle(color: Colors.white))),
                    ],
                    rows: sessionRequests.map((request) {
                      String sessionId =
                          '${request['venue']}_${request['date']}_${request['start_time']}_${request['end_time']}_${request['status']}';
                      bool isSelected = selectedSessionIds.contains(sessionId);
                      return DataRow(cells: [
                        DataCell(
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              print(value);
                              print(sessionId);
                              setState(() {
                                if (value != null && value) {
                                  selectedSessionIds.add(sessionId);
                                } else {
                                  selectedSessionIds.remove(sessionId);
                                }
                              });
                            },
                          ),
                        ),
                        DataCell(Text(request['venue'] ?? '',
                            style: TextStyle(color: Colors.black))),
                        DataCell(Text(request['date'] ?? '',
                            style: TextStyle(color: Colors.black))),
                        DataCell(Text(request['start_time'] ?? '',
                            style: TextStyle(color: Colors.black))),
                        DataCell(Text(request['end_time'] ?? '',
                            style: TextStyle(color: Colors.black))),
                        DataCell(Text(request['status'] ?? '',
                            style: TextStyle(color: Colors.black))),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditRequestForm(
                                    sessionId: request['id'],
                                    oldVenue: request['venue'] ?? '',
                                    venueOptions: [
                                      'CR101',
                                      'CR102',
                                      'L101',
                                      'L102'
                                    ],
                                    selectedDate: DateTime.now(),
                                    oldStartTime: TimeOfDay(hour: 9, minute: 0),
                                    oldEndTime: TimeOfDay(hour: 11, minute: 0),
                                    details: request['details'],
                                  ),
                                ),
                              );
                            },
                            child: Text('Edit'),
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _sessionDetails = fetchSessionDetails();
                        });
                        deleteSelectedRequests();
                      },
                      child: Text('Cancel Request & Reload',
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Club Session Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Club Event Request',
          ),
        ],
        currentIndex: 0,
        unselectedItemColor: Colors.deepOrangeAccent,
        selectedItemColor: Colors.yellow,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClubEventRequest()),
            );
          }
        },
      ),
    );
  }
}

class ClubEventRequest extends StatefulWidget {
  @override
  _ClubEventRequestState createState() => _ClubEventRequestState();
}

class _ClubEventRequestState extends State<ClubEventRequest> {
  late Future<List<Map<String, dynamic>>> _eventDetails;
  List<EventRequest> eventRequests = [];
  List<String> selectedEventIds = []; // Define selectedEventIds list
  List<dynamic> EventRequests = [];
  final deleteEventService =
      DeleteEventService(); // Create an instance of DeleteEventService

  @override
  void initState() {
    super.initState();
    _eventDetails = EventDetailsService().getEventDetails();
  }

  void deleteSelectedEventRequests() async {
    setState(() async {
      List<Map<String, dynamic>> requestDataList = [];
      print(selectedEventIds);
      for (String EventId in selectedEventIds) {
        // Iterate over the selected session IDs
        List<String> parts = EventId.split('_');
        List<String> dat = parts[3].split(' ');
        print(parts);
        Map<String, dynamic>? request = EventRequests.firstWhere(
          (request) => request['id'].toString() == EventId,
          orElse: () => null,
        );
        print(request);
        if (parts != null) {
          // If a matching request is found, add its data to the requestDataList
          Map<String, dynamic> requestData = {
            // Add any other necessary fields (e.g., 'details')
            "event_name": parts[1],
            "incharge": parts[2],
            "date": dat[0],
            "venue": parts[5],
          };
          print("Requestdata :$requestData");
          requestDataList.add(requestData);
        } else
          print("its null");
      }

      // Print requestDataList for debugging
      print('Request Data List for Deletion: $requestDataList');

      try {
        var deleteRequestService = DeleteEventService();
        print("requestdata :$requestDataList");
        await deleteRequestService.sendDeleteEventRequest(requestDataList);
        // If deletion is successful, remove the sessions from the UI
        setState(() {
          EventRequests.removeWhere(
              (request) => selectedEventIds.contains(request['id'].toString()));
        });
        setState(() {
          _eventDetails = EventDetailsService().getEventDetails();
        });
      } catch (e) {
        print('Error deleting event: $e');
      } finally {
        setState(() {
          selectedEventIds.clear();
        });
      }
    });
  }

  // Future<List<dynamic>> fetchEventDetails() async {
  //   try {
  //     return await EventDetailsService().getEventDetails();
  //   } catch (e) {
  //     print('Error fetching event details: $e');
  //     return [];
  //   }
  // }

  // Function to update session details
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
      // Reload session details after updating
      setState(() {
        _eventDetails = EventDetailsService().getEventDetails();
      });
    } catch (e) {
      print('Error updating event details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        title: Text(
          'Club Event Request',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
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
                  // Update eventRequests with fetched data
                  eventRequests = snapshot.data!.map((eventData) {
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
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.deepOrangeAccent),
                    dataRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    columns: [
                      DataColumn(
                          label: Text('Select',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Event',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('In Charge',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Date',
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text('Venue',
                              style: TextStyle(
                                  color:
                                      Colors.white))), // New column for venue
                      DataColumn(
                          label: Text('Edit',
                              style: TextStyle(color: Colors.white))),
                    ],
                    rows: eventRequests.map((request) {
                      String eventId =
                          '${request.id}_${request.eventName}_${request.inCharge}_${DateFormat('yyyy-MM-dd').format(request.date)}_${request.details}_${request.venue}';
                      bool isSelected = selectedEventIds.contains(eventId);
                      return DataRow(cells: [
                        DataCell(
                          Checkbox(
                            value: isSelected, // Use isSelected property
                            onChanged: (value) {
                              setState(() {
                                if (value != null && value) {
                                  selectedEventIds.add(eventId);
                                } else {
                                  selectedEventIds.remove(eventId);
                                }
                              });
                            },
                          ),
                        ),
                        DataCell(
                          Text(
                            request.eventName,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        DataCell(
                          Text(
                            request.inCharge,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        DataCell(
                          Text(
                            DateFormat('yyyy-MM-dd').format(request.date),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        DataCell(
                          Text(
                            request.venue, // Display venue
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditRequestFormB(
                                  eventID: request.id,
                                  oldVenue: request.venue,
                                  details: request.details,
                                  venueOptions: [
                                    'CR101',
                                    'CR102',
                                    'L101',
                                    'L102'
                                  ],
                                  selectedDate: request.date,
                                  inCharge: request.inCharge,
                                  event: request.eventName,
                                ),
                              ));
                            },
                            child: Text('Edit'),
                          ),
                        ),
                      ]);
                    }).toList(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _eventDetails = EventDetailsService().getEventDetails();
                  });
                  deleteSelectedEventRequests();
                },
                child: Text('Cancel Request & Reload',
                    style: TextStyle(color: Colors.black)),
                style:
                    ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent),
              ),
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
  bool isSelected; // Add isSelected property

  EventRequest({
    required this.id,
    String? eventName,
    String? inCharge,
    required this.date,
    String? details,
    this.isSelected = false,
    String? venue,
  })  : eventName = eventName ?? '',
        inCharge = inCharge ?? '',
        details = details ?? 'No details',
        venue = venue ?? '';
}












