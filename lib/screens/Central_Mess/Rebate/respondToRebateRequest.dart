// import 'package:flutter/material.dart';
// import 'package:fusion/models/central_mess.dart';
// import 'package:fusion/services/central_mess_services.dart';
// import 'package:fusion/models/profile.dart';
// import 'package:http/http.dart' as http;
//
// class RespondToRebateRequest extends StatefulWidget {
//   @override
//   _RespondToRebateRequestState createState() => _RespondToRebateRequestState();
// }
//
// class _RespondToRebateRequestState extends State<RespondToRebateRequest> {
//   CentralMessService _centralMessService = CentralMessService();
//
//   bool _loading = true, _requestSent = false;
//   Rebate? rebateData;
//
//   static List<Rebate> _rebateDates = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchRebateData(); // Fetch Rebate data when the widget initializes
//   }
//
//   void _fetchRebateData() async {
//     try {
//       List<Rebate> rebateDates = await _centralMessService.getRebate();
//       setState(() {
//         _rebateDates = rebateDates;
//         _rebateDates.sort((a, b) => b.appDate.compareTo(a.appDate));
//       });
//       print('Received Rebates');
//       setState(() {
//         _loading = false;
//       });
//     } catch (e) {
//       print('Error fetching Rebates: $e');
//     }
//   }
//
//   void _updateRebateRequestData(data) async {
//     try {
//       http.Response menuItems = await _centralMessService.updateRebateRequest(data);
//       if (menuItems.statusCode == 200) {
//         print('Updated the rebate request');
//         setState(() {
//           _requestSent = true;
//         });
//       } else {
//         print('Couldn\'t send');
//       }
//     } catch (e) {
//       print('Error updating Rebate Request: $e');
//     }
//   }
//
//   String? status, remark ;
//
//   List<Map<String, String>> statusDropDownItems = [
//     {"text": "Accept", "value": "2"},
//     {"text": "Reject", "value": "0"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final ProfileData data = ModalRoute.of(context)!.settings.arguments as ProfileData;
//     String user = data.profile!['user_type'];
//     user = "caretaker";
//     // user = "warden";
//     final List<Rebate> _modifiedRebateDates = (user == "student") ? _rebateDates.where((element) => (element.studentId == data.profile!['id'])).toList()
//         : (user == "caretaker") ? _rebateDates.where((element) => (element.status == "1")).toList()
//         : _rebateDates;
//
//     return _loading == true ? Center(child: CircularProgressIndicator()) : (SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child:Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: DataTable(
//                 columnSpacing: 14,
//                 horizontalMargin: 8,
//                 columns: [
//                   DataColumn(label: Text('S. No.', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('Date(yyyy-mm-dd)', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('Student ID', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('Purpose', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('Start Date', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('End Date', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('Remarks', style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold))),
//                 ],
//                 rows: List.generate(
//                   _modifiedRebateDates.length,
//                       (index) => DataRow(cells: [
//                     DataCell(Text((index + 1).toString()+".")),
//                     DataCell(Text(_modifiedRebateDates[index].appDate.toString().substring(0, 10))),
//                     DataCell(Text(_modifiedRebateDates[index].studentId?? 'N/A')),
//                     DataCell(Text(_modifiedRebateDates[index].leaveType)),
//                     DataCell(Text(_modifiedRebateDates[index].purpose)),
//                     DataCell(Text(_modifiedRebateDates[index].startDate.toString().substring(0, 10))),
//                     DataCell(Text(_modifiedRebateDates[index].endDate.toString().substring(0, 10))),
//                     // DataCell(Text(_modifiedRebateDates[index].status == "0" ? "Rejected" : _modifiedRebateDates[index].status == "1" ? "Pending" : "Accepted")),
//                     DataCell(
//                       TextField(
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 4, horizontal: 8),
//                           hintText: 'Enter remark (optional)',
//                           border: OutlineInputBorder(),
//                         ),
//                         onChanged: (String? value) {
//                           // setState(() {
//                           remark = value!;
//                           // });
//                           // data['Remark'] = value;
//                         },
//                       ),
//                     ),
//                     DataCell(
//                       DropdownButtonFormField<String>(
//                         decoration: InputDecoration(
//                           labelText: status != null ? null : 'Select',
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent,
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                         ),
//                         validator: (value) => value == null ? "Select" : null,
//                         dropdownColor: Colors.white,
//                         value: status,
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             status = newValue!;
//                           });
//                           // print({status, _modifiedRebateDates[index].leaveType, remark});
//                           setState(() {
//                             rebateData = Rebate(
//                                 startDate: _modifiedRebateDates[index].startDate,
//                                 endDate: _modifiedRebateDates[index].endDate,
//                                 purpose: _modifiedRebateDates[index].purpose,
//                                 status: status!,
//                                 appDate: _modifiedRebateDates[index].appDate,
//                                 leaveType: _modifiedRebateDates[index].leaveType,
//                                 rebateRemark: _modifiedRebateDates[index].rebateRemark
//                             );
//                             _updateRebateRequestData(rebateData);
//                             if (_requestSent == true) {
//                               initState();
//                             }
//                           });
//                         },
//                         items: statusDropDownItems.map((item) {
//                           return DropdownMenuItem(
//                             child: Text(item["text"]!),
//                             value: item["value"],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ]),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/screens/Central_Mess/expandable_text.dart';

