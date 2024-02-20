import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class CoursesProposalForm extends StatefulWidget {
  @override
  _CoursesProposalFormState createState() => _CoursesProposalFormState();
}

class _CoursesProposalFormState extends State<CoursesProposalForm> {
  final _formKey = GlobalKey<FormState>();
  var courseCode = "";
  var courseName = "";
  var credit = 0; // Changed to integer
  var description = "";

  final courseCodeController = TextEditingController();
  final courseNameController = TextEditingController();
  final creditController = TextEditingController();
  final descriptionController = TextEditingController();

  var submittedDescription =
      ""; // New variable to store description after submission

  // this is one method to create a notification .....
  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Course Proposal added successfully'),
        duration: Duration(seconds: 4), // Set the duration of the Snackbar
      ),
    );
  }

  @override
  void dispose() {
    courseCodeController.dispose();
    courseNameController.dispose();
    creditController.dispose();
    descriptionController.dispose();
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
                'Add Course Proposal',
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
                        labelText: 'Course Code: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: courseCodeController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Course Code';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Course Name: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: courseNameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Course Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Credit: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: creditController,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Credit';
                        } else if (!isValidCredit(value!)) {
                          return 'Please Enter a Valid Credit (1 - 6)';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description: ',
                        labelStyle: TextStyle(fontSize: 20),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      controller: descriptionController,
                      validator: (value) {
                        // No validation for description
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
                            courseCode = courseCodeController.text;
                            courseName = courseNameController.text;
                            credit = int.parse(
                                creditController.text); // Parse to integer
                            submittedDescription = descriptionController
                                .text; // Store description value
                            print("coursecode: $courseCode");

                            courseCodeController.clear();
                            courseNameController.clear();
                            creditController.clear();
                            descriptionController.clear();
                            // Show Snackbar when form is submitted successfully
                            _showSnackbar(context);
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
                          'Course Code: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$courseCode',
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
                          'Course Name: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$courseName',
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
                          'Credit: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$credit',
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
                          'Description: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: Text(
                            '$submittedDescription',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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

  bool isValidCredit(String value) {
    try {
      int credit = int.parse(value);
      return credit >= 1 && credit <= 6;
    } catch (e) {
      return false;
    }
  }
}
