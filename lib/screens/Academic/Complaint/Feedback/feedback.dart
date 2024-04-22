// import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
// import '../Constants/constants.dart';

//A dummy list of sample json returned by backend (this onHoldComplains will bew removed when backend is available)
final List<Map<String, String>> feedbackList = [
  {
    "Date": " ",
    "Type": " ",
    "Location": " ",
    "Details": " ",
    "Status": " ",
    "Worker Name": " ",
    "Feedback": " "
  }
];

class ComplaintFeedBack extends StatefulWidget {
  @override
  _ComplaintFeedBackState createState() => _ComplaintFeedBackState();
}

class _ComplaintFeedBackState extends State<ComplaintFeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Feedback",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
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
                label: Text('Date',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Type',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Location',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Details',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Status',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Worker Name',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Feedback',
                    style:
                        TextStyle(fontSize: 1, fontWeight: FontWeight.bold))),
          ],
          //This method will get lay all the rows
          rows: feedBacks(),
        ),
      ),
    );
  }
}

List<DataRow> feedBacks() {
  //Get the list of json and map through, to select each json and lay row to the table..
  return feedbackList
      .map(
        ((element) => DataRow(
              cells: <DataCell>[
                //Extracting from Map element the value
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Date"]!))),
                DataCell(Container(
                    width: 40, //SET width
                    child: Text(element["Type"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Location"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Details"]!))),
                DataCell(Container(
                    width: 40, //SET width
                    child: Text(element["Status"]!))),
                DataCell(Container(
                    width: 57, //SET width
                    child: Text(element["Worker Name"]!))),
                DataCell(Container(
                    width: 40, //SET width
                    child: Text(element["Feedback"]!))),
              ],
            )),
      )
      .toList();
}
