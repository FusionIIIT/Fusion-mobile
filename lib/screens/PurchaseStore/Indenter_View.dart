import 'package:flutter/material.dart';

import 'package:fusion/Components/side_drawer.dart';

class IndentView extends StatefulWidget {
  @override
  _IndentViewPageState createState() => _IndentViewPageState();
}

class _IndentViewPageState extends State<IndentView> {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = '';
    return Scaffold(
      appBar:  AppBar(



        title: Text('Indent Form'),
        backgroundColor: Colors.deepOrangeAccent,// Add your text here

      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          SizedBox(
          width: 1000, // Custom width for the card
          child: Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name of Indenter:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8), // Custom vertical spacing
                  Text(
                    'Shyam',
                    style: TextStyle(fontSize: 18,),
                  ),
                ],
              ),
            ),
          ),
        ),

            Row(
               children: [
                 SizedBox(
                   width: 120, // Custom width for the card
                   child: Card(
                     elevation: 3,
                     child: Padding(
                       padding: EdgeInsets.all(16),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Designation:',
                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                           ),
                           SizedBox(height: 8), // Custom vertical spacing
                           Text(
                             'Caretaker',
                             style: TextStyle(fontSize: 15,),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 120, // Custom width for the card
                   child: Card(
                     elevation: 3,
                     child: Padding(
                       padding: EdgeInsets.all(16),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Item name:',
                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                           ),
                           SizedBox(height: 8), // Custom vertical spacing
                           Text(
                             'fan',
                             style: TextStyle(fontSize: 15,),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 120, // Custom width for the card
                   child: Card(
                     elevation: 3,
                     child: Padding(
                       padding: EdgeInsets.all(16),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Quantity',
                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                           ),
                           SizedBox(height: 8), // Custom vertical spacing
                           Text(
                             '30',
                             style: TextStyle(fontSize: 15,),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),


               ],



            ),
            Row(
              children: [
                SizedBox(
                  width: 150, // Custom width for the card
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Present Stock:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8), // Custom vertical spacing
                          Text(
                            '295',
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150, // Custom width for the card
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimated Cost:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8), // Custom vertical spacing
                          Text(
                            '450000',
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



              ],



            ),
            Row(
              children: [
                SizedBox(
                  width: 200, // Custom width for the card
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Purchase And Justification:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8), // Custom vertical spacing
                          Text(
                            'for hostel Students',
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150, // Custom width for the card
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item Type:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8), // Custom vertical spacing
                          Text(
                            'Electronics',
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



              ],



            ),



            SizedBox(
              width: 800, // Custom width for the card
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'If Replace(give details)',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8), // Custom vertical spacing
                      Text(
                        'NA',
                        style: TextStyle(fontSize: 15,),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Row(
              children: [
                SizedBox(
                  width: 150, // Custom width for the card
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Budgetary Head:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8), // Custom vertical spacing
                          Text(
                            'NA',
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150, // Custom width for the card
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expected Delivery',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8), // Custom vertical spacing
                          Text(
                            '29/02/2024',
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



              ],




            ),

            SizedBox(
              width: 150, // Custom width for the card
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Source of Supply',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8), // Custom vertical spacing
                      Text(
                        'source',
                        style: TextStyle(fontSize: 15,),
                      ),
                    ],
                  ),
                ),
              ),
            ),





















            Row(
                children:[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0), // Add padding between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed callback here
                        print('Reject');
                      },
                      child: Text(
                        'Reject',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF36C35)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0), // Add padding between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed callback here
                        print('approve');
                      },
                      child: Text(
                        'Approve',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  )
                ]
            ),


          ],
        ),
      ),
    );

  }
}
class DesignationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Custom width for the card
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Designation:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8), // Custom vertical spacing
              Text(
                'Caretaker',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


