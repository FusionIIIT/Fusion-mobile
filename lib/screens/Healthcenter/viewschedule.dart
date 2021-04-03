import 'package:flutter/material.dart';

class ViewSchedule extends StatefulWidget {
  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  @override

////////////////////
  Widget doctorinfo=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Center(child: Text("\nDoctor Name\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nSpecialization\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nPhone\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          ]),
          TableRow(children: [
            Center(child: Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16)),),
            Center(child:Text("\nNA\n",style: TextStyle(fontSize: 16,)),),
          ]),
        ]),
  );
  ///////////


///////////DOCTOR info
  Widget viewschedule=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
    child: Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Center(child: Text("\nDoctor\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
        ]),
        TableRow(children: [
          Center(child: Text("\nSpecialization\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
        ]),
        TableRow(children: [
          Center(child: Text("\nMonday\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
        ]),
        TableRow(children: [
          Center(child: Text("\nTuesday\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
        ]),
        TableRow(children: [
          Center(child: Text("\nWednesday\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15, )),),
        ]),
        TableRow(children: [
          Center(child: Text("\nThursday\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
        ]),
        TableRow(children: [
          Center(child: Text("\nFriday\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
        ]),
        TableRow(children: [
          Center(child: Text("\nSaturday\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA\n",style: TextStyle(fontSize: 15,)),),
        ]),
        TableRow(children: [
          Center(child: Text("\nSunday",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child: Text("\nNA",style: TextStyle(fontSize: 15, )),),
        ]),
    ]),
  );
  ////////////

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        title: Text("View Schedule"),
        backgroundColor: Colors.black,
      ),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 2.0),
          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(child: Text("View Schedule",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Doctor Info",style: TextStyle(fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
                Container(
                    height: 520, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      viewschedule,
                      doctorinfo,
                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
}