class RespondToRebateRequest extends StatefulWidget {
  @override
  _RespondToRebateRequestState createState() => _RespondToRebateRequestState();
}

class _RespondToRebateRequestState extends State<RespondToRebateRequest> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true, _requestSent = false;
  Rebate? rebateData;

  static List<Rebate> _rebateDates = [];

  @override
  void initState() {
    super.initState();
    _fetchRebateData(); // Fetch Rebate data when the widget initializes
  }
  void _showSnackbar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void _fetchRebateData() async {
    try {
      List<Rebate> rebateDates = await _centralMessService.getRebate();
      setState(() {
        _rebateDates = rebateDates;
        _rebateDates.sort((a, b) => b.appDate.compareTo(a.appDate));
      });
      print('Received Rebates');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching Rebates: $e');
    }
  }

  void _updateRebateRequestData(data) async {
    setState(() {
      _loading = true;
    });
    try {
      http.Response menuItems = await _centralMessService.updateRebateRequest(data);
      if (menuItems.statusCode == 200) {
        print('Updated the rebate request');
        setState(() {
          _requestSent = true;
          // Remove the updated item from the list
          _rebateDates.removeWhere((item) => item == data);
        });
        _showSnackbar('Rebate request updated successfully', Colors.green);
      } else {
        print('Couldn\'t send');
        _showSnackbar('Failed to update rebate request. Please try again later.', Colors.red);
      }
    } catch (e) {
      print('Error updating Rebate Request: $e');
      _showSnackbar('Failed to update rebate request. Please try again later.', Colors.red);
    }
    _fetchRebateData();
    setState(() {
      _loading = false;
    });
  }

  String? status, remark;

  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "2"},
    {"text": "Reject", "value": "0"},
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";
    final List<Rebate> _modifiedRebateDates = (user == "student") ? _rebateDates.where((element) => (element.studentId == data.profile!['id'])).toList()
        : (user == "caretaker") ? _rebateDates.where((element) => (element.status == "1")).toList()
        : _rebateDates;

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
                  DataColumn(label: Text('Date(yyyy-mm-dd)', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Student ID', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Purpose', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Start Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('End Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Remarks', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: _modifiedRebateDates.map((rebate) {
                  int index = _modifiedRebateDates.indexOf(rebate);
                  return DataRow(
                    cells: [
                      DataCell(Text((index + 1).toString()+".")),
                      DataCell(Text(rebate.appDate.toString().substring(0, 10))),
                      DataCell(Text(rebate.studentId?? 'N/A')),
                      DataCell(Text(rebate.leaveType)),
                      DataCell(ExpandableText(text: rebate.purpose ?? 'N/A', maxLines: 1)),
                      DataCell(Text(rebate.startDate.toString().substring(0, 10))),
                      DataCell(Text(rebate.endDate.toString().substring(0, 10))),
                      DataCell(
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            hintText: 'Remark (optional)',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String? value) {
                            remark = value!;
                          },
                        ),
                      ),
                      DataCell(
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: status != null ? null : 'Select',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrangeAccent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) => value == null ? "Select" : null,
                          dropdownColor: Colors.white,
                          value: status,
                          onChanged: (String? newValue) {
                            setState(() {
                              status = newValue!;
                            });
                            setState(() {
                              rebateData = Rebate(
                                  studentId: rebate.studentId,
                                  startDate: rebate.startDate,
                                  endDate: rebate.endDate,
                                  purpose: rebate.purpose,
                                  status: status!,
                                  appDate: rebate.appDate,
                                  leaveType: rebate.leaveType,
                                  rebateRemark: rebate.rebateRemark
                              );
                              _updateRebateRequestData(rebateData);
                              if (_requestSent == true) {
                                initState();
                              }
                            });
                          },
                          items: statusDropDownItems.map((item) {
                            return DropdownMenuItem(
                              child: Text(item["text"]!),
                              value: item["value"],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
