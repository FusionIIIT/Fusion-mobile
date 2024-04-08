// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
//
// class VacationFoodRequests extends StatefulWidget {
//   @override
//   _VacationFoodRequestsState createState() => _VacationFoodRequestsState();
// }
//
// class _VacationFoodRequestsState extends State<VacationFoodRequests> {
//
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//           color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
//       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//     );
//   }
//
//   Text myText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
//     );
//   }
//
//   Padding myContainer(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: myText(text),
//         ),
//         decoration: myBoxDecoration(),
//       ),
//     );
//   }
//   String? status;
//   List<Map<String, String>> tableData = [
//     {
//       'Date': '',
//       'From': '10:00 AM',
//       'To': '12:00 PM',
//       'Student': 'Alice',
//       'Purpose': 'Library',
//       'Approve/Reject': 'Yes',
//     },
//   ];
//   List<Map<String, String>> statusDropDownItems = [
//     {"text": "Accept", "value": "2"},
//     {"text": "Reject", "value": "0"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final ButtonStyle style = ElevatedButton.styleFrom(
//       textStyle: const TextStyle(
//           fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
//       backgroundColor: Colors.white,
//       shadowColor: Colors.black,
//     );
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body:SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 10.0),
//             ElevatedButton(
//               style: style,
//               onPressed: () {
//                 // Handle post API accept all request
//               },
//               child: Text("Accept All Requests"),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                     columnSpacing: 12,
//                     horizontalMargin: 8,
//                     columns: buildTableHeader(tableData),
//                     rows: buildTableRows(tableData),
//             ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<DataColumn> buildTableHeader(List<Map<String, String>> tableData) {
//     if (tableData.isNotEmpty) {
//       return tableData.first.keys.map((key) {
//         return DataColumn(
//           label: Text(
//             key,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         );
//       }).toList();
//     } else {
//       // Return a default DataColumn if tableData is empty
//       return [
//         DataColumn(
//           label: Text(
//             'No Records Found!',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ];
//     }
//   }
//
//   List<DataRow> buildTableRows(List<Map<String, String>> tableData) {
//     if(tableData.isNotEmpty){
//       return tableData.map((data) {
//         return DataRow(
//           cells: data.keys.map((key) {
//             if (key.toLowerCase() == 'approve/reject') {
//               return DataCell(
//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     labelText: status != null ? null : 'Select',
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.deepOrangeAccent,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   validator: (value) => value == null ? "Select" : null,
//                   dropdownColor: Colors.white,
//                   value: status,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       status = newValue!;
//                     });
//                   },
//                   items: statusDropDownItems.map((item) {
//                     return DropdownMenuItem(
//                       child: Text(item["text"]!),
//                       value: item["value"],
//                     );
//                   }).toList(),
//                 ),
//               );
//             } else {
//               return DataCell(
//                 Padding(
//                   padding: EdgeInsets.all(4),
//                   child: Text(data[key]!),
//                 ),
//               );
//             }
//           }).toList(),
//         );
//       }).toList();
//     }else{
//       return [
//         DataRow(
//           cells: [
//             DataCell(
//               Padding(
//                 padding: EdgeInsets.all(4),
//                 child: Text("No records found!!!"),
//               ),
//             ),
//           ],
//         ),
//       ];
//     }
//   }
// }
//
import 'package:flutter/material.dart';

class VacationFoodRequests extends StatefulWidget {
  @override
  _VacationFoodRequestsState createState() => _VacationFoodRequestsState();
}

class _VacationFoodRequestsState extends State<VacationFoodRequests> {
  String? status;
  List<Map<String, String>> tableData = [
    {
      'Date(dd-mm-yyyy)': '06-04-2024',
      'From': '07-04-2024',
      'To': '10-04-2024',
      'Student': '21BCS128',
      'Purpose': 'Coursework',
      'Approve/Reject': 'Yes',
    },    {
      'Date(dd-mm-yyyy)': '05-04-2024',
      'From': '11-05-2024',
      'To': '20-05-2024',
      'Student': '21BCS133',
      'Purpose': 'Medical checkups',
      'Approve/Reject': 'Yes',
    }
  ];
  List<Map<String, String>> statusDropDownItems = [
    {"text": "Accept", "value": "2"},
    {"text": "Reject", "value": "0"},
  ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 10.0),
            // ElevatedButton(
            //   style: style,
            //   onPressed: () {
            //     // Handle post API accept all request
            //   },
            //   child: Text("Accept All Requests"),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 14,
                horizontalMargin: 8,
                columns: buildTableHeader(tableData),
                rows: buildTableRows(tableData),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> buildTableHeader(List<Map<String, String>> tableData) {
    if (tableData.isNotEmpty) {
      return tableData.first.keys.map((key) {
        return DataColumn(
          label: Text(
            key,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );
      }).toList();
    } else {
      // Return a default DataColumn if tableData is empty
      return [
        DataColumn(
          label: Text(
            'No Records Found!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
  }

  List<DataRow> buildTableRows(List<Map<String, String>> tableData) {
    if (tableData.isNotEmpty) {
      return tableData.map((data) {
        return DataRow(
          cells: data.keys.map((key) {
            if (key.toLowerCase() == 'approve/reject') {
              return DataCell(
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
                  },
                  items: statusDropDownItems.map((item) {
                    return DropdownMenuItem(
                      child: Text(item["text"]!),
                      value: item["value"],
                    );
                  }).toList(),
                ),
              );
            } else {
              return DataCell(
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(data[key]!),
                ),
              );
            }
          }).toList(),
        );
      }).toList();
    } else {
      return [
        DataRow(
          cells: [
            DataCell(
              Padding(
                padding: EdgeInsets.all(4),
                child: Text("No records found!!!"),
              ),
            ),
          ],
        ),
      ];
    }
  }
}
