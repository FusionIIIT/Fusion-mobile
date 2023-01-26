import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? projectIncharge;
  String? coProjectIncharge;
  String? fundingAgency;
  List status = [
    'Ongoing',
    'Complete',
  ];
  String? projectTitle;
  var service = locator<StorageService>();

  TextEditingController submissionDate = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController expectedFinishDate = TextEditingController();

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
                  // specific_location = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter specific_location';
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
                  // specific_location = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter specific_location';
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
                  // specific_location = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter specific_location';
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
                  // specific_location = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter specific_location';
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
                  controller: submissionDate,
                  decoration: kInputDateDecoration,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (pickeddate != null) {
                      setState(() {
                        submissionDate.text =
                            DateFormat('dd-MM-yyyy').format(pickeddate);
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
                  controller: startDate,
                  decoration: kInputDateDecoration,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (pickeddate != null) {
                      setState(() {
                        startDate.text =
                            DateFormat('dd-MM-yyyy').format(pickeddate);
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
                  onPressed: (() {}),
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
