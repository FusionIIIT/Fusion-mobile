import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class GeneratedBillsRequestsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Generated Bills Requests', // Changed heading to "Generated Bills Requests"
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 74, 73, 73),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Added spacing between heading and box
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30), // Added margin
                  padding: EdgeInsets.all(10), // Added padding
                  decoration: BoxDecoration(
                    color: Colors.orange[50], // Background color of the box
                    borderRadius: BorderRadius.circular(10), // Border radius
                    border: Border.all(
                        color: Colors.deepOrange), // Border color and width
                  ),
                  child: FutureBuilder<List<Map<String, String>>>(
                    future: fetchData(), // Function to fetch data from backend
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors
                                          .deepOrange), // Bottom partition line
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ID',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold), // Bold font
                                  ),
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Container(
                                      width: 1,
                                      color: Colors.grey), // Vertical line
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold), // Bold font
                                  ),
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Container(
                                      width: 1,
                                      color: Colors.grey), // Vertical line
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Text(
                                    'Created By',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold), // Bold font
                                  ),
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Container(
                                      width: 1,
                                      color: Colors.grey), // Vertical line
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Text(
                                    'Bill',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold), // Bold font
                                  ),
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Container(
                                      width: 1,
                                      color: Colors.grey), // Vertical line
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Text(
                                    'Send to',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold), // Bold font
                                  ),
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                  Container(
                                      width: 1,
                                      color: Colors.grey), // Vertical line
                                  SizedBox(
                                      width: 5), // Added spacing between columns
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    10), // Added spacing between columns and data
                            Column(
                              children: snapshot.data!.map<Widget>((data) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(data['id']!),
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Container(
                                        width: 1,
                                        color: Colors.grey), // Vertical line
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Text(data['name']!),
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Container(
                                        width: 1,
                                        color: Colors.grey), // Vertical line
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Text(data['createdBy']!),
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Container(
                                        width: 1,
                                        color: Colors.grey), // Vertical line
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Text(data['bill']!),
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Container(
                                        width: 1,
                                        color: Colors.grey), // Vertical line
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Text(data['sendTo']!),
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                    Container(
                                        width: 1,
                                        color: Colors.grey), // Vertical line
                                    SizedBox(
                                        width:
                                            5), // Added spacing between columns
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dummy function to simulate fetching data from backend
  Future<List<Map<String, String>>> fetchData() async {
    // Simulating network delay
    await Future.delayed(Duration(seconds: 2));

    // Dummy data
    List<Map<String, String>> data = [
      {
        'id': '1',
        'name': 'Request 1',
        'createdBy': 'User 1',
        'bill': 'Bill 1',
        'sendTo': 'Recipient 1',
      },
      {
        'id': '2',
        'name': 'Request 2',
        'createdBy': 'User 2',
        'bill': 'Bill 2',
        'sendTo': 'Recipient 2',
      },
      // Add more data as needed
    ];

    return data;
  }
}
