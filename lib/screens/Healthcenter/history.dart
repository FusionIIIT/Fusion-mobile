import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/models/health.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final HealthData data =
    ModalRoute.of(context)!.settings.arguments as HealthData;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 5, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          //color: Colors.deepOrangeAccent,
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Colors.deepOrange,
                            indicatorColor: Colors.deepOrangeAccent,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Prescription",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Ambulance",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Hospital",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Appointment",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Feedback",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 520, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              prescription(data),
                              ambulance(data),
                              hospital(data),
                              appointment(data),
                              feedback(data),
                            ]))
                      ])),
            ]),
      ),
    );
  }

  Container feedback(HealthData data) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Table(border: TableBorder.all(color: Colors.black), children: [
        TableRow(children: [
          tableCell("\nFeeback\n"),
          tableCell("\nResponse\n"),
          tableCell("\nDate\n"),
        ]),
        data.complaints != null && data.complaints!.isNotEmpty
            ? TableRow(children: [
          for (var complaints in data.complaints!)
            tableCell2("\n" + complaints["feedback"].toString() + "\n"),
          for (var complaints in data.complaints!)
            tableCell2("\n" + complaints["complaint"].toString() + "\n"),
          for (var complaints in data.complaints!)
            tableCell2("\n" + complaints["date"].toString() + "\n"),
        ])
            : TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ]),
      ]),
    );
  }

  Container appointment(HealthData data) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Table(border: TableBorder.all(color: Colors.black), children: [
        TableRow(children: [
          tableCell("\nDoctor\n"),
          tableCell("\nDescription\n"),
          tableCell("\nDate\n"),
        ]),
        TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ]),
      ]),
    );
  }

  Container hospital(HealthData data) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Table(border: TableBorder.all(color: Colors.black), children: [
        TableRow(children: [
          tableCell("\nDoctor\n"),
          tableCell("\nHospital\n"),
          Center(
              child: Column(
                children: [
                  tableCell("\nAdmit"),
                  tableCell("Date\n"),
                ],
              )),
          Center(
              child: Column(
                children: [
                  tableCell("\nDischarge"),
                  tableCell("Date\n"),
                ],
              )),
          tableCell("\nReason\n"),
        ]),
        data.hospitals != null && data.hospitals!.isNotEmpty
            ? TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ])
            : TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ]),
      ]),
    );
  }

  Container ambulance(HealthData data) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Table(border: TableBorder.all(color: Colors.black), children: [
        TableRow(children: [
          tableCell("\nCause\n"),
          Center(
            child: Column(
              children: [
                tableCell("\nRequested"),
                tableCell("Date\n"),
              ],
            ),
          ),
          tableCell("\nStart Date\n"),
          tableCell("\nEnd Date\n"),
        ]),
        data.ambulances != null && data.ambulances!.isNotEmpty
            ? TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ])
            : TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ])
      ]),
    );
  }

  Container prescription(HealthData data) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Table(border: TableBorder.all(color: Colors.black), children: [
        TableRow(children: [
          Center(
              child: Column(
                children: [
                  tableCell("\n Treated By"),
                  // tableCell("Date\n"),
                ],
              )),
          Center(
              child: Column(
                children: [
                  tableCell("\n Date\n"),
                ],
              )),
          Center(
              child: Column(
                children: [
                  tableCell("\nDetail"),
                  // tableCell("Date\n"),
                ],
              )),
          Center(
              child: Column(
                children: [
                  tableCell("\n Test"),
                ],
              )),
          Center(
              child: Column(
                children: [
                  tableCell("\nMedicine"),
                  // tableCell("Date\n"),
                ],
              )),
          Center(
              child: Column(
                children: [
                  tableCell("\n No of Days"),
                  // tableCell("Date\n"),
                ],
              )),
          tableCell("\n No of Times/day\n"),
        ]),
        data.prescription != null && data.prescription!.isNotEmpty
            ? TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ])
            : TableRow(children: [
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
          tableCell2("\n" + "NA" + "\n"),
        ]),
      ]),
    );
  }

  TableCell tableCell(String s) {
    return TableCell(
      child: Center(
        child: Text(s,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }

  TableCell tableCell2(String s) {
    return TableCell(
      child: Center(
        child: Text(s, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}