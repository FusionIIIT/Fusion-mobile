import 'package:flutter/material.dart';
import 'Appointment.dart';
import 'ambulanceRequest.dart';

class HealthCenter extends StatefulWidget {
  @override
  _HealthCenterState createState() => _HealthCenterState();
}

class _HealthCenterState extends State<HealthCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar:AppBar(
          title: Text("Health Center"),
          backgroundColor: Colors.black,
        ),
        body:Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
            SizedBox(height: 5.0),
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
                        Tab(child: Text("Doctor Appointment",style: TextStyle(fontWeight: FontWeight.bold),),),
                        Tab(child: Text("Ambulance Request",style: TextStyle(fontWeight: FontWeight.bold),),),
                      ],
                    ),
                  ),
                  Container(
                      height: 520, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                      ),
                      child: TabBarView(children: <Widget>[
                        Appointment(),
                        AmbulanceRequest(),

                      ])
                  )
                ])
            ),
          ]),
        ),
      );
  }
}
