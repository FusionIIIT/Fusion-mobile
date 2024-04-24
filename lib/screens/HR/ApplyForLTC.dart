import 'dart:convert';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/screens/HR/HRHomePage.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/profile_service.dart';
import 'package:fusion/models/profile.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:fusion/api.dart';
class ApplyForLTC extends StatefulWidget {
  const ApplyForLTC();

  @override
  State<ApplyForLTC> createState() {
    return _ApplyForLTCState();
  }
}

enum BoolField { yes, no }

class _ApplyForLTCState extends State<ApplyForLTC> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _departmentInfoController = TextEditingController();
  TextEditingController _blockYearController = TextEditingController();
  TextEditingController _pfNoController = TextEditingController();
  BoolField _leaveRequired = BoolField.yes;
  TextEditingController _leaveStartDateController = TextEditingController();
  TextEditingController _leaveEndDateController = TextEditingController();
  TextEditingController _dateOfDepartureForFamilyController =
      TextEditingController();
  TextEditingController _natureController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _addressDuringLeaveController = TextEditingController();
  BoolField _homeTown = BoolField.yes;
  TextEditingController _placeOfVisitController = TextEditingController();
  TextEditingController _modeOfTravelController = TextEditingController();
  List<Map<String, TextEditingController>>
      _detailsOfFamilyMembersAlreadyDoneController = [];
  List<Map<String, TextEditingController>>
      _detailsOfFamilyMembersAboutToAvailController = [];
  List<Map<String, TextEditingController>> _detailsOfDependentsController = [];
  TextEditingController _amountOfAdvanceRequiredController =
      TextEditingController();
  BoolField _certifiedThatFamilyDependents = BoolField.yes;
  TextEditingController _certifiedThatAdvanceTakenOn = TextEditingController();
  TextEditingController _adjustedMonthController = TextEditingController();
  TextEditingController _phoneNumberForContactController =
      TextEditingController();
  TextEditingController _basicPaySalaryController = TextEditingController();
  TextEditingController _receiverNameController = TextEditingController();
  List<String> rowKeys = ['Name', 'Relation', 'Age', 'Why Fully Dependent?'];
  List<String> rowKeys2 = ['Name', 'Relation', 'Age'];
  late List<dynamic> designationsOfReceiver = [];
  TextEditingController _receiverDesignationController =
      TextEditingController();
  bool fetchedDesignationsOfReceiver = false;
  final _formKey = GlobalKey<FormState>();
  late StreamController _profileController;
  late ProfileService profileService;
  late ProfileData datap;
  
  var service = locator<StorageService>();
  late var token = service.userInDB!.token;
  late String curr_desig = service.getFromDisk("Current_designation");
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

  void submitForm() async {
    final String url = "http://${kserverLink}/hr2/api/ltc/";
    Map<String, dynamic> data = {
      "name": _nameController.text,
      "employeeId": (datap.user)!['id'],
      "designation": _designationController.text,
      "departmentInfo": _departmentInfoController.text,
      "blockYear": _blockYearController.text,
      "pfNo": _pfNoController.text,
      "basicPaySalary": _basicPaySalaryController.text,

      "leaveRequired": _leaveRequired == BoolField.yes ? true : false,
      'leaveStartDate': _leaveStartDateController.text == ""
          ? null
          : DateFormat("yyyy-MM-dd")
              .format(DateTime.parse(_leaveStartDateController.text))
              .substring(0, 10),
      'leaveEndDate': _leaveEndDateController.text == ""
          ? null
          : DateFormat("yyyy-MM-dd")
              .format(DateTime.parse(_leaveEndDateController.text))
              .substring(0, 10),
      "dateOfDepartureForFamily": _dateOfDepartureForFamilyController.text == ""
          ? null
          : DateFormat("yyyy-MM-dd")
              .format(DateTime.parse(_dateOfDepartureForFamilyController.text))
              .substring(0, 10), // "if not availing for self"
      "natureOfLeave": _natureController.text,
      "purposeOfLeave": _purposeController.text,
      "addressDuringLeave": _addressDuringLeaveController.text,
      "modeofTravel": _modeOfTravelController.text,
      "placeOfVisit": _placeOfVisitController.text,
      "detailsOfFamilyMembersAlreadyDone":
          _detailsOfFamilyMembersAlreadyDoneController
              .map((member) => {
                    'name': member['Name']!.text,
                    'relation': member['Relation']!.text,
                    'age': member['Age']!.text,
                  })
              .toList(),
      "detailsOfFamilyMembersAboutToAvail":
          _detailsOfFamilyMembersAboutToAvailController
              .map((member) => {
                    'name': member['Name']!.text,
                    'relation': member['Relation']!.text,
                    'age': member['Age']!.text,
                  })
              .toList(),
      "detailsOfDependents": _detailsOfDependentsController
          .map((member) => {
                'name': member['Name']!.text,
                'relation': member['Relation']!.text,
                'age': member['Age']!.text,
                'whyFullyDependent': member['Why Fully Dependent?']!.text,
              })
          .toList(),
      "hometownOrNot": _homeTown == BoolField.yes ? true : false,
      "amountOfAdvanceRequired": _amountOfAdvanceRequiredController.text,
      "certifiedThatFamilyDependents":
          _certifiedThatFamilyDependents == BoolField.yes ? true : false,
      "certifiedThatAdvanceTakenOn": _certifiedThatAdvanceTakenOn.text == ""
          ? null
          : DateFormat("yyyy-MM-dd")
              .format(DateTime.parse(_certifiedThatAdvanceTakenOn.text))
              .substring(0, 10),
      "adjustedMonth": _adjustedMonthController.text,
      "phoneNumberForContact": _phoneNumberForContactController.text,
      "submissionDate": DateTime.now().toIso8601String().substring(0, 10),
      "created_by": datap.user!['id'].toString(),
    };
    Map<String, String> userInfo = {
      "receiver_designation": _receiverDesignationController.text,
      "receiver_name": _receiverNameController.text,
      "uploader_name": datap.user!['username'],
      "uploader_designation": curr_desig,
    };

    var payload = [data, userInfo];
    print(jsonEncode(payload));
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
    // send a post request to the server for creating the request
    // if the request is successful, show a snackbar with the message
    // if the request is unsuccessful, show a snackbar with the error message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          curr_desig: curr_desig,
          headerTitle: "Apply For LTC",
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
          child: Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      controller: _departmentInfoController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Department/Section'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Department/Section';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _basicPaySalaryController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Basic Pay Salary'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Basic Pay Salary';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _blockYearController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('BlockYear'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your BlockYear';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _pfNoController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('P.F. No.'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your P.F. No.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Is leave required?',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    RadioListTile<BoolField>(
                      title: const Text('Yes'),
                      value: BoolField.yes,
                      groupValue: _leaveRequired,
                      onChanged: (BoolField? value) {
                        setState(() {
                          _leaveRequired = value!;
                        });
                      },
                    ),

                    RadioListTile<BoolField>(
                      title: const Text('No'),
                      value: BoolField.no,
                      groupValue: _leaveRequired,
                      onChanged: (BoolField? value) {
                        setState(() {
                          _leaveRequired = value!;
                        });
                      },
                    ),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText: 'Leave Start Date',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        _leaveStartDateController.text =
                            value.toIso8601String();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText: 'Leave End Date',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        _leaveEndDateController.text = value.toIso8601String();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText: 'Date of Leave for Family',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        _dateOfDepartureForFamilyController.text =
                            value.toIso8601String();
                      },
                    ),
                    TextFormField(
                      controller: _natureController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Nature of Leave'),
                      ),
                    ),
                    TextFormField(
                      controller: _purposeController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Purpose of Leave'),
                      ),
                    ),
                    TextFormField(
                      controller: _addressDuringLeaveController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Address During Leave'),
                      ),
                    ),

                    Text(
                      'Is this your hometown?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    RadioListTile<BoolField>(
                      title: const Text('Yes'),
                      value: BoolField.yes,
                      groupValue: _homeTown,
                      onChanged: (BoolField? value) {
                        setState(() {
                          _homeTown = value!;
                        });
                      },
                    ),
                    RadioListTile<BoolField>(
                      title: const Text('No'),
                      value: BoolField.no,
                      groupValue: _homeTown,
                      onChanged: (BoolField? value) {
                        setState(() {
                          _homeTown = value!;
                        });
                      },
                    ),
                    TextFormField(
                      controller: _placeOfVisitController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Place of Visit'),
                      ),
                    ),
                    TextFormField(
                      controller: _modeOfTravelController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Mode of Travel'),
                      ),
                    ),
                    TextFormField(
                      controller: _amountOfAdvanceRequiredController,
                      decoration: const InputDecoration(
                        label: Text('Amount of Advance if any required'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your amount';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Certified that family dependents for whom the LTC is claimed are residing with me and are fully dependent on me',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    RadioListTile<BoolField>(
                      title: const Text('Yes'),
                      value: BoolField.yes,
                      groupValue: _certifiedThatFamilyDependents,
                      onChanged: (BoolField? value) {
                        setState(() {
                          _certifiedThatFamilyDependents = value!;
                        });
                      },
                    ),
                    RadioListTile<BoolField>(
                      title: const Text('No'),
                      value: BoolField.no,
                      groupValue: _certifiedThatFamilyDependents,
                      onChanged: (BoolField? value) {
                        setState(() {
                          _certifiedThatFamilyDependents = value!;
                        });
                      },
                    ),

                    DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText:
                            'Certified that the previous LTC advance is drawn by me on',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        _certifiedThatAdvanceTakenOn.text =
                            value.toIso8601String();
                      },
                    ),
                    TextFormField(
                      controller: _adjustedMonthController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('LTC advance adjusted in the month of'),
                      ),
                    ),
                    TextFormField(
                      controller: _phoneNumberForContactController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Phone number for contact'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Phone No.';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    _buildSectionTitle(
                        'Details of Family Members for whom L.T.C. for this block has already been availed'),
                    _buildCourseTable(
                        _detailsOfFamilyMembersAlreadyDoneController, rowKeys2),
                    _buildSectionTitle(
                        'Details of Family Members who will avail L.T.C.'),
                    _buildCourseTable(
                        _detailsOfFamilyMembersAboutToAvailController,
                        rowKeys2), // instead of TextField()
                    _buildSectionTitle(
                        'Dependent parents, minor brothers and sisters residing with the applicant'),
                    _buildCourseTable(_detailsOfDependentsController, rowKeys),
                    TextFormField(
                      controller: _receiverNameController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Receiver\'s Name '),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the receiver name.';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          getDesignations();
                          print(designationsOfReceiver);
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
                        if (_formKey.currentState!.validate()) {
                          //   // If the form is valid, display a snackbar. In the real world,
                          //   // you'd often call a server or save the information in a database.
                          if (DateTime.parse(_leaveEndDateController.text).isBefore(
                              DateTime.parse(_leaveStartDateController.text))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'End Date should be after Start Date')),
                            );
                            return;
                          } else if (DateTime.parse(
                                  _certifiedThatAdvanceTakenOn.text)
                              .isAfter(DateTime.now())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Advance Taken Date should be before current date')),
                            );
                            return;
                          } else if (DateTime.parse(_certifiedThatAdvanceTakenOn.text).isAfter(
                              DateTime.parse(_leaveStartDateController.text))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Advance Taken Date should be before Leave Start Date')),
                            );
                            return;
                          } else if (DateTime.parse(_certifiedThatAdvanceTakenOn.text).isAfter(
                              DateTime.parse(_leaveEndDateController.text))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Advance Taken Date should be before Leave End Date')),
                            );
                            return;
                          } else if (DateTime.parse(_dateOfDepartureForFamilyController.text).isAfter(
                              DateTime.parse(_leaveStartDateController.text))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Date of Departure for Family should be before Leave Start Date')),
                            );
                            return;
                          } else if (DateTime.parse(_dateOfDepartureForFamilyController.text).isAfter(
                              DateTime.parse(_leaveEndDateController.text))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Date of Departure for Family should be before Leave End Date')),
                            );
                            return;
                          } else if (DateTime.parse(_leaveStartDateController.text)
                              .isBefore(DateTime.now())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Start Date should be after current date')),
                            );
                            return;
                          } else if (DateTime.parse(_leaveEndDateController.text)
                              .isBefore(DateTime.now())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'End Date should be after current date')),
                            );
                            return;
                          } else if (DateTime.parse(
                                  _dateOfDepartureForFamilyController.text)
                              .isBefore(DateTime.now())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Date of Departure for Family should be after current date')),
                            );
                            return;
                          }

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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextInputField(String labelText,
      {TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  Widget _buildTextInputFieldTable(
      String labelText, TextEditingController? controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }

  Widget _buildCourseTable(List<Map<String, TextEditingController>> _courseRows,
      List<String> _courseRowTitles) {
    return Column(
      children: [
        for (int i = 0; i < _courseRows.length; i++)
          ..._buildCourseRow(i, _courseRows, _courseRowTitles),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            //  ek alag se object banana padega
            //  fir usko _courseRows me add karna padega
            Map<String, TextEditingController> newRow = {};
            for (String title in _courseRowTitles) {
              newRow[title] = TextEditingController();
            }
            setState(() {
              _courseRows.add(newRow);
            });
          },
          child: Text('Add Row'),
        ),
      ],
    );
  }

  List<Widget> _buildCourseRow(
      int index,
      List<Map<String, TextEditingController>> _courseRows,
      List<String> _courseRowTitles) {
    return [
      Row(
        children: [
          // display a text field for each _courseRowtitle
          for (String title in _courseRowTitles) ...[
            Expanded(
              child:
                  _buildTextInputFieldTable(title, _courseRows[index][title]),
            ),
            SizedBox(width: 10),
          ],
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _courseRows.removeAt(index);
              });
            },
          ),
        ],
      ),
      SizedBox(height: 10),
    ];
  }

  // Widget _buildProjectTable() {
  //   return Column(
  //     children: [
  //       for (int i = 0; i < _projectRows.length; i++) ..._buildProjectRow(i),
  //       SizedBox(height: 10),
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //             _projectRows.add({
  //               'title': TextEditingController(),
  //               'sponsoringAgency': TextEditingController(),
  //               'projectFunding': TextEditingController(),
  //               'projectDuration': TextEditingController(),
  //             });
  //           });
  //         },
  //         child: Text('Add Row'),
  //       ),
  //     ],
  //   );
  // }

  // List<Widget> _buildProjectRow(int index) {
  //   return [
  //     Row(
  //       children: [
  //         Text('${index + 1}.'),
  //         SizedBox(width: 10),
  //         Expanded(
  //           child: _buildTextInputFieldTable(
  //               'Title of\nproject', _projectRows[index]['title']),
  //         ),
  //         SizedBox(width: 10),
  //         Expanded(
  //           child: _buildTextInputFieldTable(
  //               'Sponsoring\nAgency', _projectRows[index]['sponsoringAgency']),
  //         ),
  //         SizedBox(width: 10),
  //         Expanded(
  //           child: _buildTextInputFieldTable(
  //               'Project\nFunding', _projectRows[index]['projectFunding']),
  //         ),
  //         SizedBox(width: 10),
  //         Expanded(
  //           child: _buildTextInputFieldTable(
  //               'Project\nDuration', _projectRows[index]['projectDuration']),
  //         ),
  //         IconButton(
  //           icon: Icon(Icons.delete),
  //           onPressed: () {
  //             setState(() {
  //               _projectRows.removeAt(index);
  //             });
  //           },
  //         ),
  //       ],
  //     ),
  //     SizedBox(height: 10),
  //   ];
  // }
}
