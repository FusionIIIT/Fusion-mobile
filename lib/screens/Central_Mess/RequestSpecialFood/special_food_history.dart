
import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/profile.dart';

class HistoryOfSpecialFood extends StatefulWidget {
  @override
  _HistoryOfSpecialFoodState createState() => _HistoryOfSpecialFoodState();
}

class _HistoryOfSpecialFoodState extends State<HistoryOfSpecialFood> {

  CentralMessService _centralMessService = CentralMessService();

  bool _loading = true;

  static List<SpecialRequest> _specialRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchSpecialRequests(); // Fetch feedback data when the widget initializes
  }

  void _fetchSpecialRequests() async {
    try {
      List<SpecialRequest> rebateDates = await _centralMessService.getSpecialRequest();
      setState(() {
        _specialRequests = rebateDates;
        _specialRequests.sort((a, b) => b.appDate.compareTo(a.appDate));
      });
      print('Received Special Requests');
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching Special Requests: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ProfileData data = ProfileData.fromJson(arguments?['profileData']);
    String? user = arguments?['user'];
    user = user?.toLowerCase();
    // user = "caretaker";
    //user = "warden";
    final List<SpecialRequest> _modifiedSpecialRequests = (user == "student") ? _specialRequests.where((element) => (element.studentId == data.profile!['id'])).toList()
        : (user == "caretaker") ? _specialRequests.where((element) => (element.status != "1")).toList()
        : _specialRequests;

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
                  DataColumn(label: Text('Start Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('End Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Request', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Item', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Meal Time', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List.generate(
                  _modifiedSpecialRequests.length,
                      (index) => DataRow(cells: [
                    DataCell(Text((index + 1).toString()+".")),
                    DataCell(Text(_modifiedSpecialRequests[index].appDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedSpecialRequests[index].studentId?? 'N/A')),
                    DataCell(Text(_modifiedSpecialRequests[index].startDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedSpecialRequests[index].endDate.toString().substring(0, 10))),
                    DataCell(Text(_modifiedSpecialRequests[index].request?? 'N/A')),
                    DataCell(Text(_modifiedSpecialRequests[index].item1?? 'N/A')),
                    DataCell(Text(_modifiedSpecialRequests[index].item2?? 'N/A')),
                    DataCell(Text(_modifiedSpecialRequests[index].status == "0" ? "Rejected" : _modifiedSpecialRequests[index].status == "1" ? "Pending" : "Accepted")),
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

