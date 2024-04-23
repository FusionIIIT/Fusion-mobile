import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/application_data_provider.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/student_homepage.dart';
import 'package:provider/provider.dart';

class ConvocationMedalForm extends StatefulWidget {
  const ConvocationMedalForm({super.key});

  @override
  State<ConvocationMedalForm> createState() => _ConvocationMedalFormState();
}

class _ConvocationMedalFormState extends State<ConvocationMedalForm> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var rollnoController = TextEditingController();
  var categoryController = TextEditingController();
  var hallNoController = TextEditingController();
  var roomNOController = TextEditingController();

  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var brotherOccupationController = TextEditingController();
  var addressController = TextEditingController();
  var cpiController = TextEditingController();

  void onTap() {
    Provider.of<ApplicationDataProvider>(context, listen: false)
        .addApplication({
      'id': formKey,
      'type': 'Convocation',
      'name': nameController.text,
      'room_no': roomNOController.text,
      'roll_no': rollnoController.text,
      'father_name': fatherNameController.text,
      'mother_name': motherNameController.text,
      'cpi': cpiController,
      'category': categoryController,
      'address': addressController,
      'status': 'Under Process',
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StudentHomePage()),
    );
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Application Submitted'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
     appBar: AppBar(title: Text('Apply For Awards'),backgroundColor: Colors.deepOrangeAccent,),
      body: Column(children: [
        SizedBox(height: 15),
        Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 380,
                      child: Expanded(
                          child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 380,
                      child: Expanded(
                          child: TextField(
                        controller: rollnoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Roll No',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your Roll No',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      width: 170,
                      child: Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            labelText: 'Room No',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'Enter your Room No',
                            hintStyle: TextStyle(color: Colors.grey[300]),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 170,
                      child: Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Hall No',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your Hall No',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      )),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      width: 170,
                      child: Expanded(
                        child: TextField(
                          controller: cpiController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            labelText: 'CPI',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'Enter your CPI',
                            hintStyle: TextStyle(color: Colors.grey[300]),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 170,
                      child: Expanded(
                          child: TextField(
                        controller: categoryController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Category',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your Category',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      )),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 380,
                      child: Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Fathers Name',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your FatherName',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 380,
                      child: Expanded(
                          //
                          child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: "Mother's Name",
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your Mother Name',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 380,
                      child: Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Permanant Address:',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your Permanant Address',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          onTap();
                        },
                        child: Text('Submit')),
                    Spacer(),
                  ],
                )
              ],
            ))
      ]),
    ));
  }
}
