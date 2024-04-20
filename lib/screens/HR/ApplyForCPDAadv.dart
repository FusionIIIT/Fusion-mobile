import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/screens/HR/ForwardCPDAAdvance.dart';
import 'package:fusion/services/storage_service.dart';
import 'dart:async';
import 'dart:convert';

class ApplyForCPDAadv extends StatefulWidget {
  const ApplyForCPDAadv();

  @override
  State<ApplyForCPDAadv> createState() {
    return _ApplyForCPDAadvState();
  }
}

class _ApplyForCPDAadvState extends State<ApplyForCPDAadv> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _pfNoController = TextEditingController();
  TextEditingController _amountRequiredController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _advanceDueController = TextEditingController();
  TextEditingController _receiverNameController = TextEditingController();
  late List<dynamic> designationsOfReceiver = [];
  TextEditingController _receiverDesignationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service;
  bool _loading1 = true;
  bool fetchedDesignationsOfReceiver = false;
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

  getDesignations() async {
    final String host = "10.0.2.2:8000";
    final String path = "/hr2/api/getDesignations/";
    final queryParameters = {
      'username': _receiverNameController.text,
    };
    Uri uri = (Uri.http(host, path, queryParameters));
    var response = await http.get(uri);
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
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => ForwardOrDeclineFormCPDAHOD()));
    final url = "http://10.0.2.2:8000/hr2/api/cpdaadv/";

    Map<String, String> data = {
      "name": _nameController.text,
      "designation": _designationController.text,
      "pfNo": _pfNoController.text,
      "amountRequired": _amountRequiredController.text,
      "purpose": _purposeController.text,
      "advanceDueAdjustment": _advanceDueController.text,
      "submissionDate": DateTime.now().toIso8601String().substring(0, 10),
      "created_by": datap.user!['id'].toString(),
    };
    Map<String, String> userInfo = {
      "receiver_designation": _receiverDesignationController.text,
      "receiver_name": _receiverNameController.text,
      "uploader_name": datap.user!['username'],
      "uploader_designation": datap.profile!['user_type'],
    };
    var payload = [data, userInfo];
    print(jsonEncode(payload));
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Application Submitted Successfully")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HRHomePage()));
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
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                    TextFormField(
                      controller: _designationController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Designation'),
                      ),
                    ),
                    TextFormField(
                      controller: _pfNoController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('P.F. No.'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter P.F. No correctly.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _amountRequiredController,
                      decoration: const InputDecoration(
                        label: Text('Amount Required'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Amount Required correctly.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _purposeController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Purpose'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Purpose correctly.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _advanceDueController,
                      decoration: const InputDecoration(
                        label: Text('Advance (PDA) due for Adjustment'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Advance (PDA) due for Adjustment correctly or 0 if not applicable.';
                        }
                        return null;
                      },
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
                    ), // instead of TextField()
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          submitForm();
                        }
                        // Respond to button press
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please fill all the fields correctly')),
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
        ));
  }
}
