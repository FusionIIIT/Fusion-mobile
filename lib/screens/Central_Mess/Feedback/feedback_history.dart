import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;

class FeedbackHistory extends StatefulWidget {
  @override
  _FeedbackHistoryState createState() => _FeedbackHistoryState();
}

class _FeedbackHistoryState extends State<FeedbackHistory> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true, _requestSent = false;
  MessFeedback? feedbackData;
  static List<MessFeedback> _feedbackDates = [];

  @override
  void initState() {
    super.initState();
    _fetchFeedbackData();
  }

  void _fetchFeedbackData() async {
    try {
      List<MessFeedback> feedbackDates = await _centralMessService.getFeedback();
      setState(() {
        _feedbackDates = feedbackDates;
        _feedbackDates.sort((a, b) => b.fdate.compareTo(a.fdate));
      });
      print('Received Feedbacks');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching feedback: $e');
    }
  }

  void _updateFeedbackRequestData(data) async {
    try {
      http.Response menuItems = await _centralMessService.updateFeedbackRequest(data);
      if (menuItems.statusCode == 200) {
        print('Updated the Feedback request');
        setState(() {
          _requestSent = true;
        });
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error updating Feedback Request: $e');
    }
  }

  String? remark;

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";
    final List<MessFeedback> _modifiedFeedbackDates = (user == "student") ? _feedbackDates.where((element) => (element.studentId == data.profile!['id'])).toList() : _feedbackDates;

    return _loading == true ? Center(child: CircularProgressIndicator()) : (SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: 14,
                horizontalMargin: 8,
                columns: [
                  DataColumn(label: Text('S. No.', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Student ID', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Mess', style: TextStyle(fontWeight: FontWeight.bold))),
                  // DataColumn(label: Text('Mess Rating', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Description', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Feedback Type', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Remarks', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List.generate(
                  _modifiedFeedbackDates.length,
                      (index) => DataRow(cells: [
                        DataCell(Text((index + 1).toString()+".")),
                        DataCell(Text(_modifiedFeedbackDates[index].studentId?? 'N/A')),
                        DataCell(Text(_modifiedFeedbackDates[index].mess == "mess1" ? "Mess 1" : "Mess 2")),
                        // DataCell(Text(_modifiedFeedbackDates[index].messRating.toString())),
                        DataCell(Text(_modifiedFeedbackDates[index].fdate.toString().substring(0, 10))),
                        DataCell(Text(_modifiedFeedbackDates[index].description)),
                        DataCell(Text(_modifiedFeedbackDates[index].feedbackType)),
                        DataCell((user == 'student') ? Text(_modifiedFeedbackDates[index].feedbackRemark?? 'N/A')
                            :TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            hintText: _modifiedFeedbackDates[index].feedbackRemark?? 'N/A',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String? value) {
                            // setState(() {
                            remark = value!;
                            // });

                            // print({remark, _modifiedFeedbackDates[index].studentId});

                            setState(() {
                              feedbackData = MessFeedback(
                                  studentId: _modifiedFeedbackDates[index].studentId,
                                  mess: _modifiedFeedbackDates[index].mess,
                                  messRating: _modifiedFeedbackDates[index].messRating,
                                  fdate: _modifiedFeedbackDates[index].fdate,
                                  description: _modifiedFeedbackDates[index].description,
                                  feedbackType: _modifiedFeedbackDates[index].feedbackType,
                                  feedbackRemark: remark,
                              );
                              _updateFeedbackRequestData(feedbackData);
                              if (_requestSent) {
                                initState();
                              }
                            });
                          },
                        ),),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
