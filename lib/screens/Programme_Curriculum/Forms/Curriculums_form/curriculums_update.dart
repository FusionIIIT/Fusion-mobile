import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Curriculumupdate extends StatefulWidget {
  @override
  _Curriculumupdate createState() => _Curriculumupdate();
}

class _Curriculumupdate extends State<Curriculumupdate> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var version = 1;
  var batch = "";
  var numOfSemester = 0; // Changed to integer

  final nameController = TextEditingController();
  final versionController = TextEditingController();
  final batchController = TextEditingController();
  final numOfSemesterController = TextEditingController();

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
    double screenHeight = MediaQuery.of(context).size.height;
    double targetHeight = 0.8 * screenHeight;
    print(
        "Right now Update form    BWFHVWKVBKABWKJBVJAJBVJ,SBJBVJMHWAVRJUSBVKSVJMSBMBSJHJMH");
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    print(arguments);
    nameController.text = arguments['e'][0];
    versionController.text = arguments['e'][1].toString();
    batchController.text = arguments['e'][2].toString();
    numOfSemesterController.text = arguments['e'][3].toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "FUSION",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: Container(
        height: targetHeight,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Update Curriculum',
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
                            _showSnackbar(
                                context, 'Curriculum updated successfully');
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
                'Recently Updated data',
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
