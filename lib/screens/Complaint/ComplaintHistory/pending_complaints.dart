import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';

//A dummy list of sample json returned by backend (this complaints will bew removed when backend is available)
final List<Map<String, String>> complaints = [
  {
    "S.No": " ",
    "Date": " ",
    "Complaint Type": " ",
    "Location": " ",
    "Details": " ",
    "Worker Name": " "
  }
];

class PendingComplaints extends StatefulWidget {
  @override
  _PendingComplaintsState createState() => _PendingComplaintsState();
}

class _PendingComplaintsState extends State<PendingComplaints> {
  bool _loading = true;

  late StreamController _complaintController;
  late ComplaintService complaintService;
  late ComplaintDataUserStudent data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _complaintController = StreamController();
    complaintService = ComplaintService();
    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    try {
      Response response = await complaintService.getComplaint();
      setState(() {
        data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
        print(data.student_complain);
        //print(data);
        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _complaintController.add(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loading == true
            ? Center(child: CircularProgressIndicator())
            : listView());
  }
}

//Main component to render the table..
ListView listView() {
  return ListView(
    children: [
      SizedBox(height: 20),
      //To scroll pass the width
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        //Component to lay table on the page
        child: DataTable(
          // headingRowColor:
          //     MaterialStateColor.resolveWith((states) => Colors.blue),
          dataRowHeight: 80.0,
          columnSpacing: 10.0,
          columns: [
            //DataColumns to lay columns of the table
            DataColumn(
                label: Text('S.No',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Date',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Complaint Type',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Location',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Details',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Worker Name',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          ],
          //This method will get lay all the rows
          rows: complaintList(),
        ),
      ),
    ],
  );
}

List<DataRow> complaintList() {
  //Get the list of json and map through, to select each json and lay row to the table..
  return complaints
      .map(
        ((element) => DataRow(
              cells: <DataCell>[
                DataCell(Container(
                    width: 40, //SET width
                    child: Text(element[
                        "S.No"]!))), //Extracting from Map element the value
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Date"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Complaint Type"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Location"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Details"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Worker Name"]!))),
              ],
            )),
      )
      .toList();
}
