

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/services/viewmembersrecord.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:fusion/services/rejectmember.dart';

import '../../services/help.dart';

class MemberRecordsPage extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<MemberRecordsPage> {
  List<Srecord> allSrecords = []; // Define the list to store all records
  List<Srecord> filteredSrecords =
      []; // Define the list to store filtered records
  List<String> clubs = []; // List to store club names
  late String selectedClub = '';
  late TextEditingController searchController;
  List<String> clubNames = [];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _initializeClubName(); // Call method to initialize club name
  }

  // Add this method to fetch the club name of the currently logged-in user
  Future<void> _initializeClubName() async {
    try {
      // Fetch the club name of the currently logged-in user
      String userClubName = await DataFetcher().getClub(context);
      setState(() {
        // Add the fetched club name to the clubNames list
        clubNames = [userClubName];
        // Set the selectedClub to the fetched club name
        selectedClub = userClubName;
      });
      fetchClubDetails(); // Fetch club details
    } catch (e) {
      print('Error initializing club name: $e');
      // Handle error, show message to user, etc.
    }
  }

  // Modify fetchClubDetails method to filter clubs based on clubNames
  // Future<void> fetchClubDetails() async {
  //   try {
  //     ViewClubDetails viewClubDetails = ViewClubDetails();
  //     List<dynamic> jsonData = await viewClubDetails.getClubDetails();

  //     setState(() {
  //       clubs = jsonData
  //           .where((club) => clubNames.contains(club['club_name'].toString()))
  //           .map<String>((club) => club['club_name'].toString())
  //           .toList();
  //       selectedClub = clubs.isNotEmpty ? clubs.first : '';
  //     });
  //   } catch (e) {
  //     print('Error fetching club details: $e');
  //     // Handle error, show message to user, etc.
  //   }

  //   fetchMembersRecord(); // After fetching club details, fetch member records
  // }
  Future<void> fetchClubDetails() async {
  try {
    ViewClubDetails viewClubDetails = ViewClubDetails();
    List<dynamic> jsonData = await viewClubDetails.getClubDetails();

    // Filter club details based on the existing clubNames list
    List<dynamic> filteredData = jsonData.where((club) => clubNames.contains(club['club_name'].toString())).toList();

    setState(() {
      clubs = filteredData
          .map<String>((club) => club['club_name'].toString())
          .toList();
      selectedClub = clubs.isNotEmpty ? clubs.first : '';
    });
  } catch (e) {
    print('Error fetching club details: $e');
    // Handle error, show message to user, etc.
  }

  fetchMembersRecord(); // After fetching club details, fetch member records
}


  Future<void> fetchMembersRecord() async {
    try {
      ViewMembersRecord viewMembersRecord = ViewMembersRecord();
      List<dynamic> jsonData = await viewMembersRecord.getMembersRecord();

      // Fetch club details including category and coordinators' roll numbers
      ViewClubDetails viewClubDetails = ViewClubDetails();
      List<dynamic> clubDetails = await viewClubDetails.getClubDetails();

      setState(() {
        allSrecords = jsonData
            .where((status) => status['status'].toLowerCase() == 'confirmed')
            .map((member) {
          // Find category and coordinators' roll numbers for the club of this member
          String club = member['club'];
          String category = 'None';
          String coordinatorRoll = '';
          String coCoordinatorRoll = '';
          for (var clubData in clubDetails) {
            if (clubData['club_name'] == club) {
              category = clubData['category'];
              coordinatorRoll = clubData['co_ordinator'];
              coCoordinatorRoll = clubData['co_coordinator'];
              break;
            }
          }

          // Determine role based on conditions
          String role = 'Member';
          if (member['member'] == coordinatorRoll) {
            role = 'Coordinator';
          } else if (member['member'] == coCoordinatorRoll) {
            role = 'Co-coordinator';
          }

          return Srecord(
            id: member['id'], // Assuming 'id' field exists in the data
            status: member['status'],
            rollno: member['member'],
            club: club,
            achievements: member['remarks'] ?? 'None',
            category: category,
            role: role,
          );
        }).toList();

        // Filter records based on selected club
        filteredSrecords =
            allSrecords.where((record) => record.club == selectedClub).toList();
      });
    } catch (e) {
      print('Error fetching members record: $e');
      // Handle error, show message to user, etc.
    }
  }

  Future<void> deleteMember(int id) async {
    try {
      RejectMember rejectMember = RejectMember();
      await rejectMember.rejectMember(id);
      fetchMembersRecord();
    } catch (e) {
      print('Error deleting member: $e');
      // Handle error, show message to user, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Club Members',
            style: TextStyle(color: Colors.deepOrangeAccent)),
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedClub,
              onChanged: (newValue) {
                setState(() {
                  selectedClub = newValue!;
                  fetchMembersRecord(); // Fetch members records for the selected club
                });
              },
              items: clubs.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  // Filter records based on selected club and search query
                  filteredSrecords = allSrecords
                      .where((record) =>
                          record.club == selectedClub &&
                          record.rollno
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by Roll No',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 35,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text("Roll No"),
                      numeric: false,
                      onSort: (i, b) {},
                    ),
                    DataColumn(
                      label: Text("Category"),
                      numeric: false,
                      onSort: (i, b) {},
                    ),
                    DataColumn(
                      label: Text("Role"),
                      numeric: false,
                      onSort: (i, b) {},
                    ),
                    DataColumn(
                      label: Text("Achievements"),
                      numeric: false,
                      onSort: (i, b) {},
                    ),
                    DataColumn(
                      label: Text("Action"),
                      numeric: false,
                      onSort: (i, b) {},
                    ),
                  ],
                  rows: filteredSrecords
                      .map((record) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text(
                                  record.rollno,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              DataCell(
                                Text(
                                  record.category,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              DataCell(
                                Text(
                                  record.role,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              DataCell(
                                Text(
                                  record.achievements,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              DataCell(
                                ElevatedButton(
                                  onPressed: () {
                                    deleteMember(
                                        record.id); // Use 'id' from Srecord
                                  },
                                  child: Text('Delete'),
                                ),
                              ),
                            ],
                          ))
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
            ),
          ),
        ],
      ),
    );
  }
}

class Srecord {
  late int id;
  late String status;
  late String rollno;
  late String club;
  late String achievements;
  late String category;
  late String role;

  Srecord({
    required this.id,
    required this.status,
    required this.rollno,
    required this.club,
    required this.achievements,
    required this.category,
    required this.role,
  });
}
