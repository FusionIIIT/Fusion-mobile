import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';


class FeedbackHistory extends StatefulWidget {
  @override
  _FeedbackHistoryState createState() => _FeedbackHistoryState();
}

class _FeedbackHistoryState extends State<FeedbackHistory> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;

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

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  @override
  Widget build(BuildContext context) {

    final ProfileData data = ModalRoute.of(context)!.settings.arguments as ProfileData;
    String user = data.profile!['user_type'];
    user = "caretaker";
    // user = "warden";
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
                columns: [
                  DataColumn(label: Text('S. No.', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Student ID', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Mess', style: TextStyle(fontWeight: FontWeight.bold))),
                  // DataColumn(label: Text('Mess Rating', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Description', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Feedback Type', style: TextStyle(fontWeight: FontWeight.bold))),
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











// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:fusion/models/central_mess.dart';
// import 'package:fusion/services/central_mess_services.dart';
//
//
// class FeedbackHistory extends StatefulWidget {
//   @override
//   _FeedbackHistoryState createState() => _FeedbackHistoryState();
// }
//
// class _FeedbackHistoryState extends State<FeedbackHistory> {
//   CentralMessService _centralMessService = CentralMessService();
//
//   bool _loading = true;
//
//   static List<MessFeedback> _feedbackDates = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchFeedbackData();
//   }
//
//   void _fetchFeedbackData() async {
//     try {
//       List<MessFeedback> feedbackDates = await _centralMessService.getFeedback();
//       setState(() {
//         _feedbackDates = feedbackDates;
//         _feedbackDates.sort((a, b) => b.fdate.compareTo(a.fdate));
//       });
//       print('Received Feedbacks');
//       setState(() {
//         _loading = false;
//       });
//     } catch (e) {
//       print('Error fetching feedback: $e');
//     }
//   }
//
//
//   // String? _value1, _value2;
//   int? _currentlyExpandedIndex;
//
//   int _pageNumber = 1;
//   int _pageSize = 5; // Number of items per page
//   int _totalItems = _feedbackDates.length; // Total number of items (for demonstration)
//
//   List<MessFeedback> getPaginatedFeedbackDates() {
//     int startIndex = (_pageNumber - 1) * _pageSize;
//     int endIndex = min(_totalItems, startIndex + _pageSize);
//     return _feedbackDates.sublist(startIndex, endIndex);
//   }
//
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
//       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<MessFeedback> paginatedFeedbackDates = getPaginatedFeedbackDates();
//
//     return _loading == true ? Center(child: CircularProgressIndicator()) : (Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: paginatedFeedbackDates.length,
//             itemBuilder: (BuildContext context, int index) {
//               final int serialNumber =
//                   index + 1 + (_pageNumber - 1) * _pageSize;
//               MessFeedback date = paginatedFeedbackDates[index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       child: ExpansionTile(
//                         key: UniqueKey(), // Use UniqueKey to force rebuild the widget
//                         initiallyExpanded: index == _currentlyExpandedIndex,
//                         onExpansionChanged: (bool isExpanded) {
//                           setState(() {
//                             if (isExpanded) {
//                               _currentlyExpandedIndex = index;
//                             } else {
//                               _currentlyExpandedIndex = null;
//                             }
//                           });
//                         },
//                         title: Text(
//                           "$serialNumber. " + " [Mess: " + date.mess + "]\n[Type: " + date.feedbackType + "]",
//                           style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                         ),
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
//                                 IgnorePointer(
//                                   ignoring: true, // Set to true to disable user interaction
//                                   child: TextFormField(
//                                     maxLines: 4,
//                                     cursorHeight: 30,
//                                     initialValue: date.description,
//                                     decoration: InputDecoration(
//                                       labelText: "Feedback Details",
//                                       border: OutlineInputBorder(),
//                                     ),
//                                     style: TextStyle(fontFamily: "Poppins"),
//                                   ),
//                                 ),
//                                 Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
//                                 Text(
//                                   date.fdate.toString(),
//                                   style: TextStyle(fontSize: 12),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   decoration: myBoxDecoration(),
//                 ),
//               );
//             },
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: _pageNumber > 1
//                   ? () {
//                 setState(() {
//                   _pageNumber--;
//                   _currentlyExpandedIndex = null;
//                 });
//               }
//                   : null,
//             ),
//             Text('Page $_pageNumber of ${(_totalItems / _pageSize).ceil()}'),
//             IconButton(
//               icon: Icon(Icons.arrow_forward),
//               onPressed: _pageNumber < (_totalItems / _pageSize).ceil()
//                   ? () {
//                 setState(() {
//                   _pageNumber++;
//                   _currentlyExpandedIndex = null;
//                 });
//               }
//                   : null,
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }
