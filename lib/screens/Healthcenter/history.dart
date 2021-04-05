import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override

  Widget prescription=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Center(child: Text("\nTreated By\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nDate\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nDetail\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nTest\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nMedicine\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15, )),),
          ]),
          TableRow(children: [
            Center(child: Text("\nNo of Days\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nNo of Times/day\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
          ]),

        ]),
  );



  Widget ambulance=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Center(child: Text("\nCause\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Column(
              children: [
            Center(child: Text("\nRequested",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
                Center(child: Text("Date\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),

              ],
            ),),
            Center(child: Text("\nStart Date\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nEnd Date\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),

          ]),
          TableRow(children: [
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),

          ]),
        ]),
  );


  Widget hospital=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Center(child: Text("\nDoctor\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nHospital\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Column(
              children: [
                Center(child: Text("\nAdmit",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
                Center(child: Text("Date\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),

              ],
            )),
            Center(child: Column(
              children: [
                Center(child: Text("\nDischarge",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
                Center(child: Text("Date\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),

              ],
            )),
            Center(child: Text("\nReason\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),

          ]),
          TableRow(children: [
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),

          ]),
        ]),
  );


  Widget appointment=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Center(child: Text("\nDoctor\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nDescrition\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nDate\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
          ]),
        ]),
  );

  Widget feedback=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Center(child: Text("\nFeeback\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nResponse\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nDate\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
          ]),
        ]),
  );








  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        title: Text("History"),
        backgroundColor: Colors.black,
      ),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 20.0),
          DefaultTabController(
              length: 5, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[

                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(child: Text("Prescription",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Ambulance",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Hospital",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Appointment",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Feedback",style: TextStyle(fontWeight: FontWeight.bold),),),

                    ],
                  ),
                ),
                Container(
                    height: 520, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      prescription,
                      ambulance,
                      hospital,
                      appointment,
                      feedback,

                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
}
