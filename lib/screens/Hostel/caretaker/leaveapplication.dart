import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/side_drawer.dart';

class Leaveapplication extends StatelessWidget {
  const Leaveapplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Leave Application'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Container(
            width: double.infinity, // Prevent horizontal scrolling
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                  255, 245, 103, 47), // Change to orange color
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: const Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 30, bottom: 10),
                            child: const Text(
                              '21bcs198',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Align vertically center
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width - 40,
                                        height: 70, // Set the height to 30px
                                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Leave Form
                                          },
                                          child: const Text('Leave Form', style: TextStyle(color: Colors.white)),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(255, 245, 103, 47), // Add background color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5), // Set border radius to 5px
                                            ),
                                            
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                // Approve
                                              },
                                              icon: Icon(Icons.check, color: Colors.white),
                                              label: const Text('Approve', style: TextStyle(color: Colors.white)),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5), // Set border radius to 5px
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                // Cancel
                                              },
                                              icon: Icon(Icons.close, color: Colors.white),
                                              label: const Text('Cancel', style: TextStyle(color: Colors.white)),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5), // Set border radius to 5px
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 30, bottom: 10),
                            child: const Text(
                              '21bcs199',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Align vertically center
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width - 40,
                                        height: 70, // Set the height to 30px
                                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Leave Form
                                          },
                                          child: const Text('Leave Form', style: TextStyle(color: Colors.white)),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(255, 245, 103, 47), // Add background color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5), // Set border radius to 5px
                                            ),
                                            
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                // Approve
                                              },
                                              icon: Icon(Icons.check, color: Colors.white),
                                              label: const Text('Approve', style: TextStyle(color: Colors.white)),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5), // Set border radius to 5px
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                // Cancel
                                              },
                                              icon: Icon(Icons.close, color: Colors.white),
                                              label: const Text('Cancel', style: TextStyle(color: Colors.white)),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5), // Set border radius to 5px
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
