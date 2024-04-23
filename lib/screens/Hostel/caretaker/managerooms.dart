
import 'dart:convert';
import 'package:flutter/material.dart';

class Room {
  final int roomNumber;
  final int capacity;

  late int currentOccupancy;
  late String status;
  List<String> studentNames;
  List<String> studentRollNumbers;


  Room({
    required this.roomNumber,
    required this.capacity,
    required this.currentOccupancy,
    required this.status,
    required this.studentNames,

    required this.studentRollNumbers,

  });
}

class Managerooms extends StatefulWidget {
  const Managerooms({Key? key}) : super(key: key);

  @override
  _ManageroomsState createState() => _ManageroomsState();
}

class _ManageroomsState extends State<Managerooms> {
  List<Room> rooms = [];
  List<Room> filteredRooms = [];

  @override
  void initState() {
    super.initState();
    _fetchRoomDetails();
  }

  Future<void> _fetchRoomDetails() async {
    // Simulating GET API call to fetch room details
    final String roomData = '''
    [
      {"roomNumber": 101, "capacity": 2, "currentOccupancy": 1, "status": "Partially Allotted", "studentNames": ["Raman"], "studentRollNumbers": ["21bcs200"]},
      {"roomNumber": 102, "capacity": 3, "currentOccupancy": 2, "status": "Partially Allotted", "studentNames": ["Naman", "Ramu"], "studentRollNumbers": ["22bme041", "22bsm045"]},
      {"roomNumber": 103, "capacity": 3, "currentOccupancy": 3, "status": "Fully Allotted", "studentNames": ["Surya", "Divyanshu", "Raju"], "studentRollNumbers": ["21bcs101", "21bcs102", "21bcs103"]},
      {"roomNumber": 104, "capacity": 4, "currentOccupancy": 0, "status": "Unallotted", "studentNames": [], "studentRollNumbers": []},
      {"roomNumber": 105, "capacity": 2, "currentOccupancy": 2, "status": "Fully Allotted", "studentNames": ["John", "Doe"], "studentRollNumbers": ["22bcs001", "22bcs002"]}
    ]
    ''';
    final List<dynamic> roomList = json.decode(roomData);
    setState(() {
      rooms = roomList.map((room) =>
          Room(
            roomNumber: room['roomNumber'] as int,
            capacity: room['capacity'] as int,
            currentOccupancy: room['currentOccupancy'] as int,
            status: room['status'] as String,
            studentNames: List<String>.from(
                room['studentNames'] as List<dynamic>),
            studentRollNumbers: List<String>.from(
                room['studentRollNumbers'] as List<dynamic>),
          )).toList();
      filteredRooms = List.from(rooms);
    });
  }

