import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../api.dart';

void main() {
  runApp(MyApp());
}

class Doctor {
  String name;
  String contactNumber;
  String specialization;
  bool isActive;

  Doctor({
    required this.name,
    required this.contactNumber,
    required this.specialization,
    required this.isActive,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorListScreen(),
    );
  }
}

class DoctorListScreen extends StatefulWidget {
  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  List<Doctor> doctors = [];
  late String token;
  bool _selectedValue = true;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = prefs.getString('user') ?? '';
    if (userData.isNotEmpty) {
      Map<String, dynamic> userMap = json.decode(userData);
      setState(() {
        token = userMap['token'] ?? '';
      });
    }
  }

  Future<void> _addDoctor(String name, String contactNumber, String specialization, bool isActive) async {
    final url = "http://"+ kserverLink + "/healthcenter/api/compounder/request"; // Replace with your actual backend URL
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        "doctoradd":true,
        'doctor_name': name,
        'doctor_phone': contactNumber,
        'specialization': specialization,
        'active': isActive.toString(),
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );

    if (response.statusCode == 201) {
      // If the server returns a success response, add the doctor locally
      setState(() {
        doctors.add(
          Doctor(
            name: name,
            contactNumber: contactNumber,
            specialization: specialization,
            isActive: isActive,
          ),
        );
      });
    } else {
      // If the server returns an error response, print the error message
      print('Failed to add doctor: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doctors[index].name),
            subtitle: Text(doctors[index].specialization),
            trailing: doctors[index].isActive
                ? Icon(Icons.check_circle, color: Colors.green)
                : Icon(Icons.cancel, color: Colors.red),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDoctorDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddDoctorDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController specializationController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Add Doctor'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter name',
                      ),
                    ),
                    TextField(
                      controller: contactController,
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        hintText: 'Enter contact number',
                      ),
                    ),
                    TextField(
                      controller: specializationController,
                      decoration: InputDecoration(
                        labelText: 'Specialization',
                        hintText: 'Enter specialization',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Text('Active Status:'),
                        SizedBox(width: 10),
                        DropdownButton<bool>(
                          value: _selectedValue,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _selectedValue = newValue!;
                            });
                          },
                          items: <bool>[true, false].map<DropdownMenuItem<bool>>((bool value) {
                            return DropdownMenuItem<bool>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _addDoctor(
                          nameController.text,
                          contactController.text,
                          specializationController.text,
                          _selectedValue,
                        );
                        Navigator.of(context).pop();
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
