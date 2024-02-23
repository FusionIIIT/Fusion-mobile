import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class Pathologist {
  String name;
  TimeOfDay startTime;
  TimeOfDay endTime;
  List<DateTime> daysAvailable;

  Pathologist(this.name, this.startTime, this.endTime, this.daysAvailable);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathologist Availability',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PathologistAvailabilityPage(),
    );
  }
}

class PathologistAvailabilityPage extends StatefulWidget {
  @override
  _PathologistAvailabilityPageState createState() =>
      _PathologistAvailabilityPageState();
}

class _PathologistAvailabilityPageState
    extends State<PathologistAvailabilityPage> {
  List<Pathologist> pathologists = [];

  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    // Adding dummy pathologist data
    pathologists.add(Pathologist('Dr. John Doe', TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 17, minute: 0), []));
    pathologists.add(Pathologist(
        'Dr. Jane Smith',
        TimeOfDay(hour: 8, minute: 30),
        TimeOfDay(hour: 16, minute: 30),
        []));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pathologist Availability'),
      ),
      body: ListView.builder(
        itemCount: pathologists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pathologists[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Days Available: ${formatDates(pathologists[index].daysAvailable)}'),
                Text(
                    'Availability: ${formatTime(pathologists[index].startTime)} - ${formatTime(pathologists[index].endTime)}'),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddPathologistDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat.jm().format(dateTime);
  }

  String formatDates(List<DateTime> dates) {
    if (dates.isEmpty) {
      return 'No specific days, available every day';
    }
    return dates
        .map((date) => DateFormat('MMM d').format(date))
        .join(', ');
  }

  void _showAddPathologistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TimeOfDay startTime = TimeOfDay.now();
        TimeOfDay endTime = TimeOfDay.now();
        List<DateTime> selectedDays = [];
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add Pathologist'),
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
                    items: pathologists
                        .map<DropdownMenuItem<String>>((Pathologist pathologist) {
                      return DropdownMenuItem<String>(
                        value: pathologist.name,
                        child: Text(pathologist.name),
                      );
                    }).toList(),
                    hint: Text('Select Pathologist'),
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
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDays.add(pickedDate);
                        });
                      }
                    },
                    child: Text('Select Date'),
                  ),
                  SizedBox(height: 10),
                  Text('Selected Dates: ${formatDates(selectedDays)}'),
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
                    _addPathologist(startTime, endTime, selectedDays);
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

  void _addPathologist(
      TimeOfDay startTime, TimeOfDay endTime, List<DateTime> selectedDays) {
    String name = dropdownValue!;
    Pathologist newPathologist =
        Pathologist(name, startTime, endTime, selectedDays);
    setState(() {
      pathologists.add(newPathologist);
    });
  }
}
