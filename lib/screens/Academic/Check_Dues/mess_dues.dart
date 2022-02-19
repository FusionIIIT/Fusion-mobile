import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';

//A dummy list of sample json returned by backend (this complaints will bew removed when backend is available)
final List<Map<String, String>> complaints = [
  {
    "Month": " ",
    "Year": " ",
    "Amount": " ",
    "Description": " ",
    "Rebate count": " ",
    "Rebate Amount": " ",
    "Total Bill": " "
  }
];

class MessDues extends StatefulWidget {
  @override
  _MessDuesState createState() => _MessDuesState();
}

class _MessDuesState extends State<MessDues> {
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
                label: Text('Month',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Year',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Amount',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Description',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Rebate count',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Rebate Amount',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Total Bill',
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
                        "Month"]!))), //Extracting from Map element the value
                DataCell(Container(
                    width: 50, //SET width
                    child: Text(
                      element["Year"]!,
                    ))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Amount"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Description"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Rebate count"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Rebate Amount"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Total Bill"]!))),
              ],
            )),
      )
      .toList();
}
