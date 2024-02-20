import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
      int begin_year, String descipline) async {
    var url =
        'https://script.google.com/macros/s/AKfycbxaIqq8_XzUf0nTLhMYxrC6dqQ7mqoN5LgV4Ln2M6j731juYrHpsKt6EhiBlTjD6kRl/exec';
    var urlug =
        "https://script.google.com/macros/s/AKfycbwKksYndwjR7sNcbzCi7SnLsdKZYbXEhVVL5dv65EexIgA-Kb63hGWbykZJSG800aaK7A/exec";
    var urlpg =
        "https://script.google.com/macros/s/AKfycbzoYJwyR1eYz1XXi6Pt5Lp0YfRPoeAY6Cy_0XC6ZNXj9RsvgihBcUzJj8hSMqp4mSJRrQ/exec";
    var urlphd =
        "https://script.google.com/macros/s/AKfycby-dMkQuZGjGbcRHFDzYpEFHvRBOKwZaFy9k20Ypq-HgX1O0kIK-0ErvGBitMQPuwOBnA/exec";
    var body = {
      'category': category,
      'name': name,
      'begin_year': begin_year,
      'discipline': descipline
    };
    if (category == "UG") {
      var bodyug = {'programmes': name, 'discipline': descipline};
      var response1 = await http.post(Uri.parse(urlug),
          headers: {'Content-Type': 'application/json'},
          body: convert.jsonEncode(bodyug));
    } else if (category == "PG") {
      var bodypg = {'programmes': name, 'discipline': descipline};
      var response1 = await http.post(Uri.parse(urlug),
          headers: {'Content-Type': 'application/json'},
          body: convert.jsonEncode(bodypg));
    } else if (category == "PHD") {
      var bodyphd = {'programmes': name, 'discipline': descipline};
      var response1 = await http.post(Uri.parse(urlug),
          headers: {'Content-Type': 'application/json'},
          body: convert.jsonEncode(bodyphd));
    }

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
    programmeCategoryController.dispose();
    programmeNameController.dispose();
    beginYearController.dispose();
    desciplineController.dispose();
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
