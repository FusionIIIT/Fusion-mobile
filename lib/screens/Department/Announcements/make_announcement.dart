import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fusion/services/department_service.dart';

class MakeAnnouncementScreen extends StatefulWidget {
  @override
  _MakeAnnouncementScreenState createState() => _MakeAnnouncementScreenState();
}

class _MakeAnnouncementScreenState extends State<MakeAnnouncementScreen> {
  List<Map<String, String>> announcements = [];
  final _formKey = GlobalKey<FormState>();
  List<String?> programmeTypes = [null, 'All', 'B.Tech', 'M.Tech', 'Ph.D'];
  List<String?> departmentTypes = [null, 'All', 'CSE', 'ECE', 'ME', 'SM'];
  List<String?> batches = [
    null,
    'All',
    'First Year',
    'Second Year',
    'Third Year',
    'Fourth Year'
  ];

  String? selectedProgrammeType;
  String? selectedBatch;
  String? selectedDepartmentType;
  String? programmeWarning;
  String? departmentWarning;
  String selectedFilePath = 'No file chosen';
  TextEditingController announcementDetailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    announcementDetailsController = TextEditingController();
  }

  @override
  void dispose() {
    announcementDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
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
                            builder: (context) => MakeAnnouncementScreen(),
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
                        padding: const EdgeInsets.only(left: 8.0),
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
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          departmentWarning!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 16),
                    TextFormField(
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
                              Text(selectedFilePath),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          submitForm();
                        }
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
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: false);

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
    if (selectedProgrammeType == null) {
      setState(() {
        programmeWarning = 'This field is required';
      });
      return;
    }
    if (selectedDepartmentType == null) {
      setState(() {
        departmentWarning = 'This field is required';
      });
      return;
    }

    Map<String, dynamic> announcementData = {
      'maker_id': 'your_maker_id_value_here',
      'programme': selectedProgrammeType!,
      'batch': selectedBatch ?? '',
      'department': selectedDepartmentType!,
      'message': announcementDetailsController.text,
      'upload_announncement': selectedFilePath,
    };
    await DepartmentService().createAnnouncement(announcementData).then((_) =>
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Announcement created successfully !"))));
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
