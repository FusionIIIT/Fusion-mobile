import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/models/profile.dart';
import 'dart:async';
import 'dart:convert';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class ApplyForLeave extends StatefulWidget {
  const ApplyForLeave();

  @override
  State<ApplyForLeave> createState() {
    return _ApplyForLeaveState();
  }
}

class _ApplyForLeaveState extends State<ApplyForLeave> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _pfNoController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _natureOfLeaveController =
      TextEditingController();
  final TextEditingController _leaveStartDateController =
      TextEditingController();
  final TextEditingController _leaveEndDateController = TextEditingController();

  final TextEditingController _purposeOfLeaveController =
      TextEditingController();
  final TextEditingController _addressDuringLeaveController =
      TextEditingController();
  final TextEditingController _responsibilitiesAssignedController =
      TextEditingController();
  TextEditingController _receiverNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service;
  bool _loading1 = true;
  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    service = locator<StorageService>();
    try {
      print("hello");
      datap = service.profileData;
      _loading1 = false;
      showData();
    } catch (e) {
      getData();
      showData();
    }
  }

  getData() async {
    try {
      var response = await profileService.getProfile();
      setState(() {
        datap = ProfileData.fromJson(jsonDecode(response.body));
        _loading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void showData() {
    print(datap.user);
    print(datap.profile);
    print((datap.profile)!['id']);
    print(datap.profile!['user_type']);
    setState(() {
      _nameController.text = datap.user!['first_name'];
      _designationController.text = datap.profile!['user_type'];
    });
  }

  void submitForm() async {
    final url = "http://10.0.2.2:8000/hr2/api/leave/";

    final data = {
      'name': _nameController.text,
      'designation': _designationController.text,
      'pfNo': _pfNoController.text,
      'departmentInfo': _departmentController.text,
      'natureOfLeave': _natureOfLeaveController.text,
      'leaveStartDate': DateFormat("yyyy-MM-dd")
          .format(DateTime.parse(_leaveStartDateController.text))
          .substring(0, 10),
      'leaveEndDate': DateFormat("yyyy-MM-dd")
          .format(DateTime.parse(_leaveEndDateController.text))
          .substring(0, 10),
      'purposeOfLeave': _purposeOfLeaveController.text,
      'addressDuringLeave': _addressDuringLeaveController.text,
      'rolesTransferredTo': _responsibilitiesAssignedController.text,
      'receiver_name': _receiverNameController.text,
      'submissionDate': DateTime.now().toIso8601String().substring(0, 10),
      'created_by': datap.user!['id'].toString()
    };
    final userInfo = {
      "receiver_name": _receiverNameController.text,
      "uploader_name": datap.user!['username'],
      "uploader_designation": datap.profile!['user_type'],
    };
    var payload = [data, userInfo];
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );
    print(response.body);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Submitted Successfully")));
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Failed to submit")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: _designationController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                  ),
                ),
                TextFormField(
                  controller: _pfNoController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'PF Number',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your personal file number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _departmentController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Department/Discipline',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your department/discipline';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _natureOfLeaveController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Nature of Leave',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the nature of leave';
                    }
                    return null;
                  },
                ),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    labelText: 'Leave Start Date',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter the leave start date';
                    }
                    return null;
                  },
                  onDateSelected: (DateTime value) {
                    _leaveStartDateController.text = value.toIso8601String();
                  },
                ),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    labelText: 'Leave End Date',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter the leave end date';
                    }
                    return null;
                  },
                  onDateSelected: (DateTime value) {
                    _leaveEndDateController.text = value.toIso8601String();
                  },
                ),
                TextFormField(
                  controller: _purposeOfLeaveController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Purpose of Leave',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the purpose of leave';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressDuringLeaveController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Address during Leave',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address during leave';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _responsibilitiesAssignedController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText:
                        'Academic and Administrative Responsibilities assigned to',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter name of person the responsibilities have been assigned to.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _receiverNameController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Receiver\'s Name '),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter receiver name correctly.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      submitForm();
                    }
                    // Respond to button press
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please fill all the fields correctly')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
