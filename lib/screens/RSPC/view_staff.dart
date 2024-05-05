// ignore_for_file: camel_case_types

import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:fusion/Components/appBar.dart";

import "package:fusion/services/service_locator.dart";
import "package:fusion/services/storage_service.dart";
import "package:http/http.dart" as http;
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';



class View_staff extends StatefulWidget {
  final int index;
  const View_staff({Key? key, required this.index}) : super(key: key);

  @override
  State<View_staff> createState() => _View_staffState();
}

class _View_staffState extends State<View_staff> {
   var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  late Future<Map<String, dynamic>> _futureData = Future.value({});

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null) {
        throw Exception('Token Error');
      }
      Map<String, String> headers = {
        // 'Authorization' : 'Token'+(' c1c9f84430ef95a67e8a192962044dcf73a3677f')
        'Authorization' : 'Token'+(storage_service.userInDB?.token??'')
      };
      var index1 = widget.index;
      http.Response response = await http.get(
        Uri.http("172.27.16.214:8000",
             "research_procedures/api/view_staff_details/$index1"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print(response.statusCode);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Research Module",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),

      body: FutureBuilder<Map<String, dynamic>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Map<String, dynamic> data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: data['data_by_year'].length,
                itemBuilder: (context, index) {
                  var entry = data['data_by_year'].entries.elementAt(index);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Year ${entry.key}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('Staff Name',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ))),
                          DataColumn(
                              label: Text('Qualification',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ))),
                          DataColumn(
                              label: Text('Stipend',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ))),
                        ],
                        rows: (entry.value as List<dynamic>).map((rowData) {
                          return DataRow(cells: [
                            DataCell(Text(rowData['staff_name'],
                                style: TextStyle(
                                  fontSize: 11,
                                ))),
                            DataCell(Text(rowData['qualification'],
                                style: TextStyle(
                                  fontSize: 11,
                                ))),
                            DataCell(Text(rowData['stipend'].toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                ))),
                          ]);
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
