import 'package:flutter/material.dart';
import 'dart:ui';

//TODO: Camel Case
class educationMenu extends StatelessWidget {
  const educationMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      padding: EdgeInsets.all((5.0)),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            // Education Container
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Container(
                  //Label + Edit Button
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0)),
                      color: Colors.grey),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('Add new Education Qualification')),
                      ElevatedButton(
                          child: Text('Add'),
                          onPressed: () => {
                                //Edit Function
                              },
                          style: ElevatedButton.styleFrom(primary: Colors.red)),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Container(
                        // Degree Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Degree')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Stream Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Stream')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Start Date Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Start Date')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: InputDatePickerFormField(
                                  //enabled: true,
                                  initialDate: DateTime.utc(2000, 01, 01),
                                  firstDate: DateTime.utc(2000, 01, 01),
                                  lastDate: DateTime.now(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // End Date Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('End Date')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: InputDatePickerFormField(
                                  //enabled: true,
                                  initialDate: DateTime.utc(2000, 01, 01),
                                  firstDate: DateTime.utc(2000, 01, 01),
                                  lastDate: DateTime.now(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Institute Name Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Institute Name')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Grade Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Grade')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            // Certificate Courses Container
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Container(
                  //Label + Edit Button
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0)),
                      color: Colors.grey),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('Add a new Course')),
                      ElevatedButton(
                          child: Text('Add'),
                          onPressed: () => {
                                //Edit Function
                              },
                          style: ElevatedButton.styleFrom(primary: Colors.red)),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Container(
                        // Course Name Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Course Name')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // License Number Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('License Number')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Start Date Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Start Date')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: InputDatePickerFormField(
                                  //enabled: true,
                                  initialDate: DateTime.utc(2000, 01, 01),
                                  firstDate: DateTime.utc(2000, 01, 01),
                                  lastDate: DateTime.now(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // End Date Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('End Date')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: InputDatePickerFormField(
                                  //enabled: true,
                                  initialDate: DateTime.utc(2000, 01, 01),
                                  firstDate: DateTime.utc(2000, 01, 01),
                                  lastDate: DateTime.now(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Description Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //Label + Edit Button
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Description')),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
