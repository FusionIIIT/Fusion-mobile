import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/department_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class FacultyDetailsScreen extends StatefulWidget {
  final String selectedDepartment;
  FacultyDetailsScreen({required this.selectedDepartment});
  @override
  _FacultyDetailsState createState() => _FacultyDetailsState();
}

class _FacultyDetailsState extends State<FacultyDetailsScreen>
    with SingleTickerProviderStateMixin {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  ProfileData? data;
  late TabController _tabController;
  List<String> departmentOptions = [
    'CSE Department',
    'ECE Department',
    'ME Department',
    'SM Department'
  ];
  List<FacultyDetails> facultyDetails = [];
  late String updatedDepartment;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: departmentOptions.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 0;
    var service = locator<StorageService>();
    data = service.profileData;
    updatedDepartment = widget.selectedDepartment;
    _handleTabSelection();
  }

  void _handleTabSelection() {
    final newDepartment = departmentOptions[_tabController.index].split(' ')[0];
    if (updatedDepartment != newDepartment) {
      setState(() {
        isLoading = true;
      });
      updatedDepartment = newDepartment;
      DepartmentService().getFacultyDetails(updatedDepartment).then((data) {
        setState(() {
          facultyDetails =
              data?.map((json) => FacultyDetails.fromJson(json)).toList() ?? [];
          isLoading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Department",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: kPrimaryColor,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: departmentOptions
                    .map((department) => Tab(
                          text: department,
                        ))
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future:
                    DepartmentService().getFacultyDetails(updatedDepartment),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    facultyDetails = snapshot.data
                            ?.map((json) => FacultyDetails.fromJson(json))
                            .toList() ??
                        [];
                    if (facultyDetails.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'No data available',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    } else {
                      return DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              'ID',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Sex',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Date of Birth',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Address',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'User',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Department',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                        rows: facultyDetails
                            .map(
                              (faculty) => DataRow(
                                cells: [
                                  DataCell(Text(faculty.id)),
                                  DataCell(Text(faculty.title)),
                                  DataCell(Text(faculty.sex)),
                                  DataCell(Text(faculty.dateOfBirth)),
                                  DataCell(Text(faculty.address)),
                                  DataCell(
                                      Text(faculty.phoneNumber.toString())),
                                  DataCell(Text(faculty.user.toString())),
                                  DataCell(Text(faculty.department.toString())),
                                ],
                              ),
                            )
                            .toList(),
                      );
                    }
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
