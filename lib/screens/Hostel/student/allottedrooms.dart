import 'dart:convert';
import 'package:flutter/material.dart';

// Updated JSON data representing hostel details with room numbers
const String hostelData = '''
[
  {
    "hostelNumber": 1,
    "students": [
      {"name": "Student 1", "rollNumber": "21bcs01", "program": "BTECH", "room": "F101"},
      {"name": "Student 2", "rollNumber": "21bcs02", "program": "BTECH", "room": "F101"},
      {"name": "Student 3", "rollNumber": "21bcs03", "program": "BTECH", "room": "F102"},
      {"name": "Student 4", "rollNumber": "21bcs04", "program": "BTECH", "room": "F102"},
      {"name": "Student 5", "rollNumber": "21bcs05", "program": "BTECH", "room": "S102"},
      {"name": "Student 6", "rollNumber": "21bcs06", "program": "BTECH", "room": "S102"},
      {"name": "Student 7", "rollNumber": "21bcs07", "program": "BTECH", "room": "S103"},
      {"name": "Student 8", "rollNumber": "21bcs08", "program": "BTECH", "room": "S103"},
      {"name": "Student 9", "rollNumber": "21bcs09", "program": "BTECH", "room": "F103"},
      {"name": "Student 10", "rollNumber": "21bcs10", "program": "BTECH", "room": "F103"}
    ]
  },
  {
    "hostelNumber": 2,
    "students": [
      {"name": "Student 11", "rollNumber": "22bcs01", "program": "BTECH", "room": "F201"},
      {"name": "Student 12", "rollNumber": "22bcs02", "program": "BTECH", "room": "F201"},
      {"name": "Student 13", "rollNumber": "22bcs03", "program": "BTECH", "room": "F202"},
      {"name": "Student 14", "rollNumber": "22bcs04", "program": "BTECH", "room": "F202"},
      {"name": "Student 15", "rollNumber": "22bcs05", "program": "BTECH", "room": "S202"},
      {"name": "Student 16", "rollNumber": "22bcs06", "program": "BTECH", "room": "S202"},
      {"name": "Student 17", "rollNumber": "22bcs07", "program": "BTECH", "room": "S203"},
      {"name": "Student 18", "rollNumber": "22bcs08", "program": "BTECH", "room": "S203"},
      {"name": "Student 19", "rollNumber": "22bcs09", "program": "BTECH", "room": "F203"},
      {"name": "Student 20", "rollNumber": "22bcs10", "program": "BTECH", "room": "F203"}
    ]
  },
  {
    "hostelNumber": 3,
    "students": [
      {"name": "Student 21", "rollNumber": "23bcs01", "program": "BTECH", "room": "F301"},
      {"name": "Student 22", "rollNumber": "23bcs02", "program": "BTECH", "room": "F301"},
      {"name": "Student 23", "rollNumber": "23bcs03", "program": "BTECH", "room": "F302"},
      {"name": "Student 24", "rollNumber": "23bcs04", "program": "BTECH", "room": "F302"},
      {"name": "Student 25", "rollNumber": "23bcs05", "program": "BTECH", "room": "S302"},
      {"name": "Student 26", "rollNumber": "23bcs06", "program": "BTECH", "room": "S302"},
      {"name": "Student 27", "rollNumber": "23bcs07", "program": "BTECH", "room": "S303"},
      {"name": "Student 28", "rollNumber": "23bcs08", "program": "BTECH", "room": "S303"},
      {"name": "Student 29", "rollNumber": "23bcs09", "program": "BTECH", "room": "F303"},
      {"name": "Student 30", "rollNumber": "23bcs10", "program": "BTECH", "room": "F303"}
    ]
  },
  {
    "hostelNumber": 4,
    "students": [
      {"name": "Student 31", "rollNumber": "24bcs01", "program": "BTECH", "room": "F401"},
      {"name": "Student 32", "rollNumber": "24bcs02", "program": "BTECH", "room": "F401"},
      {"name": "Student 33", "rollNumber": "24bcs03", "program": "BTECH", "room": "F402"},
      {"name": "Student 34", "rollNumber": "24bcs04", "program": "BTECH", "room": "F402"},
      {"name": "Student 35", "rollNumber": "24bcs05", "program": "BTECH", "room": "S402"},
      {"name": "Student 36", "rollNumber": "24bcs06", "program": "BTECH", "room": "S402"},
      {"name": "Student 37", "rollNumber": "24bcs07", "program": "BTECH", "room": "S403"},
      {"name": "Student 38", "rollNumber": "24bcs08", "program": "BTECH", "room": "S403"},
      {"name": "Student 39", "rollNumber": "24bcs09", "program": "BTECH", "room": "F403"},
      {"name": "Student 40", "rollNumber": "24bcs10", "program": "BTECH", "room": "F403"}
    ]
  }
]
''';

class Allottedrooms extends StatefulWidget {
  @override
  _AllottedroomsState createState() => _AllottedroomsState();
}

class _AllottedroomsState extends State<Allottedrooms> {
  final List<Map<String, dynamic>> hostels =
  (json.decode(hostelData) as List)
      .map((i) => i as Map<String, dynamic>)
      .toList();
  String? selectedHostel;

  @override
  void initState() {
    super.initState();
    selectedHostel = hostels[0]['hostelNumber'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allotted Rooms'),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedHostel,
            onChanged: (String? newValue) {
              setState(() {
                selectedHostel = newValue;
              });
            },
            items: hostels.map<DropdownMenuItem<String>>((hostel) {
              return DropdownMenuItem<String>(
                value: hostel['hostelNumber'].toString(),
                child: Text(
                  'Hostel ${hostel['hostelNumber']}',
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Roll Number')),
                  DataColumn(label: Text('Program')),
                  DataColumn(label: Text('Room')),
                ],
                rows: (hostels.firstWhere(
                        (hostel) =>
                    hostel['hostelNumber'].toString() ==
                        selectedHostel)['students'] as List)
                    .map<DataRow>((student) {
                  return DataRow(
                    cells: [
                      DataCell(Text(student['name'])),
                      DataCell(Text(student['rollNumber'])),
                      DataCell(Text(student['program'])),
                      DataCell(Text(student['room'])),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Allottedrooms(),
  ));
}
