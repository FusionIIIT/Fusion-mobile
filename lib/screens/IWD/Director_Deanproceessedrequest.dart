import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class ProcessRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Color.fromARGB(255, 245, 103, 47),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dean Proposed Requests',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 74, 73, 73),
                  fontWeight: FontWeight.bold,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color:
                                  Colors.deepOrange), // Bottom partition line
                        ),
                      ),
                      child: Text(
                        'Details :',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            10), // Added spacing between heading and columns
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color:
                                  Colors.deepOrange), // Bottom partition line
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Id',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold), // Bold font
                          ),
                          SizedBox(width: 5), // Added spacing between columns
                          Container(
                              width: 1, color: Colors.grey), // Vertical line
                          SizedBox(width: 5), // Added spacing between columns
                          Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold), // Bold font
                          ),
                          SizedBox(width: 5), // Added spacing between columns
                          Container(
                              width: 1, color: Colors.grey), // Vertical line
                          SizedBox(width: 5), // Added spacing between columns
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold), // Bold font
                          ),
                          SizedBox(width: 5), // Added spacing between columns
                          Container(
                              width: 1, color: Colors.grey), // Vertical line
                          SizedBox(width: 5), // Added spacing between columns
                          Text(
                            'Area',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold), // Bold font
                          ),
                          SizedBox(width: 5), // Added spacing between columns
                          Container(
                              width: 1, color: Colors.grey), // Vertical line
                          SizedBox(width: 5), // Added spacing between columns
                          Text(
                            'Created By',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold), // Bold font
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 10), // Added spacing between columns and data
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                        Text('Proposal 1'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                        Text('Description 1'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                        Text('Area 1'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                        Text('John Doe'),
                      ],
                    ),
                    // You can add more rows here for additional data
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
