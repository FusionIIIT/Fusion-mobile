import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/side_drawer.dart';

class Complaintregister extends StatelessWidget {
  const Complaintregister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  SideDrawer(),
      appBar: AppBar(
        title: const Text('Complaint Register'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0), // Add padding to the body
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.5, // Adjust the aspect ratio to make the cards horizontally rectangular
          children: List.generate(
            roomNumbers.length,
            (index) => InkWell(
              onTap: () {
                // Navigate to a new screen when the card is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(roomNumber: roomNumbers[index])),
                );
              },
              child: Card(
                color: Color.fromARGB(255, 245, 103, 47),
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding to make the cards compact
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          roomNumbers[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set the text color to white
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.white), // Set the arrow color to white
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String roomNumber;

  const DetailScreen({Key? key, required this.roomNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room $roomNumber Details'),
      ),
      body: Center(
        child: Text(
          'Room $roomNumber Details',
          style: TextStyle(
            color: Colors.white, // Set the text color to white
          ),
        ),
      ),
    );
  }
}

List<String> roomNumbers = [
  '101',
  '102',
  '103',
  '104',
  '105',
  '106',
  '107',
  '108',
  '109',
  '110',
];
