import 'package:flutter/material.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:fusion/services/deleteClub.dart';

class DeleteClubPage extends StatefulWidget {
  @override
  _DeleteClubPageState createState() => _DeleteClubPageState();
}

class _DeleteClubPageState extends State<DeleteClubPage> {
  late Future<List<dynamic>> _clubDetails;

  @override
  void initState() {
    super.initState();
    _clubDetails = ViewClubDetails().getClubDetails();
  }

  Future<void> _deleteClub(String clubName, String coordinator, String coCoordinator, String category, String facultyIncharge) async {
    try {
      await DeleteClubService().deleteClub(
        clubName: clubName,
        coordinator: coordinator,
        coCoordinator: coCoordinator,
        category: category,
        facultyIncharge: facultyIncharge,
      );
      setState(() {
        // Refresh club details after deletion
        _clubDetails = ViewClubDetails().getClubDetails();
      });
    } catch (e) {
      print('Error deleting club: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delete Clubs',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _clubDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> clubs = snapshot.data!;
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
                      label: Text("Category"),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text("Faculty Incharge"),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text("Delete"),
                      numeric: false,
                    ),
                  ],
                  rows: clubs
                      .map<DataRow>(
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
                                club['category'],
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
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _deleteClub(
                                    club['club_name'],
                                    club['co_ordinator'],
                                    club['co_coordinator'],
                                    club['category'],
                                    club['faculty_incharge'],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
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
