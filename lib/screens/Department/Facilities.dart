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
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:my_app/html_view.dart';

class Facilities extends StatefulWidget {
  @override
  _FacilitiesState createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  String depart = 'CSE';
  String tab = 'facilities';
  String htmlData = '';
  String fieldData = '';
  late String user_type = "";
  bool edit = false;
  late String path = '';
  List<String> Departments = ["CSE", "ME", "SM", "ECE", "DESIGN"];
  @override
  void initState() {
    super.initState();
  }

  void changeData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(tab + depart, fieldData);
      htmlData = fieldData;
      // print(fieldData);
      // print(htmlData);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(tab + depart)) {
        final Data = prefs.getString(tab + depart);
        htmlData = Data!;
        fieldData = htmlData;
      } else {
        final Data = await rootBundle
            .loadString('db/Dep/' + tab + '/' + depart + '.html');
        prefs.setString(tab + depart, Data);
        // print(depart);
        htmlData = Data;
        fieldData = htmlData;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double kHeight = MediaQuery.of(context).size.height;
    double kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: !edit
          ? FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  return Column(
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < Departments.length; i++) ...[
                            Column(
                              children: [
                                Container(
                                  height: kHeight * 0.05,
                                  width: kWidth * 0.18,
                                  margin: EdgeInsets.all(kWidth * 0.01),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black)),
                                    child: Text(
                                      Departments[i],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: kWidth * 0.025),
                                    ),
                                    onPressed: () => {
                                      // print(Departments[i]),
                                      setState(() {
                                        depart = Departments[i];
                                        edit = false;
                                        getData();
                                      })
                                    },
                                  ),
                                )
                              ],
                            )
                          ]
                        ],
                      ),
                      if (!edit) ...[
                        Flexible(
                            flex: 1,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  child: Flexible(
                                      child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(kWidth * 0.05),
                                        child: HtmlWidget(
                                            "<h1> " +
                                                depart +
                                                " Department </h1>" +
                                                htmlData,
                                            textStyle: TextStyle(fontSize: 20)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(kHeight * 0.05),
                                        child: SizedBox(
                                          height: kHeight * 0.1,
                                          width: kWidth * 0.4,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.green),
                                              ),
                                              onPressed: (() => {
                                                    // print(htmlData),
                                                    // updateHtmlFile(htmlData),
                                                    setState(() {
                                                      print("edit mode on");
                                                      edit = true;
                                                    })
                                                  }),
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(fontSize: 50),
                                              )),
                                        ),
                                      )
                                    ],
                                  )),
                                )))
                      ] else ...[
                        SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              margin: EdgeInsets.all(kWidth * 0.035),
                              child: Flexible(
                                  fit: FlexFit.loose,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                            maxLines: 20,
                                            style: TextStyle(fontSize: 20),
                                            initialValue: htmlData,
                                            onChanged: (value) {
                                              print("value changed");
                                              fieldData = value;
                                            }),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(kWidth * 0.030),
                                        child: SizedBox(
                                          height: kHeight * 0.1,
                                          width: kWidth * 0.4,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.green),
                                              ),
                                              onPressed: (() => {
                                                    print("pressed done"),
                                                    changeData(),
                                                    setState(() {
                                                      edit = false;
                                                    })
                                                  }),
                                              child: Text("Done",
                                                  style:
                                                      TextStyle(fontSize: 50))),
                                        ),
                                      )
                                    ],
                                  )),
                            ))
                      ]
                    ],
                  );
                }
              })
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.all(kWidth * 0.035),
                child: Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                              maxLines: 20,
                              style: TextStyle(fontSize: 20),
                              initialValue: htmlData,
                              onChanged: (value) {
                                print("value changed");
                                setState(() {
                                  fieldData = value;
                                });
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.all(kWidth * 0.030),
                          child: SizedBox(
                            height: kHeight * 0.1,
                            width: kWidth * 0.4,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                                onPressed: (() => {
                                      print("pressed done"),
                                      changeData(),
                                      setState(() {
                                        edit = false;
                                      })
                                    }),
                                child: Text("Done",
                                    style: TextStyle(fontSize: 50))),
                          ),
                        )
                      ],
                    )),
              )),
    );
  }
}
