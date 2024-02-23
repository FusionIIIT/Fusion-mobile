// import 'package:flutter/material.dart';
// import 'package:fusion/models/gymkhana.dart';
// import 'package:fusion/services/viewmembersrecord.dart';

// class Record extends StatefulWidget {
//   @override
//   _RecordState createState() => _RecordState();
// }

// class _RecordState extends State<Record> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Records(),
//     );
//   }
// }

// class Records extends StatefulWidget {
//   @override
//   _RecordsState createState() => _RecordsState();
// }

// class _RecordsState extends State<Records> {
//   List<Srecord> Srecords = []; // Define the list to store records

//   @override
//   void initState() {
//     super.initState();
//     fetchMembersRecord(); // Call the function to fetch members record when the widget is initialized
//   }

//   Future<void> fetchMembersRecord() async {
//     try {
//       ViewMembersRecord viewMembersRecord = ViewMembersRecord();
//       List<dynamic> jsonData = await viewMembersRecord.getMembersRecord();
      
//       setState(() {
//         Srecords = jsonData.map((member) => Srecord(
//           Status: member['status'],
//           Rollno: member['rollno'],
//           Club: member['club'],
//           Achievements: member['remarks'] ?? 'None',
//         )).toList();
//       });
//     } catch (e) {
//       print('Error fetching members record: $e');
//       // Handle error, show message to user, etc.
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Records', style: TextStyle(color : Colors.deepOrangeAccent),),
//         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
//         backgroundColor: Colors.black,
//       ),
//       body: Column(
//         children: <Widget>[
//           // Your other widgets...
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columnSpacing: 35,
//                 columns: <DataColumn>[
//                   DataColumn(
//                     label: Text("Status"),
//                     numeric: false,
//                     onSort: (i, b) {},
//                   ),
//                   DataColumn(
//                     label: Text("Rollno"),
//                     numeric: false,
//                     onSort: (i, b) {},
//                   ),
//                   DataColumn(
//                     label: Text("Club"),
//                     numeric: false,
//                     onSort: (i, b) {},
//                   ),
//                   DataColumn(
//                     label: Text("Achievements"),
//                     numeric: false,
//                     onSort: (i, b) {},
//                   ),
//                 ],
//                 rows: Srecords.map((srecord) => DataRow(cells: <DataCell>[
//                   DataCell(Text(srecord.Status)),
//                   DataCell(Text(srecord.Rollno)),
//                   DataCell(Text(srecord.Club)),
//                   DataCell(Text(srecord.Achievements)),
//                 ])).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Srecord {
//   late String Status; // Changed 'Name' to 'Status'
//   late String Rollno;
//   late String Club;
//   late String Achievements;

//   Srecord({
//     String? Status, // Changed to nullable string
//     String? Rollno, // Changed to nullable string
//     String? Club, // Changed to nullable string
//     String? Achievements, // Changed to nullable string
//   }) {
//     this.Status = Status ?? "default-status"; // Use default value if null
//     this.Rollno = Rollno ?? "000000"; // Use default value if null
//     this.Club = Club ?? "default-club"; // Use default value if null
//     this.Achievements = Achievements ?? "default-achievements"; // Use default value if null
//   }
// }



















import 'package:flutter/material.dart';
import 'package:fusion/models/gymkhana.dart';
import 'package:fusion/services/viewmembersrecord.dart';

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
  List<Srecord> Srecords = []; // Define the list to store records

  @override
  void initState() {
    super.initState();
    fetchMembersRecord(); // Call the function to fetch members record when the widget is initialized
  }

  Future<void> fetchMembersRecord() async {
    try {
      ViewMembersRecord viewMembersRecord = ViewMembersRecord();
      List<dynamic> jsonData = await viewMembersRecord.getMembersRecord();
      
      setState(() {
        Srecords = jsonData.map((member) => Srecord(
          Status: member['status'],
          Rollno: member['member'],
          Club: member['club'],
          Achievements: member['remarks'] ?? 'None',
        )).toList();
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
      title: Text('Records', style: TextStyle(color: Colors.deepOrangeAccent)),
      iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      backgroundColor: Colors.black,
    ),
    body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 35,
          columns: <DataColumn>[
            DataColumn(
              label: Text("Status"),
              numeric: false,
              onSort: (i, b) {},
            ),
            DataColumn(
              label: Text("Rollno"),
              numeric: false,
              onSort: (i, b) {},
            ),
            DataColumn(
              label: Text("Club"),
              numeric: false,
              onSort: (i, b) {},
            ),
            DataColumn(
              label: Text("Achievements"),
              numeric: false,
              onSort: (i, b) {},
            ),
          ],
          rows: Srecords.where((srecord) => srecord.Status.toLowerCase() == 'confirmed').map((srecord) => DataRow(
  cells: <DataCell>[
    DataCell(
      Text(
        srecord.Status,
        style: TextStyle(color: Colors.black),
      ),
    ),
    DataCell(
      Text(
        srecord.Rollno,
        style: TextStyle(color: Colors.black),
      ),
    ),
    DataCell(
      Text(
        srecord.Club,
        style: TextStyle(color: Colors.black),
      ),
    ),
    DataCell(
      Text(
        srecord.Achievements,
        style: TextStyle(color: Colors.black),
      ),
    ),
  ],
)).toList(),

          dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white), // Row color
          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.deepOrangeAccent), // Header row color
          headingRowHeight: 50, // Height of the header row
          dataRowHeight: 50, // Height of the data rows
          dividerThickness: 1, // Thickness of the divider between rows
        ),
      ),
    ),
  );
}
}

class Srecord {
  late String Status; // Changed 'Name' to 'Status'
  late String Rollno;
  late String Club;
  late String Achievements;

  Srecord({
    String? Status, // Changed to nullable string
    String? Rollno, // Changed to nullable string
    String? Club, // Changed to nullable string
    String? Achievements, // Changed to nullable string
  }) {
    this.Status = Status ?? "default-status"; // Use default value if null
    this.Rollno = Rollno ?? "000000"; // Use default value if null
    this.Club = Club ?? "default-club"; // Use default value if null
    this.Achievements = Achievements ?? "default-achievements"; // Use default value if null
  }
}







