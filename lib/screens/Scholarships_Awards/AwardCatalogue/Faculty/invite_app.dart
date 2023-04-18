import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';

class InviteApplications extends StatefulWidget {
  @override
  _InviteApplicationsState createState() => _InviteApplicationsState();
}

class _InviteApplicationsState extends State<InviteApplications> {
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
  // String? programme_type;
  List awardTypeItem = [
    "Directors Gold Medal",
    "Directors Silver Medal",
    'Notional Prizes',
    'MCM Scholarship',
    'D&M Proficiency Gold Medal',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Invite Applications",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
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
          ]),
        ),
      ),
    );
  }
}
