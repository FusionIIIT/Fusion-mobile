import 'package:flutter/material.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:fusion/services/deleteClub.dart';

import '../../Components/appBar2.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/side_drawer2.dart';
import '../../services/change_club_position.dart';
import '../../services/service_locator.dart';
import '../../services/storage_service.dart';
import '../../services/update_clubName.dart';
import '../../services/update_club_status.dart'; // Assuming this service will also be used for updating, approving, and rejecting

class ApproveClubDeanPage extends StatefulWidget {
  @override
  _ApproveClubDeanPageState createState() => _ApproveClubDeanPageState();
}

class _ApproveClubDeanPageState extends State<ApproveClubDeanPage> {
  late Future<List<dynamic>> _clubDetails;
  late TextEditingController _newClubNameController;

  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  @override
  void initState() {
    super.initState();
    _clubDetails = ViewClubDetails().getClubDetails();
    _newClubNameController = TextEditingController();
  }

  @override
  void dispose() {
    _newClubNameController.dispose(); // Dispose the controller
    super.dispose();
  }

  Future<void> _updateClub(String clubName, String coordinator,
      String coCoordinator, String category, String facultyIncharge) async {
    // Show dialog to enter new club name
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Club Name"),
          content: TextField(
            controller: _newClubNameController,
            decoration: InputDecoration(labelText: "New Club Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Update"),
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await UpdateClubNameService().updateClubName(
                    clubName: clubName,
                    coordinator: coordinator,
                    coCoordinator: coCoordinator,
                    facultyIncharge: facultyIncharge,
                    newClubName:
                        _newClubNameController.text, // Pass the new club name
                  );
                  setState(() {
                    _clubDetails = ViewClubDetails().getClubDetails();
                  });
                } catch (e) {
                  print('Error updating club name: $e');
                  // Handle error
                }
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void approve_complete(
      String clubName, String coordinator, String coCoordinator) async {
    print("come here");
    try {
      if (clubName != null) {
        // String coordinator = coordinator;
        // String coCoordinator = coCoordinator;
        print(clubName);
        await ChangeClubPositionService().changeClubPosition(
          clubName: clubName,
          coordinator: coCoordinator,
          coCoordinator: coordinator,
        );
        _showSnackbar('done', true);
      } else {
        _showSnackbar('error', false);
      }
    } catch (e) {
      print('Error updating positions: $e');
      _showSnackbar('Error updating positions', false);
    }
    print("come here");
    try {
      if (clubName != null) {
        // String coordinator = coordinator;
        // String coCoordinator = coCoordinator;
        print(clubName);
        await ChangeClubPositionService().changeClubPosition(
          clubName: clubName,
          coordinator: coordinator,
          coCoordinator: coCoordinator,
        );
        _showSnackbar('done', true);
      } else {
        _showSnackbar('error', false);
      }
    } catch (e) {
      print('Error updating positions: $e');
      _showSnackbar('Error updating positions', false);
    }
  }

  void _showSnackbar(String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  Future<void> _approveClub(String clubName, String coordinator,
      String coCoordinator, String category, String facultyIncharge) async {
    try {
      await UpdateClubStatusService().updateClubStatus(
        clubName: clubName,
        coordinator: coordinator,
        coCoordinator: coCoordinator,
        facultyIncharge: facultyIncharge,
      );
      setState(() {
        // Refresh club details after approval
        _clubDetails = ViewClubDetails().getClubDetails();
        print("someme");
        approve_complete(clubName, coordinator, coCoordinator);
      });
    } catch (e) {
      print('Error approving club: $e');
      // Handle error
    }
  }

  Future<void> _rejectClub(String clubName, String coordinator,
      String coCoordinator, String category, String facultyIncharge) async {
    try {
      await DeleteClubService().deleteClub(
        clubName: clubName,
        coordinator: coordinator,
        coCoordinator: coCoordinator,
        category: category,
        facultyIncharge: facultyIncharge,
      );
      setState(() {
        // Refresh club details after rejection
        _clubDetails = ViewClubDetails().getClubDetails();
      });
    } catch (e) {
      print('Error rejecting club: $e');
      // Handle error
    }
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(
      curr_desig: curr_desig,
      headerTitle: 'Approve Club',
      onDesignationChanged: (newValue) {
        // Handle designation change if needed
      },
    ),
    drawer: SideDrawer(curr_desig: curr_desig),
    bottomNavigationBar: MyBottomNavigationBar(),
    body: FutureBuilder<List<dynamic>>(
      future: _clubDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<dynamic> clubs = snapshot.data!;
          clubs = clubs.where((club) => club['status'] == 'open').toList();

          if (clubs.isEmpty) {
            return Center(child: Text('No requests found'));
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 35,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text("Club Name"),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Coordinator"),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Co-Coordinator"),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Faculty Incharge"),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Actions"),
                    numeric: false,
                  ),
                ],
                rows: clubs.map<DataRow>(
                  (club) => DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          club['club_name'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DataCell(
                        Text(
                          club['co_ordinator'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DataCell(
                        Text(
                          club['co_coordinator'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DataCell(
                        Text(
                          club['faculty_incharge'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _updateClub(
                                  club['club_name'],
                                  club['co_ordinator'],
                                  club['co_coordinator'],
                                  club['category'],
                                  club['faculty_incharge'],
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () {
                                _approveClub(
                                  club['club_name'],
                                  club['co_ordinator'],
                                  club['co_coordinator'],
                                  club['category'],
                                  club['faculty_incharge'],
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.thumb_down),
                              onPressed: () {
                                _rejectClub(
                                  club['club_name'],
                                  club['co_ordinator'],
                                  club['co_coordinator'],
                                  club['category'],
                                  club['faculty_incharge'],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).toList(),
                dataRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.deepOrangeAccent),
                headingRowHeight: 50,
                dataRowHeight: 50,
                dividerThickness: 1,
              ),
            ),
          );
        }
      },
    ),
  );
}

}
