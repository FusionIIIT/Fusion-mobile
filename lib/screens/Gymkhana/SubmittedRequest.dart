//-----------------------------code with backendend integration + reload + cancel button  + edit backend---------------------

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fusion/services/viewsessiondetails.dart';
import '../../services/help.dart';
import '../LoginandDashboard/dashboard.dart';
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
  late String xx = "";
  List<dynamic> sessionRequests =
      []; // Move this declaration to the class level

  @override
  void initState() {
    super.initState();
    _sessionDetails = fetchSessionDetails();
  }

  Future<List<dynamic>> fetchSessionDetails() async {
    xx = await DataFetcher().getClub(context);
    print(xx);
    setState(() {});
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
            // Filter session requests by club name
            sessionRequests = sessionRequests
                .where((request) => request['club'] == xx)
                .toList();
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
                                if (value != null &&
                                    value &&
                                    request['club'] == xx) {
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
      
    );
  }
}

