import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/screens/HR/ViewCPDAAdvance.dart';
import 'package:fusion/screens/HR/ViewAppraisal.dart';
import 'package:fusion/screens/HR/ViewLeave.dart';
import 'package:fusion/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;
import 'ViewCPDAReimburse.dart';
import 'ViewLTC.dart';
import 'ForwardLeave.dart';
import 'package:fusion/api.dart';
class UpdateLeavebalance extends StatefulWidget {
  const UpdateLeavebalance();

  @override
  State<UpdateLeavebalance> createState() {
    return _UpdateLeaveBalanceState();
  }
}

class _UpdateLeaveBalanceState extends State<UpdateLeavebalance> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _casualLeaveController = TextEditingController();
  TextEditingController _specialCasualLeaveController = TextEditingController();
  TextEditingController _earnedLeaveController = TextEditingController();
  TextEditingController _commutedLeaveController = TextEditingController();
  TextEditingController _restrictedHolidayController = TextEditingController();
  TextEditingController _stationLeaveController = TextEditingController();
  TextEditingController _vacationLeaveController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var displayData;
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  bool _loading1 = true;
  bool dataFetched = false;

  void initState() {
    super.initState();
    _profileController = StreamController();
    profileService = ProfileService();
    try {
      print("hello");
      datap = service.profileData;
      _loading1 = false;
    } catch (e) {
      getData();
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

  void getLeaveBalance() async {
    final String host = kserverLink;
    final String path = "/hr2/api/leaveBalance/";

    if (_usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid username.")));
      return;
    }

    final queryParameters = {
      'name': _usernameController.text,
    };

    print(queryParameters);

    Uri uri = (Uri.http(host, path, queryParameters));
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var client = http.Client();

    var response = await client.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final rcvdData = jsonDecode(response.body);
      print(rcvdData);
      setState(() {
        displayData = rcvdData;
        _casualLeaveController.text = rcvdData["casualLeave"].toString();
        _commutedLeaveController.text = rcvdData["commutedLeave"].toString();
        _earnedLeaveController.text = rcvdData["earnedLeave"].toString();
        _restrictedHolidayController.text =
            rcvdData["restrictedHoliday"].toString();
        _specialCasualLeaveController.text =
            rcvdData["specialCasualLeave"].toString();
        _vacationLeaveController.text = rcvdData["vacationLeave"].toString();
        _stationLeaveController.text = rcvdData["stationLeave"].toString();
        dataFetched = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to fetch leave balance.")));
    }
  }

  void updateLeaveBalance() async {
    print("aane ka man toh hai");
    final String host = kserverLink;
    final String path = "/hr2/api/leaveBalance/";

    final queryParameters = {
      'name': _usernameController.text,
    };

    Uri uri = (Uri.http(host, path, queryParameters));

    final data = {
      "casualLeave": _casualLeaveController.text,
      "specialCasualLeave": _specialCasualLeaveController.text,
      "earnedLeave": _earnedLeaveController.text,
      "commutedLeave": _commutedLeaveController.text,
      "restrictedHoliday": _restrictedHolidayController.text,
      "stationLeave": _stationLeaveController.text,
      "vacationLeave": _vacationLeaveController.text,
    };

    var response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Successfully Updated leave balance.")));
      getLeaveBalance();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to update Leave balance. Please try again.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Update Leave Balance",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ), // This is default app bar used in all modules
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select the user and form type:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Enter the username of the user',
                        labelText: 'Username',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          getLeaveBalance();
                        },
                        child: const Text("Show Leave Balance")),
                    SizedBox(
                      height: 10,
                    ),
                    dataFetched
                        ? Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _casualLeaveController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text('Casual Leaves Remaining'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid value.';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _specialCasualLeaveController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label:
                                        Text('Special Casual Leaves Remaining'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid value.';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _earnedLeaveController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text('Earned Leaves Remaining'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid value.';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _restrictedHolidayController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label:
                                        Text('Restricted Holidays Remaining'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid value.';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _stationLeaveController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text('Station Leaves Remaining'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid value.';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _vacationLeaveController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text('Vacation Leaves Remaining'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid value.';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _commutedLeaveController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text('Commuted Leaves Remaining'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid value.';
                                    }
                                    return null;
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Update Leave"),
                                              content: Text(
                                                  "Are you sure you want to update leaves of this user?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Cancel")),
                                                TextButton(
                                                    onPressed: () {
                                                      updateLeaveBalance();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Update"))
                                              ],
                                            );
                                          });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please fill all the fields correctly')),
                                      );
                                    }
                                    //  show alert dialog box

                                    // approveForm();
                                    // Respond to decline button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 64, 162, 201),
                                  ),
                                  child: Text(
                                    'Update Leaves',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ))
                        : Container()
                  ]),
            ),
          )),
    );
  }
}
