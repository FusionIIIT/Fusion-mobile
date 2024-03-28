import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BatchesForm extends StatefulWidget {
  @override
  _BatchesFormState createState() => _BatchesFormState();
}

class _BatchesFormState extends State<BatchesForm> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var discipline = "";
  var year = 0; // Changed to integer
  var curriculum = "";

  final nameController = TextEditingController();
  final disciplineController = TextEditingController();
  final yearController = TextEditingController();
  final curriculumController = TextEditingController();

  // this is one method to create a notification .....
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
      ),
    );
  }

  void sendData(BuildContext context, String name, String discipline, int year,
      String curriculum) async {
    var url =
        'https://script.google.com/macros/s/AKfycbxKaBfhdhiWdes8OhLlgh0jvK7NEvEJmeu1kdCFJS6YgKcUltn3Xx9kPyoLE5qy66wqNA/exec';

    var body = {
      'name': name,
      'discipline': discipline,
      'year': year,
      'curriculum': curriculum
    };

    var response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(body));

    if (response.statusCode == 200) {
      print('Data sent successfully');
      print('Response: ${response.body}');
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    disciplineController.dispose();
    yearController.dispose();
    curriculumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double targetHeight = 0.8 * screenHeight; // 80% of screen height

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
                'Add Batch',
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
                        labelText: 'Discipline: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: disciplineController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Discipline';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Year: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: yearController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Year';
                        } else if (!isValidYear(value!)) {
                          return 'Please Enter a Valid Year (2005 - ${DateTime.now().year})';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Curriculum: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: curriculumController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Curriculum';
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
                            discipline = disciplineController.text;
                            year = int.parse(
                                yearController.text); // Parse to integer
                            curriculum = curriculumController.text;

                            _showSnackbar(context, 'Batch added successfully');

                            sendData(
                                context, name, discipline, year, curriculum);

                            nameController.clear();
                            disciplineController.clear();
                            yearController.clear();
                            curriculumController.clear();

                            // Show Snackbar when form is submitted successfully
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
                          'Discipline: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$discipline',
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
                          'Year: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$year',
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
                          'Curriculum: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$curriculum',
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
