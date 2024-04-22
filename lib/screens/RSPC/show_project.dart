// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class Show_project extends StatefulWidget {
  final String index;
  const Show_project({Key? key, required this.index}) : super(key: key);

  @override
  State<Show_project> createState() => _Show_projectState();
}

class _Show_projectState extends State<Show_project> {
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Make the HTTP request
    final String response = await rootBundle.loadString('assets/db.json');

    Map<String, dynamic> data = json.decode(response);

    print("ho gaya fetch");
    List<dynamic> user = data['user'];

    setState(() {
      userData = user;
    });
  }

  List<dynamic> getFilteredProjects(String projectName) {
    return userData
        .where((project) => project['Project Name'] == projectName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: getFilteredProjects(widget.index).length,
                  itemBuilder: (BuildContext context, int index) {
                    final project = getFilteredProjects(widget.index)[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('S.No.: ${project['S.No.']}' , style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Project Name: ${project['Project Name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(
                                 height: 5.0,
                              ),
                              Text('Project Type: ${project['Project Type']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(
                                 height: 5.0,
                              ),
                              Text(
                                  'Sponsored Agency: ${project['Sponsored Agency']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(
                                 height: 5.0,
                              ),
                              Text('Years: ${project['Years']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(
                                 height: 5.0,
                              ),
                              Text('Status: ${project['Status']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(
                                 height: 5.0,
                              ),
                              Text('Project info: ${project['Project info']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(
                                 height: 5.0,
                              ),
                              Text('ID: ${project['id']}',style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
