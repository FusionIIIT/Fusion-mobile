import 'package:flutter/material.dart';
import 'package:fusion/models/health.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'dart:convert';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
class ViewSchedule extends StatefulWidget {
  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
   List<Doctor> doctors = [];
  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }
  Future<void> fetchDoctors() async {
    var storage_service = locator<StorageService>();

    if (storage_service.userInDB?.token == null)
      throw Exception('Token Error');

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
    };
    print("fetching details");
    var client = http.Client();
    http.Response response = await client.get(
      Uri.http(
        getLink(),
        kHealthCentreStudent, //constant api
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic>doctorsdata = data['doctors'];
        doctors = (doctorsdata as List).map((data) => Doctor.fromJson(data)).toList();
        // print(doctors);
      });
    } else {
      throw Exception('Failed to load doctors');
    }
    print(doctors);
  }

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
                      doctorinfo(doctors),
                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
}
Container doctorinfo(List<dynamic> doctors) {
  return new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
    child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Center(child: Text("\nDoctor Name\n",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nSpecialization\n",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            Center(child: Text("\nPhone\n",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          ]),
          ...doctors.map((doctor) =>
              TableRow(children: [
                Center(
                  child: Text("\n${doctor.doctorName}\n",
                      style: TextStyle(fontSize: 16)),
                ),
                Center(
                  child: Text("\n${doctor.specialization}\n",
                      style: TextStyle(fontSize: 16)),
                ),
                Center(
                  child: Text("\n${doctor.doctorPhone}\n",
                      style: TextStyle(fontSize: 16)),
                ),
              ])).toList(),
        ]),
  );
}
