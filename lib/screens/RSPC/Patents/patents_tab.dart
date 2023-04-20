import 'package:flutter/material.dart';

class PatentsStatus extends StatefulWidget {
  final data;
  const PatentsStatus({this.data});

  @override
  _PatentsStatusState createState() => _PatentsStatusState();
}

class _PatentsStatusState extends State<PatentsStatus> {
  late Map? table;
  var rows;
  var columns;

  @override
  void initState() {
    super.initState();
    table = widget.data?['table'];
    rows = table?['rows'];
    columns = table?['columns'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //Component to lay table on the page
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              // headingRowColor:

              //     MaterialStateColor.resolveWith((states) => Colors.blue),
              dataRowHeight: 70.0,
              columnSpacing: 10.0,
              columns: tabColumnList(),
              rows: tabRowList(),
              // rows: [],
            ),
          )),
    );
  }

  List<DataColumn> tabColumnList() {
    //Get the list of json and map through, to select each json and lay row to the table..

    List<DataColumn> data = [];
    data = columns
        .map(
          (el) {
            return DataColumn(
              label: Expanded(
                child: Text(
                  el.toString(),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        )
        .toList()
        .cast<DataColumn>();
    return data;
  }

  List<DataRow> tabRowList() {
    //Get the list of json and map through, to select each json and lay row to the table..
    List<DataRow> data = [];
    data = rows
        .map(
          (el) {
            return DataRow(
              cells: el
                  .map((e) => DataCell(GestureDetector(
                        onTap: () => {
                          // Navigator.pushNamed(context,
                          //     '/programme_curriculum_home/courses_info',
                          //     arguments: {'e': e})
                        },
                        child: Container(
                          //SET width
                          constraints: BoxConstraints(maxWidth: 200),
                          child: Text(
                            e.toString(),
                          ),
                        ),
                      )))
                  .toList()
                  .cast<DataCell>(),
            );
          },
        )
        .toList()
        .cast<DataRow>();
    return data;
  }
}
