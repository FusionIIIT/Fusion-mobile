import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HealthRecordsPage extends StatefulWidget {
  @override
  _HealthRecordsPage createState() => _HealthRecordsPage();
}

class _HealthRecordsPage extends State<HealthRecordsPage> {
  List<Map<String, dynamic>> prescriptions = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPrescriptions();
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

  Future<void> fetchPrescriptions() async {
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
          prescriptions = List<Map<String, dynamic>>.from(responseData['prescription']);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load prescriptions');
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
        title: Text("Prescription History"),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : prescriptions.isEmpty
                  ? Center(child: Text("No prescription data available"))
                  : ListView.builder(
                      itemCount: prescriptions.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Prescription #${index + 1}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text('Doctor: ${prescriptions[index]['doctor_id']}'),
                                Text('Doctor id: ${prescriptions[index]['doctor_id']}'),
                                Text('Details: ${prescriptions[index]['details']}'),
                                Text('Test: ${prescriptions[index]['test']}'),
                                Text('Date: ${prescriptions[index]['date']}'),
                              ],
                            ),
                          ),
                        );
                      },
                   ),
);
}
}