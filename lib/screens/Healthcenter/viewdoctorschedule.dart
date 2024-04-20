import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ViewDoctorSchedule extends StatefulWidget {
  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewDoctorSchedule> {
  List<Map<String, dynamic>> scheduleData = [];
  List<Map<String, dynamic>> doctorsData = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final String token = await getToken();

      final url = 'http://127.0.0.1:8000/healthcenter/api/student';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          scheduleData = List<Map<String, dynamic>>.from(responseData['doctor_schedule']);
          doctorsData = List<Map<String, dynamic>>.from(responseData['doctors']);
          errorMessage = '';
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Schedule"),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        labelColor: Colors.deepOrange,
                        indicatorColor: Colors.deepOrangeAccent,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text("View Schedule"),
                          ),
                          Tab(
                            child: Text("Doctor Info"),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            scheduleData.isEmpty
                                ? Center(child: Text('No schedule data available'))
                                : ListView.builder(
                                    itemCount: scheduleData.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        margin: EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: Text('Doctor ${scheduleData[index]['doctor_id']}'),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Room: ${scheduleData[index]['room']}'),
                                              Text('Date: ${scheduleData[index]['date']}'),
                                              Text('Time: ${scheduleData[index]['from_time']} - ${scheduleData[index]['to_time']}'),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                            doctorsData.isEmpty
                                ? Center(child: Text('No doctor data available'))
                                : ListView.builder(
                                    itemCount: doctorsData.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        margin: EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: Text('Dr. ${doctorsData[index]['id']}'),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Phone: ${doctorsData[index]['doctor_phone']}'),
                                              Text('Specialization: ${doctorsData[index]['specialization']}'),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

