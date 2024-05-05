import 'package:flutter/material.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class CurriculumForm extends StatefulWidget {
  @override
  _CurriculumFormState createState() => _CurriculumFormState();
}

class _CurriculumFormState extends State<CurriculumForm> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var version = 1;
  var batch = "";
  var numOfSemester = 0; // Changed to integer

  final nameController = TextEditingController();
  final versionController = TextEditingController();
  final batchController = TextEditingController();
  final numOfSemesterController = TextEditingController();

  // this is one method to create a notification .....
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
      ),
    );
  }

  void sendData(BuildContext context, String name, int version, String batch,
      int no_of_semester) async {
    var url =
        'https://script.google.com/macros/s/AKfycbzEAfs5su95Cgc7QRgxBzZRmveReRi_DFc0Ck7KOcm7RrW-JiM-Sj3TJywFfF9YfbJd/exec';

    var body = {
      'name': name,
      'version': version,
      'batch': batch,
      'no_of_semester': no_of_semester
    };

    var response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(body));

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
    nameController.dispose();
    versionController.dispose();
    batchController.dispose();
    numOfSemesterController.dispose();
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
                'Add Curriculum',
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
                        labelText: 'Name: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Version: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: versionController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Version';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Batch: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: batchController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Batch';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Number of Semesters: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: numOfSemesterController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Number of Semesters';
                        } else if (!isValidSemester(value!)) {
                          return 'Please Enter a Valid Semester (1 - 8)';
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
                            name = nameController.text;
                            version = int.parse(versionController.text);
                            batch = batchController.text;
                            numOfSemester = int.parse(numOfSemesterController
                                .text); // Parse to integer

                            nameController.clear();
                            versionController.clear();
                            batchController.clear();
                            numOfSemesterController.clear();

                            // Show Snackbar when form is submitted successfully
                            sendData(
                                context, name, version, batch, numOfSemester);
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
              Text(
                'Recently added data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
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
                          'Name: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$name',
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
                          'Version: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$version',
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
                          'Batch: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$batch',
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
                          'Number of Semesters: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$numOfSemester',
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

  bool isValidSemester(String value) {
    try {
      int semester = int.parse(value);
      return semester >= 1 && semester <= 8;
    } catch (e) {
      return false;
    }
  }
}
