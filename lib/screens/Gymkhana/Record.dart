import 'package:flutter/material.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/services/viewmembersrecord.dart';
import 'package:fusion/services/viewclubdetails.dart'; // Import viewclubdetails.dart

class Record extends StatefulWidget {
  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Records(),
    );
  }
}

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  List<Srecord> allSrecords = []; // Define the list to store all records
  List<Srecord> filteredSrecords =
      []; // Define the list to store filtered records
  List<String> clubs = []; // List to store club names

  late String selectedClub = '';

  @override
  void initState() {
    super.initState();
    fetchClubDetails(); // Call method to fetch club details
  }

  // Future<void> fetchClubDetails() async {
  //   try {
  //     ViewClubDetails viewClubDetails = ViewClubDetails();
  //     List<dynamic> jsonData = await viewClubDetails.getClubDetails();

  //     setState(() {
  //       clubs = jsonData
  //           .map<String>((club) => club['club_name'].toString())
  //           .toList();
  //       selectedClub = clubs.isNotEmpty ? clubs.first : '';
  //     });
  //   } catch (e) {
  //     print('Error fetching club details: $e');
  //     // Handle error, show message to user, etc.
  //   }

  //   // After fetching club details, fetch member records
  //   fetchMembersRecord();
  // }

Future<void> fetchClubDetails() async {
  try {
    ViewClubDetails viewClubDetails = ViewClubDetails();
    List<dynamic> jsonData = await viewClubDetails.getClubDetails();

    // Filter club details with status 'confirmed' or handle null status
    List<dynamic> filteredData = jsonData.where((club) => club['status'] == 'confirmed' || club['status'] == null).toList();

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

  // After fetching club details, fetch member records
  fetchMembersRecord();
}

  
//   Future<void> fetchMembersRecord() async {
//   try {
//     ViewMembersRecord viewMembersRecord = ViewMembersRecord();
//     List<dynamic> jsonData = await viewMembersRecord.getMembersRecord();

//     // Fetch club details including category and coordinators' roll numbers
//     ViewClubDetails viewClubDetails = ViewClubDetails();
//     List<dynamic> clubDetails = await viewClubDetails.getClubDetails();

//     setState(() {
//       allSrecords = jsonData
//           .where((Status) => Status['status'].toLowerCase() == 'confirmed')
//           .map((member) {
//         // Find category and coordinators' roll numbers for the club of this member
//         String club = member['club'];
//         String category = 'None';
//         String coOrdinatorRoll = '';
//         String coCoOrdinatorRoll = '';
//         for (var clubData in clubDetails) {
//           if (clubData['club_name'] == club) {
//             category = clubData['category'];
//             coOrdinatorRoll = clubData['co_ordinator'];
//             coCoOrdinatorRoll = clubData['co_coordinator'];
//             break;
//           }
//         }

//         // Determine role based on conditions
//         String role = 'Member';
//         if (member['member'] == coOrdinatorRoll) {
//           role = 'Co-ordinator';
//         } else if (member['member'] == coCoOrdinatorRoll) {
//           role = 'Co-coordinator';
//         }

//         return Srecord(
//           Status: member['status'],
//           Rollno: member['member'],
//           Club: club,
//           Achievements: member['remarks'] ?? 'None',
//           Category: category,
//           Role: role,
//         );
//       }).toList();

//       // Filter records based on selected club
//       filteredSrecords =
//           allSrecords.where((record) => record.Club == selectedClub).toList();
//     });
//   } catch (e) {
//     print('Error fetching members record: $e');
//     // Handle error, show message to user, etc.
//   }
// }
Future<void> fetchMembersRecord() async {
  try {
    ViewMembersRecord viewMembersRecord = ViewMembersRecord();
    List<dynamic> jsonData = await viewMembersRecord.getMembersRecord();

    // Fetch club details including category and coordinators' roll numbers
    ViewClubDetails viewClubDetails = ViewClubDetails();
    List<dynamic> clubDetails = await viewClubDetails.getClubDetails();

    // Create a Set to store unique member records
    Set<Srecord> uniqueRecords = {};

    // Iterate through each member record
    for (var member in jsonData) {
      String club = member['club'];
      String status = member['status'].toLowerCase();

      // Skip records with status other than 'confirmed'
      if (status != 'confirmed') {
        continue;
      }

      // Find category and coordinators' roll numbers for the club of this member
      String category = 'None';
      String coOrdinatorRoll = '';
      String coCoOrdinatorRoll = '';
      for (var clubData in clubDetails) {
        if (clubData['club_name'] == club) {
          category = clubData['category'];
          coOrdinatorRoll = clubData['co_ordinator'];
          coCoOrdinatorRoll = clubData['co_coordinator'];
          break;
        }
      }

      // Determine role based on conditions
      String role = 'Member';
      if (member['member'] == coOrdinatorRoll) {
        role = 'Co-ordinator';
      } else if (member['member'] == coCoOrdinatorRoll) {
        role = 'Co-coordinator';
      }

      // Create a new Srecord instance
      Srecord record = Srecord(
        Status: status,
        Rollno: member['member'],
        Club: club,
        Achievements: member['remarks'] ?? 'None',
        Category: category,
        Role: role,
      );

      // Check if the record is already present in uniqueRecords based on club name and roll number
      bool isDuplicate = uniqueRecords.any((existingRecord) =>
          existingRecord.Club == record.Club &&
          existingRecord.Rollno == record.Rollno);

      // If the record is not a duplicate, add it to uniqueRecords
      if (!isDuplicate) {
        uniqueRecords.add(record);
      }
    }

    // Convert the Set to a List and update the state
    setState(() {
      allSrecords = uniqueRecords.toList();

      // Filter records based on selected club
      filteredSrecords = allSrecords.where((record) => record.Club == selectedClub).toList();
    });
  } catch (e) {
    print('Error fetching members record: $e');
    // Handle error, show message to user, etc.
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Records', style: TextStyle(color: Colors.deepOrangeAccent)),
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedClub,
              onChanged: (newValue) {
                setState(() {
                  selectedClub = newValue!;
                  filteredSrecords = allSrecords
                      .where((record) => record.Club == selectedClub)
                      .toList();
                });
              },
              items: clubs.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: 35,
                columns: <DataColumn>[
                  // DataColumn(
                  //   label: Text("Status"),
                  //   numeric: false,
                  //   onSort: (i, b) {},
                  // ),
                  DataColumn(
                    label: Text("Rollno"),
                    numeric: false,
                    onSort: (i, b) {},
                  ),
                  DataColumn(
                    label: Text("Achievements"),
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
                ],
                rows: filteredSrecords
                    .map((srecord) => DataRow(
                          cells: <DataCell>[
                            // DataCell(
                            //   Text(
                            //     srecord.Status,
                            //     style: TextStyle(color: Colors.black),
                            //   ),
                            // ),
                            DataCell(
                              Text(
                                srecord.Rollno,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DataCell(
                              Text(
                                srecord.Achievements,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DataCell(
                              Text(
                                srecord.Category,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DataCell(
                              Text(
                                srecord.Role,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.white), // Row color
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.deepOrangeAccent), // Header row color
                headingRowHeight: 50, // Height of the header row
                dataRowHeight: 50, // Height of the data rows
                dividerThickness: 1, // Thickness of the divider between rows
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Srecord {
//   late String Status; // Changed 'Name' to 'Status'
//   late String Rollno;
//   late String Club;
//   late String Achievements;
//   late String Category;

//   Srecord({
//     required String Status, // Changed to required string
//     required String Rollno, // Changed to required string
//     required String Club, // Changed to required string
//     required String Achievements, // Changed to required string
//     required String Category,
//   }) {
//     this.Status = Status;
//     this.Rollno = Rollno;
//     this.Club = Club;
//     this.Achievements = Achievements;
//     this.Category = Category;
//   }
// }
class Srecord {
  late String Status;
  late String Rollno;
  late String Club;
  late String Achievements;
  late String Category;
  late String Role; // New field for role

  Srecord({
    required String Status,
    required String Rollno,
    required String Club,
    required String Achievements,
    required String Category,
    required String Role, // New required parameter for role
  }) {
    this.Status = Status;
    this.Rollno = Rollno;
    this.Club = Club;
    this.Achievements = Achievements;
    this.Category = Category;
    this.Role = Role; // Initialize role
  }
}
