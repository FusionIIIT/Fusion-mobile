import 'package:flutter/material.dart';

class FinalRegistration extends StatefulWidget {
  final data;
  const FinalRegistration({Key? key, this.data}) : super(key: key);
  @override
  _FinalRegistrationState createState() => _FinalRegistrationState();
}

class _FinalRegistrationState extends State<FinalRegistration> {
  getRows(List? map) {
    List<DataRow> list = [];
    map?.forEach((element) {
      element.length > 0
          ? list.add(DataRow(cells: [
              DataCell(Text(element[0]['course_id']['id'].toString())),
              DataCell(Text(element[0]['course_code'].toString())),
              DataCell(Text(element[0]['course_id']['course_name'].toString())),
              DataCell(Text(element[0]['credits'].toString())),
              DataCell(Text(element[0]['sem'].toString()))
            ]))
          : true;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List? finalData = widget.data?.final_registration_choices;
    return Container(
        child: Column(
      children: [
        SizedBox(height: 10),
        Text("Final Choices Of Courses"),
        if (finalData != null && finalData[0].length > 0)
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: <DataColumn>[
                DataColumn(
                  label: Text("Course ID"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Course Code"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Course Name"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Credits"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Semester"),
                  numeric: false,
                )
              ], rows: getRows(finalData)),
            ),
          ),
        if (finalData == null || finalData[0].length == 0)
          Expanded(
              child: Center(
                  child: Text(
            'Final Registration Date is yet to come',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )))
      ],
    ));
  }
}
