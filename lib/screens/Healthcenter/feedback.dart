import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final TextEditingController feedbackController = TextEditingController();

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? ''; // Return empty string if token not found
  }

  Future<void> submitFeedback() async {
    final String feedback = feedbackController.text;
    final url = 'http://127.0.0.1:8000/healthcenter/api/student/request'; // Replace with your backend URL

    try {
      final token = await getToken(); // Fetch token from local storage
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token', // Use fetched token
        },
        body: jsonEncode({'complaintadd': true, 'feedback': feedback}),
      );

      if (response.statusCode == 201) {
        print('Feedback submitted successfully');
      } else {
        print('Failed to submit feedback: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Health Center Feedback"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            DefaultTabController(
              length: 1, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      labelColor: Colors.deepOrange,
                      indicatorColor: Colors.deepOrangeAccent,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Text(
                            "Feedback Form",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 520, //height of TabBarView
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        Column(
                          children: [
                            SizedBox(height: 20.0),
                            TextFormField(
                              controller: feedbackController,
                              maxLines: 8,
                              cursorHeight: 30,
                              decoration: InputDecoration(
                                labelText: "Feedback",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: submitFeedback,
                              child: Text('Submit'),
                            ),
                          ],
                        ),
                      ],
                    ),
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


