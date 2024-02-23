import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class Doctor {
  String name;
  TimeOfDay startTime;
  TimeOfDay endTime;
  List<String> daysAvailable;

  Doctor(this.name, this.startTime, this.endTime, this.daysAvailable);
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

  String? dropdownValue;
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
    // Adding dummy doctor data
    doctors.add(Doctor('Dr. John Doe', TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 17, minute: 0), ['Monday', 'Wednesday', 'Friday']));
    doctors.add(Doctor(
        'Dr. Jane Smith',
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
            title: Text(doctors[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Days Available: ${doctors[index].daysAvailable.join(', ')}'),
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
    final dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat.jm().format(dateTime);
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
                  DropdownButtonFormField<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items:
                        doctors.map<DropdownMenuItem<String>>((Doctor doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor.name,
                        child: Text(doctor.name),
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

  void _addDoctor(TimeOfDay startTime, TimeOfDay endTime) {
    String name = dropdownValue!;
    List<String> daysAvailable = [dropdownDayValue!];
    Doctor newDoctor = Doctor(name, startTime, endTime, daysAvailable);
    setState(() {
      doctors.add(newDoctor);
    });
  }
}
