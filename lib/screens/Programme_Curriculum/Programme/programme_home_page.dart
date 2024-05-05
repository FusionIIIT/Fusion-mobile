import 'package:flutter/material.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/programme_feedback_model.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/tabComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';

class Programme extends StatefulWidget {
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  List<List<dynamic>> _ug = [];
  List<List<dynamic>> _pg = [];
  List<List<dynamic>> _phd = [];
  List<ProgrammeFeedbackModel> feedbacks = [];
  List<ProgrammeFeedbackModel> feedbacks_pg = [];
  List<ProgrammeFeedbackModel> feedbacks_phd = [];
  getFeedbackFromSheet() async {
    var storage_service = locator<StorageService>();
    if (storage_service.userInDB?.token == null) throw Exception('Token Error');

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storage_service.userInDB?.token ?? "")
    };

    var client = http.Client();

    var raw = await client.get(
      Uri.http(getLink(), kugprogrammes),
      headers: headers,
    );

    var raw_pg = await client.get(
      Uri.http(getLink(), kpgprogrammes),
      headers: headers,
    );

    var raw_phd = await client.get(
      Uri.http(getLink(), kphdprogrammes),
      headers: headers,
    );

    var jsonfeedback = convert.jsonDecode(raw.body);
    var jsonfeedback_pg = convert.jsonDecode(raw_pg.body);
    var jsonfeedback_phd = convert.jsonDecode(raw_phd.body);
    // print('this is json FeedBack $jsonfeedback');

    feedbacks.clear();
    feedbacks_pg.clear();
    feedbacks_phd.clear();

    // Add new feedbacks
    jsonfeedback.forEach((element) {
      ProgrammeFeedbackModel feedbackModel =
          ProgrammeFeedbackModel.fromJson(element);
      feedbacks.add(feedbackModel);
    });
    jsonfeedback_pg.forEach((element) {
      ProgrammeFeedbackModel feedbackModel_pg =
          ProgrammeFeedbackModel.fromJson(element);
      feedbacks_pg.add(feedbackModel_pg);
    });
    jsonfeedback_phd.forEach((element) {
      ProgrammeFeedbackModel feedbackModel_phd =
          ProgrammeFeedbackModel.fromJson(element);
      feedbacks_phd.add(feedbackModel_phd);
    });

    // print("the feedbacks: $feedbacks");

    // Convert feedbacks to _ug format
    _ug = feedbacks
        .map((feedback) => [feedback.programmes, feedback.discipline])
        .toList();

    _pg = feedbacks_pg
        .map((feedback) => [feedback.programmes, feedback.discipline])
        .toList();
    _phd = feedbacks_phd
        .map((feedback) => [feedback.programmes, feedback.discipline])
        .toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var service = locator<StorageService>();
    late String curr_desig = service.getFromDisk("Current_designation");
    return FutureBuilder(
      future: getFeedbackFromSheet(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        final data_UG = {
          "table": <String, dynamic>{
            "columns": ["programmes", "discipline"],
            "rows": _ug,
          }
        };
        final data_PG = {
          "table": <String, dynamic>{
            "columns": ["programmes", "discipline"],
            "rows": _pg,
          }
        };
        final data_PHD = {
          "table": <String, dynamic>{
            "columns": ["programmes", "discipline"],
            "rows": _phd,
          }
        };
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: CustomAppBar(
              curr_desig: curr_desig,
              headerTitle: "Programme and Curriculum",
              onDesignationChanged: (newValue) {
                setState(() {
                  curr_desig = newValue;
                });
              },
            ),
            drawer: SideDrawer(curr_desig: curr_desig),
            body: TabBarView(
              children: [
                TabComponent(data: data_UG),
                TabComponent(data: data_PG),
                TabComponent(data: data_PHD),
              ],
            ),
          ),
        );
      },
    );
  }
}
