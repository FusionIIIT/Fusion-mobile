import 'package:flutter/material.dart';
import 'dart:ui';

class AchievementsMenu extends StatelessWidget {
  final List? achievementData;
  const AchievementsMenu({Key? key, this.achievementData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      padding: EdgeInsets.all((5.0)),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          this.achievementData != null && this.achievementData!.isNotEmpty
              ? Container(
                  // Achievements Container
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        //Achievements Heading Container
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0)),
                            color: Colors.grey),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Expanded(
                                child: Text(
                                  'Achievements',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(7.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            SizedBox(height: 5),
                            //Traversing through the list of achievements from the API
                            for (var achievement in this.achievementData!)
                              //Achievements Data Container
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Colors.white54,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8.0, 4.0, 8.0, 4.0),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  //Achievements Name
                                                  Text(
                                                    'Achievement Name : ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    achievement['achievement'],
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8.0, 4.0, 8.0, 4.0),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  //Achievements Type
                                                  Text(
                                                    'Type : ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    achievement[
                                                        'achievement_type'],
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              8.0,
                                              4.0,
                                              8.0,
                                              4.0,
                                            ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  //Achievements Date
                                                  Text(
                                                    'Date : ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    achievement['date_earned'],
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              8.0,
                                              4.0,
                                              8.0,
                                              4.0,
                                            ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  //Achievements Issuer
                                                  Text(
                                                    'Issuer :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    achievement['issuer'],
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              8.0,
                                              4.0,
                                              8.0,
                                              4.0,
                                            ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  //Achievements Description
                                                  Text(
                                                    'Description :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    achievement['description'],
                                                  ),
                                                ]),
                                          ),
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
                )
              : Container(),
          this.achievementData != null && this.achievementData!.isNotEmpty
              ? SizedBox(height: 20)
              : Container(),
          // Add an Achievement Container
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Container(
                  //Add a new Achievement Container
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      color: Colors.grey),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Add a new Achievement',
                        ),
                      ),
                      ElevatedButton(
                        child: Text(
                          'Add',
                        ),
                        onPressed: () => {
                          //Edit Function
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Container(
                        //Add an Achievement Name Container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0),
                                ),
                                color: Colors.grey,
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Achievement Name',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // Body
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                ),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Type Container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Type',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                ),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Date Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Date',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: InputDatePickerFormField(
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
                        // Issuer Container
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('Issuer'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey.shade300),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
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
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                  color: Colors.grey),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Description',
                                    ),
                                  ),
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
                                  color: Colors.grey.shade300,
                                ),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: '',
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
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
