import 'dart:convert';
import 'package:flutter/material.dart';

class Room {
  final int roomNumber;
  final int capacity;
  final int currentOccupancy;
  final String status;
  final List<String> studentNames;
  final int numberOfStudents;

  Room({
    required this.roomNumber,
    required this.capacity,
    required this.currentOccupancy,
    required this.status,
    required this.studentNames,
    required this.numberOfStudents,
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
      {"roomNumber": 101, "capacity": 2, "currentOccupancy": 1, "status": "Partially Allotted", "studentNames": ["John Doe"], "numberOfStudents": 1},
      {"roomNumber": 102, "capacity": 3, "currentOccupancy": 2, "status": "Fully Allotted", "studentNames": ["Alice", "Bob"], "numberOfStudents": 2},
      {"roomNumber": 103, "capacity": 4, "currentOccupancy": 4, "status": "Fully Allotted", "studentNames": ["Charlie", "David", "Eve", "Frank"], "numberOfStudents": 4},
    ]
    ''';
    final List<dynamic> roomList = json.decode(roomData);
    setState(() {
      rooms = roomList.map((room) => Room(
        roomNumber: room['roomNumber'],
        capacity: room['capacity'],
        currentOccupancy: room['currentOccupancy'],
        status: room['status'],
        studentNames: List<String>.from(room['studentNames']),
        numberOfStudents: room['numberOfStudents'],
      )).toList();
      filteredRooms = List.from(rooms);
    });
  }

  Future<void> _editStudentDetails(Room room) async {
    // Display dialog to edit student details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Implement the edit room details dialog
        return AlertDialog(
          title: Text('Edit Student Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add fields to edit student details
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
                // Perform the edit operation here
                // Update the room details
                // Simulate POST API call to update room details
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteStudentDetails(Room room) async {
    // Show confirmation dialog before deleting the student
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete the student?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Delete the student from the room
                _deleteStudent(room);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteStudent(Room room) {
    setState(() {
      // Implement logic to delete the student from the room
    });
    // Simulate DELETE API call to delete student details
  }

  Future<void> _showAddDialog() async {
    // Implement add student to room dialog
  }

  void _searchRooms(int roomNumber) {
    setState(() {
      if (roomNumber != 0) {
        filteredRooms = rooms.where((room) => room.roomNumber == roomNumber).toList();
      } else {
        filteredRooms.clear(); // Clear filtered list if no search is active
        filteredRooms.addAll(rooms); // Repopulate with all rooms
      }
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
              final int? result = await showSearch<int?>(
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
            DataColumn(label: Text('Capacity')),
            DataColumn(label: Text('Current Occupancy')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Student Names')),
            DataColumn(label: Text('No of Students')),
            DataColumn(label: Text('Edit')),
            DataColumn(label: Text('Delete')),
            DataColumn(label: Text('Add')),
          ],
          rows: filteredRooms.map((room) {
            return DataRow(cells: <DataCell>[
              DataCell(Text(room.roomNumber.toString())),
              DataCell(Text(room.capacity.toString())),
              DataCell(Text(room.currentOccupancy.toString())),
              DataCell(Text(room.status)),
              DataCell(Text(room.studentNames.join(', '))),
              DataCell(Text(room.numberOfStudents.toString())),
              DataCell(
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editStudentDetails(room);
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
              DataCell(
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _showAddDialog();
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
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Room No: ${rooms[index].roomNumber}'),
          onTap: () {
            close(context, rooms[index].roomNumber);
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
