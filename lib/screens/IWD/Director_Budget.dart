import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class BudgetApp extends StatelessWidget {
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
                'Budget',
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
                    Container(),
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
                            'Budget Issued',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold), // Bold font
                          ),
                          SizedBox(width: 5), // Added spacing between columns
                          Container(
                              width: 1, color: Colors.grey), // Vertical line
                          SizedBox(width: 5), // Added spacing between columns
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 10), // Added spacing between columns and data
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                        Text('Electrical'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                        Text('30000'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                      ],
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
                        Text('Civil'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
                        Text('30000'),
                        SizedBox(width: 5), // Added spacing between columns
                        Container(
                            width: 1, color: Colors.grey), // Vertical line
                        SizedBox(width: 5), // Added spacing between columns
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

void main() {
  runApp(BudgetApp());
}
