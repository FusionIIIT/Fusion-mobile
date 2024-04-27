import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/iwd_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestStatus extends StatefulWidget {
  @override
  _RequestStatusState createState() => _RequestStatusState();
}

class _RequestStatusState extends State<RequestStatus> {
  IwdServices iwdServices = IwdServices();
  List<Map<String, dynamic>> _map_obj = [];

  @override
  void initState() {
    super.initState();
    _getReqStatus();
  }

  void _getReqStatus() async {
    http.Response response = await iwdServices.getRequestStatus();
    var data = json.decode(response.body)['obj'];

    List<Map<String, dynamic>> mappedObjects = [];

    data.forEach((item) {
      String id = item[0].toString();
      String name = item[1];
      String area = item[2];
      String description = item[3];
      String createdBy = item[4];
      String status = item[5];

      Map<String, dynamic> mappedObject = {
        'id': id,
        'Name': name,
        'Area': area,
        'Description': description,
        'Created By': createdBy,
        'Status': status,
      };

      mappedObjects.add(mappedObject);
    });

    setState(() {
      _map_obj = mappedObjects;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Request Status',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 74, 73, 73),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.deepOrange),
          ),
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('Area')),
              DataColumn(label: Text('Created By')),
              DataColumn(label: Text('Status')),

            ],
            rows: _map_obj.map((data) {
              return DataRow(cells: [
                DataCell(Text(data['id'].toString())),
                DataCell(Text(data['Name'] ?? '')),
                DataCell(Text(data['Description'] ?? '')),
                DataCell(Text(data['Area'] ?? '')),
                DataCell(Text(data['Created By'] ?? '')),
                DataCell(Text(data['Status'] ?? '')),
              ]);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
