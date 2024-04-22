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
                // Implement search functionality here if needed
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredRooms.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                title: Text('Room Number: ${filteredRooms[index].roomNumber}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Capacity: ${filteredRooms[index].capacity}'),
                    Text('Current Occupancy: ${filteredRooms[index].currentOccupancy}'),
                    Text('Status: ${filteredRooms[index].status}'),
                    Text('Student Names: ${filteredRooms[index].studentNames.join(', ')}'),
                    Text('Number of Students: ${filteredRooms[index].numberOfStudents}'),
                  ],
                ),
              ),
            ),
          );
        },
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
