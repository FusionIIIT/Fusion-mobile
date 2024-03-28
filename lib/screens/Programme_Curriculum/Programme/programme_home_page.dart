import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/programme_feedback_model.dart';
import 'package:fusion/screens/Programme_Curriculum/Programme/tabComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
    var url = Uri.parse(
        "https://script.google.com/macros/s/AKfycbwKksYndwjR7sNcbzCi7SnLsdKZYbXEhVVL5dv65EexIgA-Kb63hGWbykZJSG800aaK7A/exec");
    var raw = await http.get(url);

    var url_pg = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzoYJwyR1eYz1XXi6Pt5Lp0YfRPoeAY6Cy_0XC6ZNXj9RsvgihBcUzJj8hSMqp4mSJRrQ/exec");
    var raw_pg = await http.get(url_pg);

    var url_phd = Uri.parse(
        "https://script.google.com/macros/s/AKfycby-dMkQuZGjGbcRHFDzYpEFHvRBOKwZaFy9k20Ypq-HgX1O0kIK-0ErvGBitMQPuwOBnA/exec");
    var raw_phd = await http.get(url_phd);

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

    print("this is ug: $_ug");
    print("this is pg: $_pg");
    print("this is phd: $_phd");
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
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
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                "FUSION",
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
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 6.0,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text(
                        'UG: Under Graduate',
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'PG: Post Graduate',
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'PHD:Doctor of Philosopy',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            drawer: SideDrawer(),
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
