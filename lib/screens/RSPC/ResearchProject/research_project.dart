import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/services/rspc_service.dart';

import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';

import '../../../services/profile_service.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);

const kInputDateDecoration = InputDecoration(
  labelText: 'Select Date',
  icon: Icon(Icons.calendar_today_rounded),
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);

class AddResearchProject extends StatefulWidget {
  final String? uid;
  AddResearchProject(this.uid);

  @override
  State<AddResearchProject> createState() => _AddResearchProjectState();
}

class _AddResearchProjectState extends State<AddResearchProject> {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? projectIncharge;
  String? coProjectIncharge;
  String? fundingAgency;
  String? projectTitle;
  String? currentStatus;
  String? financialOutlay;
  String? submissionDate;
  String? startDate;
  String? expectedFinishDate;
  String? pfNo;

  List status = [
    'Ongoing',
    'Complete',
  ];
  var service = locator<StorageService>();

  TextEditingController submissionDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController expectedFinishDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Research Project",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add a new Research project',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Project Incharge(PI) *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (input) {
                  projectIncharge = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'This field is mandatory.';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Co-Project Incharge(CO-PI) *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (input) {
                  coProjectIncharge = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'This field is mandatory.';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Title of Project *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (input) {
                  projectTitle = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'This field is mandatory.';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Funding Agency *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (input) {
                  fundingAgency = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'This field is mandatory.';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Status *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Status'),
                    dropdownColor: Colors.grey[200],
                    value: currentStatus,
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (newValue) {
                      setState(() {
                        currentStatus = newValue.toString();
                      });
                    },
                    items: status.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Submission Date *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: TextField(
                  controller: submissionDateController,
                  decoration: kInputDateDecoration,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (pickeddate != null) {
                      setState(() {
                        submissionDateController.text =
                            DateFormat('yyyy-MM-dd').format(pickeddate);
                        submissionDate = submissionDateController.text;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Start Date *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: TextField(
                  controller: startDateController,
                  decoration: kInputDateDecoration,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (pickeddate != null) {
                      setState(() {
                        startDateController.text =
                            DateFormat('yyyy-MM-dd').format(pickeddate);
                        startDate = startDateController.text;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Expected Finish Date *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: TextField(
                  controller: expectedFinishDateController,
                  decoration: kInputDateDecoration,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (pickeddate != null) {
                      setState(() {
                        expectedFinishDateController.text =
                            DateFormat('yyyy-MM-dd').format(pickeddate);
                        expectedFinishDate = expectedFinishDateController.text;
                      });
                    }
                  },
                ),
              ),
              Text(
                'Financial Outlay *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (input) {
                  financialOutlay = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'This field is manadatory.';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (() async {
                    dynamic res = await ProfileService().getProfile();
                    dynamic user = jsonDecode(res.body)['user'];
                    pfNo = user['id'].toString();
                    print(pfNo);
                    RSPCService auth = RSPCService();
                    bool addNewResearchProject = await auth.addResearchProject(
                      projectIncharge: projectIncharge,
                      coProjectIncharge: coProjectIncharge,
                      fundingAgency: fundingAgency,
                      financialOutlay: financialOutlay,
                      currentStatus: currentStatus,
                      projectTitle: projectTitle,
                      startDate: startDate,
                      submissionDate: submissionDate,
                      expectedFinishDate: expectedFinishDate,
                      pfNo: pfNo,
                    );
                    TextInput.finishAutofillContext();
                    if (addNewResearchProject) {
                      print('Successfully added');
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Success"),
                          content: Text("Project Added Successfully"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("okay"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      print('ERROR OCCURED');
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Failed"),
                          content: Text("Cannot add above Research Project."),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("okay"),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.deepOrange;
                        return Colors
                            .deepOrangeAccent; // Use the component's default.
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
