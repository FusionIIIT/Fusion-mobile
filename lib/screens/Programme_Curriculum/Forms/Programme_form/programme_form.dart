import 'package:flutter/material.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
// import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';

class ProgrammeForm extends StatefulWidget {
  @override
  _ProgrammeFormState createState() => _ProgrammeFormState();
}

class _ProgrammeFormState extends State<ProgrammeForm> {
  final _formKey = GlobalKey<FormState>();
  var programmeCategory = "";
  var programmeName = "";
  var beginYear = 0; // Changed to integer
  var descipline = "";

  final programmeCategoryController = TextEditingController();
  final programmeNameController = TextEditingController();
  final beginYearController = TextEditingController();
  final desciplineController = TextEditingController();

  // this is one method to create a notification .....
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
      ),
    );
  }

  void sendData(BuildContext context, String category, String name,
      int beginYear, String descipline) async {
    var storageService = locator<StorageService>();
    if (storageService.userInDB?.token == null) throw Exception('Token Error');

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storageService.userInDB?.token ?? "")
    };

    String programmeBeginYear = beginYear.toString();

    var body = {
      'category': category,
      'name': name,
      'programme_begin_year': programmeBeginYear,
      'discipline': descipline
    };

    var client = http.Client();

    var response = await client.post(
      Uri.http(getLink(), kAddProgrammes),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('Data sent successfully');
      print('Response: ${response.body}');
      _showSnackbar(context, 'Batch added successfully');
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  }

  @override
  void dispose() {
    programmeCategoryController.dispose();
    programmeNameController.dispose();
    beginYearController.dispose();
    desciplineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var service = locator<StorageService>();
    late String curr_desig = service.getFromDisk("Current_designation");
    double screenHeight = MediaQuery.of(context).size.height;
    double targetHeight = 0.8 * screenHeight; // 80% of screen height

    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Programme and Curriculum",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(curr_desig: curr_desig),
      body: Container(
        height: targetHeight,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Programme',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.redAccent, // Orange underline
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Programme Category: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: programmeCategoryController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Programme Category';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Programme Name: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: programmeNameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Programme Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Begin Year: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: beginYearController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Begin Year';
                        } else if (!isValidYear(value!)) {
                          return 'Please Enter a Valid Year (2005 - ${DateTime.now().year})';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Discipline : ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: desciplineController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Discipline name ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height:
                            20), // Add vertical space between form fields and button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          setState(() {
                            programmeCategory =
                                programmeCategoryController.text;
                            programmeName = programmeNameController.text;
                            beginYear = int.parse(
                                beginYearController.text); // Parse to integer
                            descipline = desciplineController.text;

                            // clear the form fields once we get the data ....
                            programmeCategoryController.clear();
                            programmeNameController.clear();
                            beginYearController.clear();
                            desciplineController.clear();

                            // Show Snackbar when form is submitted successfully
                            sendData(context, programmeCategory, programmeName,
                                beginYear, descipline);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .redAccent, // Set background color to redAccent
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Set text to bold
                          fontSize: 18, // Set text size
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      20), // Add vertical space between button and below text
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 15), // Add horizontal space

                    Row(
                      children: [
                        Text(
                          'Programme Category: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$programmeCategory',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15), // Add horizontal space

                    Row(
                      children: [
                        Text(
                          'Programme Name: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$programmeName',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15), // Add horizontal space

                    Row(
                      children: [
                        Text(
                          'Begin Year: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$beginYear',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15), // Add horizontal space

                    Row(
                      children: [
                        Text(
                          'Discipline : ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$descipline',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidYear(String value) {
    try {
      int year = int.parse(value);
      int currentYear = DateTime.now().year;
      return year >= 2005 && year <= currentYear;
    } catch (e) {
      return false;
    }
  }
}
