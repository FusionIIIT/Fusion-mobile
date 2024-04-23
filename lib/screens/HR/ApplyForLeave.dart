import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
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
  TextEditingController _receiverDesignationController =
      TextEditingController();
  TextEditingController _addministrativeResponsibiltyAssignedController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  
  late List<dynamic> designationsOfReceiver = [];
  var service = locator<StorageService>();
  late var token = service.userInDB!.token;
  late String curr_desig = service.getFromDisk("Current_designation");
  bool _loading1 = true;
  bool fetchedDesignationsOfReceiver = false;
  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
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
      _designationController.text = curr_desig;
    });
  }

  getDesignations() async {
    final String host = kserverLink;
    final String path = "/hr2/api/getDesignations/";
    final queryParameters = {
      'username': _receiverNameController.text,
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.get(uri,headers: {"Authorization": "Token ${token}"});
    if (response.statusCode == 200) {
      final d = await jsonDecode(response.body);
      setState(() {
        fetchedDesignationsOfReceiver = true;
        designationsOfReceiver = d;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please check the entered username.")));
    }
  }

  void submitForm() async {
    final url = "http://${kserverLink}/hr2/api/leave/";

    final data = {
      'name': _nameController.text,
      "employeeId": (datap.user)!['id'],
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
      'academicResponsibility': _responsibilitiesAssignedController.text,
      'addministrativeResponsibiltyAssigned':
          _addministrativeResponsibiltyAssignedController.text,
      'receiver_name': _receiverNameController.text,
      'submissionDate': DateTime.now().toIso8601String().substring(0, 10),
      'created_by': datap.user!['id'].toString()
    };
    final userInfo = {
      "receiver_designation": _receiverDesignationController.text,
      "receiver_name": _receiverNameController.text,
      "uploader_name": datap.user!['username'],
      "uploader_designation": curr_desig,
    };
    var payload = [data, userInfo];
    print(payload);
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: {"Content-type": "application/json; charset=UTF-8","Authorization": "Token ${token}"},
      encoding: Encoding.getByName("utf-8"),
    );

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
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Apply For Leave",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
            _designationController.text = curr_desig;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                    labelText: 'Academic Responsibilities assigned to',
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
                  controller: _addministrativeResponsibiltyAssignedController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Administrative Responsibilities assigned to',
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
                      getDesignations();
                    },
                    child: Text("Show Designations of user")),
                SizedBox(height: 20),
                fetchedDesignationsOfReceiver
                    ? DropdownButtonFormField(
                        items: designationsOfReceiver
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          _receiverDesignationController.text =
                              value.toString();
                        })
                    : Container(),
                SizedBox(height: 20),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      if (DateTime.parse(_leaveStartDateController.text)
                          .isAfter(
                              DateTime.parse(_leaveEndDateController.text))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('End Date should be after Start Date')),
                        );
                        return;
                      }
                      if (DateTime.parse(_leaveStartDateController.text)
                          .isBefore(DateTime.now())) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Start Date should be after today')),
                        );
                        return;
                      }
                      if (DateTime.parse(_leaveEndDateController.text)
                          .isBefore(DateTime.now())) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('End Date should be after today')),
                        );
                        return;
                      }

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
