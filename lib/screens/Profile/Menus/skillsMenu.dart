import 'package:flutter/material.dart';
import 'dart:ui';

class skillsMenu extends StatelessWidget {
  const skillsMenu({
    Key key,
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
            // Skills and Technologies Container
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
                      Expanded(child: Text('Skills & Technologies')),
                      ElevatedButton(
                          child: Text('Add'),
                          onPressed: () => {
                            //Edit Function
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red)),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Container(
                        // Skill/Technology Container
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
                                  Expanded(child: Text('Skill/Technology')),
                                  // ElevatedButton(
                                  //     child: Text('Edit'),
                                  //     onPressed: ()=>{
                                  //       //Edit Function
                                  //     },
                                  //     style: ElevatedButton.styleFrom(
                                  //         primary: Colors.red)),
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
                                padding: EdgeInsets.fromLTRB(
                                    10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: 'Add new',
                                  decoration: InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        // Rate Container
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
                                  Expanded(child: Text('Rate')),
                                  // ElevatedButton(
                                  //     child: Text('Edit'),
                                  //     onPressed: ()=>{
                                  //       //Edit Rate
                                  //     },
                                  //     style: ElevatedButton.styleFrom(
                                  //         primary: Colors.red)),
                                ],
                              ),
                            ),
                            Container(
                              // Body of Menu
                              padding: EdgeInsets.all(7.0),
                              color: Colors.white24,
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.black),
                                    color: Colors.grey.shade300),
                                padding: EdgeInsets.fromLTRB(
                                    10.0, 1.0, 10.0, 1.0),
                                child: TextFormField(
                                  enabled: true,
                                  initialValue: 'Out of 100',
                                  decoration: InputDecoration(
                                      border: InputBorder.none),
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