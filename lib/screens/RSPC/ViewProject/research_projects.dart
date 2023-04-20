// import 'dart:ffi';

// import 'package:date_field/date_field.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../../Components/utils.dart';
import '../../../models/profile.dart';
import '../../../models/project.dart';
import '../../../services/research_project_service.dart';
import '../../../services/service_locator.dart';
import '../../../services/storage_service.dart';

class ResearchProject extends StatefulWidget {
  final uid;
  ResearchProject(this.uid);
  @override
  _ResearchProjectState createState() => _ResearchProjectState();
}

class _ResearchProjectState extends State<ResearchProject> {
  bool _loading1 = true;
  ProfileData? data;
  late StreamController _projectController;
  late ProjectService projectService;
  late ProjectData projectData;
  Utils utils = Utils();

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    data = service.profileData;
    _projectController = StreamController();
    projectService = ProjectService();
    if (data == null) {}
    getData();
  }

  getData() async {
    try {
      Response response = await projectService.getProjectData();

      setState(() {
        print(response.body);
        projectData = ProjectData.fromJson(jsonDecode(response.body));
        print(projectData);
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _projectController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: _loading1 == true
          ? Center(child: CircularProgressIndicator())
          : Projects(data: projectData),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Projects extends StatelessWidget {
  final ProjectData data;
  Utils utils = Utils();
  Projects({required this.data});

  Widget bodyData() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              columnSpacing: 35,
              columns: <DataColumn>[
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "PI",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Co-PI's",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Funding Agency",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Financial Outlay",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Status",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Submission Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Flexible(
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Start Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  numeric: false,
                  onSort: (i, b) {},
                ),
              ],
              rows: getRows()),
        ),
      );
  List<DataRow> getRows() {
    print(data.projects);
    List<DataRow> dummy = [
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
      ]),
    ];

    if (data.projects == null) {
      print("No Projects Available");
      return dummy;
    }

    if (data.projects!.length == 0) {
      print("No Projects Available");
      return dummy;
    }

    return data.projects!
        .map((element) => DataRow(cells: [
              DataCell(Text(element['pi'])),
              DataCell(Text(element['co_pi'])),
              DataCell(Text(element['title'])),
              DataCell(Text(element['funding_agency'])),
              DataCell(Text(element['financial_outlay'])),
              DataCell(Text(element['status'])),
              DataCell(Text(element['date_submission'])),
              DataCell(Text(element['start_date'])),
            ]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: utils.leadingPopIconsButton(Colors.black, context),
          title: Text(
            "Research Projects",
            style: TextStyle(
                color: utils.primarycolor, fontWeight: FontWeight.bold),
          ),
        ),
        body: bodyData(),
      ),
    );
  }
}
