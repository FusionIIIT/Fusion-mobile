import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class Doctor {
  int id;
  TimeOfDay startTime;
  TimeOfDay endTime;
  List<String> daysAvailable;

  Doctor(this.id, this.startTime, this.endTime, this.daysAvailable);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Availability',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorAvailabilityPage(),
    );
  }
}

class DoctorAvailabilityPage extends StatefulWidget {
  @override
  _DoctorAvailabilityPageState createState() =>
      _DoctorAvailabilityPageState();
}

class _DoctorAvailabilityPageState extends State<DoctorAvailabilityPage> {
  List<Doctor> doctors = [];
  List<String> selectedDays = [];

  int? dropdownValue;
  String? dropdownDayValue;

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void initState() {
    super.initState();
    dropdownValue = doctors.isNotEmpty ? doctors[0].id : null;
    dropdownDayValue = daysOfWeek.isNotEmpty ? daysOfWeek[0] : null;

    doctors.add(Doctor(1, TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 17, minute: 0), ['Monday', 'Wednesday', 'Friday']));
    doctors.add(Doctor(
        2,
        TimeOfDay(hour: 8, minute: 30),
        TimeOfDay(hour: 16, minute: 30),
        ['Tuesday', 'Thursday']));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Availability'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Doctor ID: ${doctors[index].id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Days Available: ${doctors[index].daysAvailable.join(', ')}'),
                Text(
                    'Availability: ${formatTime(doctors[index].startTime)} - ${formatTime(doctors[index].endTime)}'),
              ],
            ),
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

  String formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    final formattedTime = DateFormat('HH:mm:ss').format(dateTime);
    return formattedTime;
  }

  void _showAddDoctorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TimeOfDay startTime = TimeOfDay.now();
        TimeOfDay endTime = TimeOfDay.now();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add Doctor'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<int>(
                    value: dropdownValue,
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: doctors.map<DropdownMenuItem<int>>((Doctor doctor) {
                      return DropdownMenuItem<int>(
                        value: doctor.id,
                        child: Text('Doctor ID: ${doctor.id}'),
                      );
                    }).toList(),
                    hint: Text('Select Doctor'),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: dropdownDayValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownDayValue = newValue;
                      });
                    },
                    items: daysOfWeek
                        .map<DropdownMenuItem<String>>((String day) {
                      return DropdownMenuItem<String>(
                        value: day,
                        child: Text(day),
                      );
                    }).toList(),
                    hint: Text('Select Day'),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text("Start Time"),
                    trailing: TextButton(
                      onPressed: () async {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          setState(() {
                            startTime = selectedTime;
                          });
                        }
                      },
                      child: Text(formatTime(startTime)),
                    ),
                  ),
                  ListTile(
                    title: Text("End Time"),
                    trailing: TextButton(
                      onPressed: () async {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          setState(() {
                            endTime = selectedTime;
                          });
                        }
                      },
                      child: Text(formatTime(endTime)),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addDoctor(startTime, endTime);
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _addDoctor(TimeOfDay startTime, TimeOfDay endTime) async {
    int id = dropdownValue!;
    List<String> daysAvailable = [dropdownDayValue!];
    Doctor newDoctor = Doctor(id, startTime, endTime, daysAvailable);
    setState(() {
      doctors.add(newDoctor);
    });

    final String url = 'http://127.0.0.1:8000/healthcenter/api/compounder/request';
    final Map<String, dynamic> requestData = {
      'doctorscheduleadd': true,
      'doctor_id': id,
      'startTime': formatTime(startTime),
      'endTime': formatTime(endTime),
      'room': 204,
      'day': dropdownDayValue!,
    };

    Future<String> getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userData = prefs.getString('user') ?? '';
      if (userData.isNotEmpty) {
        Map<String, dynamic> userMap = json.decode(userData);
        return userMap['token'] ?? '';
      } else {
        return '';
      }
    }

    try {
      final String token = await getToken();
      print(requestData);
      final http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(requestData),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
      );

      if (response.statusCode == 200) {
        print('Data added successfully');
      } else {
        print('Failed to add data. Error: ${response.reasonPhrase}');
        // You can handle the error here
      }
    } catch (e) {
      print('Error: $e');
      // Handle network errors here
    }
  }
}
