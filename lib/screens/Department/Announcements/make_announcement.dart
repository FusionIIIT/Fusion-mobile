import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/services/department_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart';

class MakeAnnouncement extends StatefulWidget {
  @override
  _MakeAnnouncementState createState() => _MakeAnnouncementState();
}

class _MakeAnnouncementState extends State<MakeAnnouncement> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  late ProfileData? data;
  late ProfileService profileService;
  List<Map<String, String>> announcements = [];
  final _formKey = GlobalKey<FormState>();
  List<String?> programmeTypes = [null, 'B.Tech', 'M.Tech', 'Ph.D'];
  List<String?> departmentTypes = [null, 'ALL', 'CSE', 'ECE', 'ME', 'SM'];
  List<String?> batches = [null, 'ALL', 'Year-1', 'Year-2', 'Year-3', 'Year-4'];

  late String ann_date;
  String? selectedProgrammeType;
  String? selectedBatch;
  String? selectedDepartmentType;
  String? programmeWarning;
  String? departmentWarning;
  String? selectedFilePath = null;
  TextEditingController announcementDetailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    profileService = ProfileService();
    data = service.profileData;
    announcementDetailsController = TextEditingController();
    getData();
  }

  getData() async {
    try {
      Response response = await profileService.getProfile();
      setState(() {
        data = ProfileData.fromJson(jsonDecode(response.body));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    announcementDetailsController.dispose();
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
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MakeAnnouncement(),
                          ),
                        );
                      },
                      child: Icon(Icons.announcement, size: 20),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          programmeWarning = null;
                          departmentWarning = null;
                        });
                      },
                      child: Text(
                        'Make Announcement',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 234, 228, 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildDropdown('Programme Type', programmeTypes,
                        selectedProgrammeType, 'Select Programme', (newValue) {
                      setState(() {
                        selectedProgrammeType = newValue;
                        programmeWarning = null;
                      });
                    }),
                    if (programmeWarning != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          programmeWarning!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 16),
                    buildDropdown(
                        'Batch', batches, selectedBatch, 'Select Batch',
                        (newValue) {
                      setState(() {
                        selectedBatch = newValue;
                      });
                    }),
                    SizedBox(height: 16),
                    buildDropdown(
                        'Department Type',
                        departmentTypes,
                        selectedDepartmentType,
                        'Select Department', (newValue) {
                      setState(() {
                        selectedDepartmentType = newValue;
                        departmentWarning = null;
                      });
                    }),
                    if (departmentWarning != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          departmentWarning!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: announcementDetailsController,
                      decoration: InputDecoration(
                        labelText: 'Announcement Details:*',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            'Attach Files(pdf, jpeg, jpg, png):',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 8),
                        IntrinsicWidth(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _showFilePickerDialog(context);
                                },
                                child: Text('Choose File'),
                              ),
                              SizedBox(width: 8),
                              Text(selectedFilePath ?? 'No file chosen'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        submitForm();
                      },
                      child: Text('Publish'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  Future<void> _showFilePickerDialog(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        setState(() {
          selectedFilePath = result.files.single.path!;
        });
      } else {
        print('User canceled file picking');
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  Future<void> submitForm() async {
    setState(() {
      programmeWarning =
          selectedProgrammeType == null ? 'Please select programme' : null;
      departmentWarning =
          selectedDepartmentType == null ? 'Please select department' : null;
    });
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> announcementData = {
        'maker_id': data!.profile!['id'],
        'ann_date': DateTime.now().toIso8601String(),
        'programme': selectedProgrammeType,
        'batch': selectedBatch,
        'department': selectedDepartmentType,
        'message': announcementDetailsController.text,
        'upload_announcement': selectedFilePath,
      };
      Future<bool> success =
          DepartmentService().createAnnouncement(announcementData);
      if (await success) {
        _showSuccessSnackbar();
      } else {
        _showFailureSnackbar();
      }
    }
  }

  void _showSuccessSnackbar() {
    setState(() {
      _formKey.currentState!.reset();
      selectedBatch = null;
      selectedProgrammeType = null;
      selectedDepartmentType = null;
      selectedFilePath = null;
      announcementDetailsController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Announcement Created Successfully',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Failed to create announcement. Please try again later.',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget buildDropdown(String label, List<String?> items, String? selectedValue,
      String placeholder, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label + ':',
            ),
            if (label == 'Programme Type' || label == 'Department Type')
              Text(
                '*',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        SizedBox(width: 8),
        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            fillColor: Color.fromARGB(255, 245, 242, 242),
            filled: true,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String?>(
              value: selectedValue,
              onChanged: (newValue) {
                onChanged(newValue);
              },
              items: items.map((item) {
                return DropdownMenuItem<String?>(
                  value: item,
                  child: Text(item ?? placeholder),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
