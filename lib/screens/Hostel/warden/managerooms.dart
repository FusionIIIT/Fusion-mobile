import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';


class Managerooms extends StatelessWidget {
  const Managerooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Manage Rooms'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: RoomDetailsPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Handle add button press
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 245, 103, 47), // Set background color to orange
      ),
    );
  }
}

class RoomDetailsPage extends StatelessWidget {
  const RoomDetailsPage({Key? key}) : super(key: key);

  // Demo data for student name and allotted room
  final String studentName = 'John Doe';
  final String allottedRoom = '101';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Room Number',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 245, 103, 47), // Set font color to orange
              fontWeight: FontWeight.bold, // Set font weight to bold
            ),
          ),
          trailing: DropdownButton<int>(
            value: selectedRoomNumber,
            onChanged: (int? newValue) {
              // TODO: Handle room number selection
            },
            items: roomNumbers.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), // Set font color to orange
                    fontSize: 20, // Set font size to 20px
                  ),
                ),
              );
            }).toList(),
            dropdownColor: Color.fromARGB(255, 255, 127, 23), // Set dropdown background color to light orange
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        // TODO: Display room details based on selected room number
        // Name of the student, allotted room, number of fan, light, cupboard, LAN port, chair, table, bed, etc.
        // TODO: Add option for new entry
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set container background color
              borderRadius: BorderRadius.circular(10), // Set container border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Set container shadow color
                  spreadRadius: 2, // Set container shadow spread radius
                  blurRadius: 5, // Set container shadow blur radius
                  offset: Offset(0, 3), // Set container shadow offset
                ),
              ],
            ),
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Fan'),
                  trailing: Checkbox(
                    value: isFanAvailable,
                    onChanged: (bool? newValue) {
                      // TODO: Handle fan availability change
                    },
                    activeColor: Color.fromARGB(255, 245, 103, 47), // Set active color to orange
                  ),
                ),
                ListTile(
                  title: const Text('Table'),
                  trailing: Checkbox(
                    value: isTableAvailable,
                    onChanged: (bool? newValue) {
                      // TODO: Handle table availability change
                    },
                    activeColor: Color.fromARGB(255, 245, 103, 47), // Set active color to orange
                  ),
                ),
                ListTile(
                  title: const Text('Chair'),
                  trailing: Checkbox(
                    value: isChairAvailable,
                    onChanged: (bool? newValue) {
                      // TODO: Handle chair availability change
                    },
                    activeColor: Color.fromARGB(255, 245, 103, 47), // Set active color to orange
                  ),
                ),
                ListTile(
                  title: const Text('Bed'),
                  trailing: Checkbox(
                    value: isBedAvailable,
                    onChanged: (bool? newValue) {
                      // TODO: Handle bed availability change
                    },
                    activeColor: Color.fromARGB(255, 245, 103, 47), // Set active color to orange
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Sample data for room numbers
List<int> roomNumbers = [101, 102, 103, 104];

// Selected room number
int? selectedRoomNumber;

// Availability of room items
bool isFanAvailable = true;
bool isTableAvailable = true;
bool isChairAvailable = true;
bool isBedAvailable = true;
