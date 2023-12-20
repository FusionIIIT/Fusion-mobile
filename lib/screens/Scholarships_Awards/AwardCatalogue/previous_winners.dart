import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);

class PreviousWinners extends StatefulWidget {
  final String? studentRollNo;
  PreviousWinners(this.studentRollNo);
  @override
  _PreviousWinnersState createState() => _PreviousWinnersState();
}

class _PreviousWinnersState extends State<PreviousWinners> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? programme_type;
  List programmeTypeItem = [
    'B.Tech',
    'B.des',
    'M.Tech',
    'PhD',
  ];
  String? scholarship_type;
  List scholarshipTypeItem = [
    'MCM',
    'NSP',
    'Random',
  ];
  String? academicyear;
  List academicyearTypeItem = [
    '1st',
    '2nd',
    '3rd',
    '4th',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: [
            new Container(
              child: new Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Previous Winners:",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Container(
                    padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
                    child: new Column(
                      children: [
                        Text(
                          'Programme',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 16),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 140.0,
                            child: DropdownButton(
                              hint: Text('Select Item'),
                              dropdownColor: Colors.grey[200],
                              icon: Icon(Icons.arrow_drop_down),
                              underline: SizedBox(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              onChanged: (newValue) {
                                setState(() {
                                  programme_type = newValue.toString();
                                });
                                print(programme_type);
                                //print(valueItem);
                              },
                              value: programme_type,
                              items: programmeTypeItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 40, 0),
                    child: new Column(
                      children: [
                        Text(
                          'Academic Year*',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 16),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 140.0,
                            child: DropdownButton(
                              hint: Text('Select Item'),
                              dropdownColor: Colors.grey[200],
                              icon: Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              underline: SizedBox(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              onChanged: (newValue) {
                                setState(() {
                                  academicyear = newValue.toString();
                                });
                              },
                              value: academicyear,
                              items: academicyearTypeItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
                    child: new Column(
                      children: [
                        Text(
                          'Scholarship/Awards',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 16),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 150.0,
                            child: DropdownButton(
                              hint: Text('Select Item'),
                              dropdownColor: Colors.grey[200],
                              icon: Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              underline: SizedBox(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              onChanged: (newValue) {
                                setState(() {
                                  scholarship_type = newValue.toString();
                                });
                                print(scholarship_type);
                                //print(valueItem);
                              },
                              value: scholarship_type,
                              items: scholarshipTypeItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        TextInput.finishAutofillContext();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red))),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.deepOrange;
                            return Colors.deepOrangeAccent;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
                child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Text('Award Name', style: TextStyle(fontSize: 14.0))
                      ]),
                      Column(children: [
                        Text('Winner', style: TextStyle(fontSize: 14.0))
                      ]),
                      Column(children: [
                        Text('Batch', style: TextStyle(fontSize: 14.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Award_Name')]),
                      Column(children: [Text('Student_Name')]),
                      Column(children: [Text('2020')]),
                    ]),
                  ],
                ),
              ),
            ]))
          ],
        ),

        //Table
      ),
    );
  }
}
