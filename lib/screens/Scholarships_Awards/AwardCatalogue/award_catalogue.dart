import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fusion/models/complaints.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/catalogue.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/previous_winners.dart';
import 'package:fusion/screens/Scholarships_Awards/AwardCatalogue/spacs_memebers_details.dart';
// import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';

class BrowseAwardCatalogue extends StatefulWidget {
  @override
  _BrowseAwardCatalogueState createState() => _BrowseAwardCatalogueState();
}

class _BrowseAwardCatalogueState extends State<BrowseAwardCatalogue> {
  bool _loading1 = true;
  //integrating_api
  late StreamController _complaintController;
  // late ComplaintService complaintService;
  // late ComplaintDataUserStudent data;

  int step = 0;

  @override
  void initState() {
    super.initState();

    _complaintController = StreamController();
    // complaintService = ComplaintService();
    // getData();
  }

  // getData() async {
  //   //print('token-'+widget.token!);
  //   try {
  //     Response response = await complaintService.getComplaint();
  //     setState(() {
  //       data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
  //       print(data.student_complain);
  //       //print(data);
  //       _loading1 = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // loadData() async {
  //   getData().then((res) {
  //     _complaintController.add(res);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //Default TabController for tab scrollbar with number of elements equal to 4
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Browse Award Catalogue",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          //TabBar for a horizontal scrollable tob bar
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Catalogue',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Spacs Members Details',
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Previous Winners',
                  ),
                ),
              ),
            ],
          ),
        ),
        //TabBarView contains all the children to be called when tapped.
        body: TabBarView(
          children: [
            Catalogue(),
            SpacsMembersDetails(ModalRoute.of(context)!.settings.arguments.toString()),
            PreviousWinners(ModalRoute.of(context)!.settings.arguments.toString()),
          ],
        ),
      ),
    );
  }
}
