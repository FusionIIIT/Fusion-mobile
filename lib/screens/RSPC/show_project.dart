// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;

class Show_project extends StatefulWidget {
  final String index;
  const Show_project({Key? key, required this.index}) : super(key: key);

  @override
  State<Show_project> createState() => _Show_projectState();
}

class _Show_projectState extends State<Show_project> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> projects = [];
  bool isLoading = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null) {
        throw Exception('Token Error');
      }
      Map<String, String> headers = {
        
         'Authorization' : 'Token '+(storage_service.userInDB?.token??"")
      };

      http.Response response = await http.get(
        Uri.http("172.27.16.214:8000", "research_procedures/api/projects"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          projects = jsonData['projects'];
          isLoading = false;
        });
      } else {
        print(response.statusCode);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  List<dynamic> getFilteredProjects(String projectName) {
    return projects
        .where((project) => project['project_name'] == projectName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Research Module",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: getFilteredProjects(widget.index).length,
                  itemBuilder: (BuildContext context, int index) {
                    final project = getFilteredProjects(widget.index)[index];
                    String outlayStatus =
                        project['financial_outlay_status'] == 0
                            ? 'Ongoing'
                            : 'Completed';
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Project-ID: ${project['project_id']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Project Name: ${project['project_name']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Project Type: ${project['project_type']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Sponsored Agency: ${project['sponsored_agency']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Years: ${project['years']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Status: ${project['status']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Start date: ${project['start_date']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Submission date: ${project['submission_dat']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Finish date: ${project['finish_date']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Outlay Status: ${outlayStatus}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Project Investigator Id: ${project['project_investigator_id']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Co-Project Investigator Id: ${project['co_project_investigator_id']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
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
