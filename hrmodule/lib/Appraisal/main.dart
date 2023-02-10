import 'package:flutter/material.dart';
import 'package:hrmodule/main.dart';

void main() => runApp(AppraisalApp());

class AppraisalApp extends StatelessWidget {
  // const AppraisalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppraisalPage(),
    );
  }
}

class AppraisalPage extends StatelessWidget {
  // const AppraisalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appraisal",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => runApp(App()),
        ),
        actions: <Widget>[
          Icon(
            Icons.settings,
            color: Colors.white,
            size: 35.0,
          )
        ],
      ),
      body: AppraisalBody(),
    );
  }
}

class AppraisalBody extends StatelessWidget {
  // const AppraisalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        DefaultTabController(
          length: 3, // length of tabs
          initialIndex: 0,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: TabBar(
                    // isScrollable: true,
                    indicatorColor: Color.fromARGB(255, 0, 128, 128),
                    labelColor: Color.fromARGB(255, 0, 128, 128),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Appraisal\nForm'),
                      Tab(text: 'Active'),
                      Tab(text: 'Archived'),
                      // Tab(text: 'Tab 4'),
                    ],
                  ),
                ),
                Container(
                    height: 750, //height of TabBarView
                    // decoration: BoxDecoration(
                    //   border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    // ),
                    child: TabBarView(
                        // physics:,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(top: 20.0),
                            child: Center(
                              child: AppraisalForm(),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('No Active Request',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('No Archive Available',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ]))
              ]),
        )

        //create tabs here
      ]),
    );
  }
}

class AppraisalForm extends StatelessWidget {
  // const AppraisalForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.phone),
                  hintText: 'dd-mm-yyyy',
                  labelText: 'Start Date',
                  border: OutlineInputBorder(),
                  focusColor: Color.fromARGB(255, 0, 128, 128),
                  // focusedBorder: Color.fromARGB(255, 0, 128, 128),
                ),
              ),
              margin: EdgeInsets.only(bottom: 10.0),
            ),
            Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.calendar_today),
                  hintText: 'dd-mm-yyyy',
                  labelText: 'End Date',
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: ElevatedButton(
                  onPressed: () => {},
                  autofocus: true,
                  child: const Text(
                    'Filter',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 128, 128)))),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Divider(
                thickness: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  "Showing all the details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Divider(
                thickness: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: null,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter specific field knowledge',
                  labelText: 'Specific Field Knowledge',
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),
            Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: null,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter current research interest',
                  labelText: 'Current Research Interest',
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
              child: Divider(
                thickness: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("1.  INSTRUCTION ELEMENT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("1.1   Courses Taught at UG/PG Level",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Semester"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Course-Name"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Course Number"),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("1.2   New Courses/Laboratory experiments Introduced and Taught",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Course-Name",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Course Number",
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("UG/PG", style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("YEAR", style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child:
                              Text("Semester", style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Tutorial Hours/week",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: ElevatedButton(
                  onPressed: () => {},
                  autofocus: true,
                  child: const Text(
                    'Add New Course',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(239, 239, 239, 0.457)))),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("1.3   New Course Material / Instructional Software Developed",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Course-Name",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Course Number",
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("UG/PG", style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Type of Activity",
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Web/Public",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: ElevatedButton(
                  onPressed: () => {},
                  autofocus: true,
                  child: const Text(
                    'Add New Course Material',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(239, 239, 239, 0.457)))),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Divider(
                thickness: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.  RESEARCH ELEMENT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.1   Thesis/Research Supervision",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Name of Student (MTech/PhD)"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Title Of Thesis / Thesis Topic"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Year"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Semester"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                              "Status(Completed / Submitted / In progress)"),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.2   Sponsored Research and Consultancy Projects",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Title Of Project",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Sponsoring Agency / Organization",
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Project Funding (Rs.)",
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Project Duration",
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                              "Status(Completed / Submitted / In progress)",
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child:
                              Text("Remarks", style: TextStyle(fontSize: 12)),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.3   Other Research Element:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.4   Publication(s)",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.5   Conferences Attended:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top:15.0),
              child: Form(child: Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: null,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.6   Conferences Organized:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Name"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Venue"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Role"),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.7   Professional Recognition",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.7.1   Honours/Prizes/Awards/Fellowship etc.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Award Type"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Details"),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("2.7.2   Expert/Invited Lecture Delivered",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(top: 15.0),
              // padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(width: 1.0),
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 193)),
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Type"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Name"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Sponsoring Agency",
                            style: TextStyle(
                                fontSize: 11.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Venue"),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Role"),
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
              child: Divider(
                thickness: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("3.  ADMINISTRATION ASSIGNMENT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("3.1   Administrative Assignments:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top:15.0),
              child: Form(child: Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: null,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.calendar_today),
                  hintText: 'please mention institute/discipline level',
                  // labelText: 'Current Research Interest',
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("3.2   Service To Institute Community:  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top:15.0),
              child: Form(child: Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: null,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.calendar_today),
                  hintText: 'please mention institute/others',
                  // labelText: 'Current Research Interest',
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("3.3   Any Other Contribution:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0)),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top:15.0),
              child: Form(child: Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: null,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
              child: Divider(
                thickness: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text("4. SELF-APPRAISAL BY FACULTY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                      )
                    ]
                  )
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(top:15.0),
              child: Form(child: Container(
              child: TextFormField(
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: null,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.calendar_today),
                  hintText: 'Your comments on your performance so\nfar and this academic year particularly',
                  // labelText: 'Current Research Interest',
                  border: OutlineInputBorder(),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20.0),
            ),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
              child: Divider(
                thickness: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: ElevatedButton(
                  onPressed: () => {},
                  autofocus: true,
                  child: const Text(
                    'Submit Request',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 128, 128)))),
            ),
          ],
        ))
      ],
    );
  }
}