  Future<void> _editStudentDetails(Room room) async {
    List<String> updatedNames = List.from(room.studentNames);
    List<String> updatedRollNumbers = List.from(room.studentRollNumbers);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Student Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < room.currentOccupancy; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Student-${i + 1}:'),
                      TextField(
                        controller: TextEditingController(
                            text: room.studentNames[i]),
                        onChanged: (value) {
                          updatedNames[i] = value;
                        },
                      ),
                      Text('Roll.No-${i + 1}:'),
                      TextField(
                        controller: TextEditingController(
                            text: room.studentRollNumbers[i]),
                        onChanged: (value) {
                          updatedRollNumbers[i] = value;
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                bool valid = true;
                for (int i = 0; i < updatedNames.length; i++) {
                  if ((updatedNames[i].isNotEmpty &&
                      updatedRollNumbers[i].isEmpty) ||
                      (updatedRollNumbers[i].isNotEmpty &&
                          updatedNames[i].isEmpty)) {
                    valid = false;
                    break;
                  }
                }
                if (valid) {
                  setState(() {
                    room.studentNames = updatedNames.toList();
                    room.studentRollNumbers = updatedRollNumbers.toList();
                    room.currentOccupancy = room.studentNames.length;
                    room.status = room.currentOccupancy == room.capacity
                        ? "Fully Allotted"
                        : "Partially Allotted";
                  });
                  Navigator.of(context).pop();
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'Please fill in both Student and Roll.No fields for each student.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteStudentDetails(Room room) async {
    List<String> studentNames = List.from(room.studentNames);
    List<String> studentRollNumbers = List.from(room.studentRollNumbers);

    if (studentNames.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No Students Found'),
            content: Text('There are no students in this room to delete.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    String? selectedStudent;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Student to Delete'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(studentNames.length, (index) {
              return RadioListTile<String>(
                title: Text('${studentNames[index]} (${studentRollNumbers[index]})'),
                value: studentNames[index],
                groupValue: selectedStudent,
                onChanged: (value) {
                  setState(() {
                    selectedStudent = value;
                  });
                },
              );
            }),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedStudent != null) {
                  setState(() {
                    int index = room.studentNames.indexOf(selectedStudent!);
                    room.studentNames.removeAt(index);
                    room.studentRollNumbers.removeAt(index);
                    room.currentOccupancy--;
                    room.status = room.currentOccupancy == 0
                        ? "Unallotted"
                        : "Partially Allotted";
                  });
                  Navigator.of(context).pop();
                } else {
                  // Handle the case when selectedStudent is null
                  print('No student selected to delete.');
                }
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }


  Future<void> _showAddDialog(Room room) async {
    if (room.status == "Unallotted" || room.status == "Partially Allotted") {
      String studentName = '';
      String studentRollNumber = '';

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Student'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    studentName = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Student Name',
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    studentRollNumber = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Student Roll.No',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    room.studentNames.add(studentName);
                    room.studentRollNumbers.add(studentRollNumber);
                    room.currentOccupancy++;
                    room.status = room.currentOccupancy == room.capacity ? "Fully Allotted" : "Partially Allotted";
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Add'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('You can only add students to "Unallotted" or "Partially Allotted" rooms only.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _searchRooms(String query) {
    setState(() {
      filteredRooms = rooms.where((room) {
        final roomNumberMatches = room.roomNumber.toString().contains(query);
        final statusMatches = room.status.toLowerCase().contains(query.toLowerCase());
        final nameMatches = room.studentNames.any((name) => name.toLowerCase().contains(query.toLowerCase()));
        final rollMatches = room.studentRollNumbers.any((roll) => roll.toLowerCase().contains(query.toLowerCase()));
        return roomNumberMatches || statusMatches || nameMatches || rollMatches;
      }).toList();

      // Sort the filtered rooms based on relevance to the search query
      filteredRooms.sort((a, b) {
        final aRoomNumberMatches = a.roomNumber.toString().contains(query);
        final bRoomNumberMatches = b.roomNumber.toString().contains(query);
        final aStatusMatches = a.status.toLowerCase().contains(query.toLowerCase());
        final bStatusMatches = b.status.toLowerCase().contains(query.toLowerCase());
        final aNameMatches = a.studentNames.any((name) => name.toLowerCase().contains(query.toLowerCase()));
        final bNameMatches = b.studentNames.any((name) => name.toLowerCase().contains(query.toLowerCase()));
        final aRollMatches = a.studentRollNumbers.any((roll) => roll.toLowerCase().contains(query.toLowerCase()));
        final bRollMatches = b.studentRollNumbers.any((roll) => roll.toLowerCase().contains(query.toLowerCase()));

        if (aRoomNumberMatches && !bRoomNumberMatches) {
          return -1;
        } else if (!aRoomNumberMatches && bRoomNumberMatches) {
          return 1;
        } else if (aStatusMatches && !bStatusMatches) {
          return -1;
        } else if (!aStatusMatches && bStatusMatches) {
          return 1;
        } else if (aNameMatches && !bNameMatches) {
          return -1;
        } else if (!aNameMatches && bNameMatches) {
          return 1;
        } else if (aRollMatches && !bRollMatches) {
          return -1;
        } else if (!aRollMatches && bRollMatches) {
          return 1;
        } else {
          return 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Rooms'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? result = await showSearch<String?>(
                context: context,
                delegate: RoomSearchDelegate(rooms: rooms),
              );
              if (result != null) {
                _searchRooms(result);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Room No')),
            DataColumn(label: Text('Room Capacity')),
            DataColumn(label: Text('Current Occupancy')),
            DataColumn(label: Text('Current Status')),
            DataColumn(label: Text('Student Names')),
            DataColumn(label: Text('Roll.No of Students')),
            DataColumn(label: Text('Edit')),
            DataColumn(label: Text('Add')),
            DataColumn(label: Text('Delete')),
          ],
          rows: filteredRooms.map((room) {
            return DataRow(cells: <DataCell>[
              DataCell(Text(room.roomNumber.toString())),
              DataCell(Text(room.capacity.toString())),
              DataCell(Text(room.currentOccupancy.toString())),
              DataCell(Text(room.status)),
              DataCell(Text(room.studentNames.join(', '))),
              DataCell(Text(room.studentRollNumbers.join(', '))),
              DataCell(
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    if (room.status != "Unallotted") {
                      _editStudentDetails(room);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Text('You can edit students in "Partially Allotted" or "Fully Allotted" rooms only.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              DataCell(
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _showAddDialog(room);
                  },
                ),
              ),
              DataCell(
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteStudentDetails(room);
                  },
                ),
              ),
            ]);

          }).toList(),
        ),
      ),
    );
  }
}


class RoomSearchDelegate extends SearchDelegate<int?> {
  final List<Room> rooms;

  RoomSearchDelegate({required this.rooms});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.scaffoldBackgroundColor, // Match with screen's UI theme
        iconTheme: IconThemeData(color: theme.primaryColor), // Match with screen's UI theme
      ),
    );
  }

  @override


  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {

    final List<Room> suggestionList = query.isEmpty
        ? rooms
        : rooms.where((room) {
      final roomNumberMatches = room.roomNumber.toString().contains(query);
      final statusMatches = room.status.toLowerCase().contains(
          query.toLowerCase());
      final nameMatches = room.studentNames.any((name) =>
          name.toLowerCase().contains(query.toLowerCase()));
      final rollMatches = room.studentRollNumbers.any((roll) =>
          roll.toLowerCase().contains(query.toLowerCase()));
      return roomNumberMatches || statusMatches || nameMatches || rollMatches;
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final Room room = suggestionList[index];
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Room No: ${room.roomNumber}'),
              Text('Status: ${room.status}'),
              Text('Students: ${room.studentNames.join(", ")}'),
              Text('Roll Numbers: ${room.studentRollNumbers.join(", ")}'),
            ],
          ),
          onTap: () {
            close(context, suggestionList[index].roomNumber.toString());

          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Managerooms(),
  ));
}
