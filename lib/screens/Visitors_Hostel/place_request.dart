import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class PlaceRequest extends StatefulWidget {
  @override
  _PlaceRequestState createState() => _PlaceRequestState();
}

class _PlaceRequestState extends State<PlaceRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: DefaultAppBar().visitorHostelAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 247, 247),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Arrival Date'),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              ).then((selectedDate) {
                                // handle selected arrival date
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color.fromARGB(255, 243, 33, 33),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Select Date'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Arrival Time'),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((selectedTime) {
                                // handle selected arrival time
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color.fromARGB(255, 243, 33, 33),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Select Time'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Departure Date'),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              ).then((selectedDate) {
                                // handle selected departure date
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color.fromARGB(255, 243, 33, 33),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Select Date'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Departure Time'),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((selectedTime) {
                                // handle selected departure time
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color.fromARGB(255, 243, 33, 33),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Select Time'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Number of People'),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // handle decreasing number of people
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color.fromARGB(255, 243, 33, 33),
                                      width: 1,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.remove,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('0'),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // handle increasing number of people
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color.fromARGB(255, 243, 33, 33),
                                      width: 1,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Number of Rooms'),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // handle decreasing number of rooms
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color.fromARGB(255, 243, 33, 33),
                                      width: 1,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.remove,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('0'),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // handle increasing number of rooms
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color.fromARGB(255, 243, 33, 33),
                                      width: 1,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 243, 33, 33),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Category'),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color.fromARGB(255, 243, 33, 33),
                                  width: 1,
                                ),
                              ),
                              width: 100,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              child: DropdownButton<String>(
                                value: 'A',
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 243, 33, 33),
                                ),
                                underline: SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    // handle updating category
                                  });
                                },
                                items: <String>[
                                  'A',
                                  'B',
                                  'C',
                                  'D'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Purpose of Visit'),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color.fromARGB(255, 243, 33, 33),
                                  width: 1,
                                ),
                              ),
                              width: 150,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    // handle updating purpose of visit
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text('Remarks'),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(255, 243, 33, 33),
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 300,
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (String value) {
                            setState(() {
                              // handle updating remarks
                            });
                          },
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
    );
  }
}
