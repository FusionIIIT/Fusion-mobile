import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late ProfileService profileService;
  late String Department = "";
  late ProfileData data;
  bool _loading = true;
  List<List<dynamic>> StaticData = [];

  @override
  void initState() {
    super.initState();
    profileService = ProfileService();
  }

  // ignore: non_constant_identifier_names

  Future<void> getData() async {
    try {
      Response response = await profileService.getProfile();
      data = ProfileData.fromJson(jsonDecode(response.body));
      Department = data.profile!['department']!['name'];
      if (Department == 'CSE') {
        final staticdata =
            await rootBundle.loadString('db/Department_AboutUs_cse.csv');
        StaticData = const CsvToListConverter().convert(staticdata);
      } else if (Department == 'ME') {
        final staticdata =
            await rootBundle.loadString('db/Department_AboutUs_me.csv');
        StaticData = const CsvToListConverter().convert(staticdata);
      } else if (Department == 'SM') {
        final staticdata =
            await rootBundle.loadString('db/Department_AboutUs_sm.csv');
        StaticData = const CsvToListConverter().convert(staticdata);
      } else if (Department == 'ECE') {
        final staticdata =
            await rootBundle.loadString('db/Department_AboutUs_ece.csv');
        StaticData = const CsvToListConverter().convert(staticdata);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading data'));
            } else {
              return ListView(children: [
                Column(
                  children: [
                    Text(
                      "  Welcome to " + Department + " Department",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Wrap(children: [
                      StaticData.isEmpty
                          ? Text("Fetching Data")
                          : Column(children: [
                              for (int i = 0; i < StaticData.length; i++) ...[
                                Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 30, 10, 10),
                                    child: Text(StaticData[i][0],
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Text(StaticData[i][1],
                                        style: TextStyle(fontSize: 20))),
                              ]
                            ])
                    ])
                  ],
                ),
              ]);
            }
          }),
    );
  }
}
