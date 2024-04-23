import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';


class SchedulesPage extends StatefulWidget {
  const SchedulesPage({Key? key}) : super(key: key);

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
    BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.deepOrangeAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)));
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Container myContainer(String text) {
    return Container(
      decoration: myBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: myText(text),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedules'),
      ),
      body: ScheduleList(),
    );
  }
}

class ScheduleList extends StatelessWidget {
  // Dummy list of job schedules
  final List<Map<String, dynamic>> jobSchedules = [
    {
      "jobTitle": "Apple",
      "jobDescription": "Job Description 1",
      "date": "2024-04-15",
      "time": "10:00 AM"
    },
    {
      "jobTitle": "Nvidia",
      "jobDescription": "Job Description 2",
      "date": "2024-04-16",
      "time": "11:00 AM"
    },
    // Add more job schedules here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: jobSchedules.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrangeAccent),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobSchedules[index]['jobTitle'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Description: ${jobSchedules[index]['jobDescription']}',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Date: ${jobSchedules[index]['date']}',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Time: ${jobSchedules[index]['time']}',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
