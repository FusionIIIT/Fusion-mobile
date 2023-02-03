import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/services/rspc_service.dart';

import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';

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

class AddConsultancyProject extends StatefulWidget {
  final String? uid;
  AddConsultancyProject(this.uid);

  @override
  State<AddConsultancyProject> createState() => _AddConsultancyProjectState();
}

class _AddConsultancyProjectState extends State<AddConsultancyProject> {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? consultant;
  String? clientName;
  String? financialOutlay;
  String? projectTitle;
  String? startDate;
  String? endDate;

  var service = locator<StorageService>();

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Consultancy Project",
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
                'Add a Consultancy Project',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Consultant *',
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
                  consultant = input;
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
              Text(
                'Client *',
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
                  clientName = input;
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
              Text(
                'Title *',
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
                    return 'This field is manadatory.';
                  }
                },
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
                            DateFormat('dd-MM-yyyy').format(pickeddate);
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
                'End Date *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: TextField(
                  controller: endDateController,
                  decoration: kInputDateDecoration,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (pickeddate != null) {
                      setState(() {
                        endDateController.text =
                            DateFormat('dd-MM-yyyy').format(pickeddate);
                        endDate = endDateController.text;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (() async {
                    RSPCService auth = RSPCService();
                    bool newConsultancyProject =
                        await auth.addConsultancyProject(
                            consultant: consultant,
                            clientName: clientName,
                            financialOutlay: financialOutlay,
                            startDate: startDate,
                            endDate: endDate);
                    TextInput.finishAutofillContext();
                    if (newConsultancyProject) {
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
                          content:
                              Text("Cannot add above Consultancy Project."),
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
