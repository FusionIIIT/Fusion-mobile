import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/services/complaint_service.dart';
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
  final String? complainerRollNo;
  PreviousWinners(this.complainerRollNo);
  @override
  _PreviousWinnersState createState() => _PreviousWinnersState();
}

class _PreviousWinnersState extends State<PreviousWinners> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? programme_type;
  List complaintTypeItem = [
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
  var service = locator<StorageService>();
  @override
  Widget build(BuildContext context) {
    DateTime? complaint_finish = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(complaint_finish);
    print(formattedDate);
    String? specific_academicyear;
    String? details;
    String? status = "0";
    String? remarks = "On-Hold";
    String? flag = "0";
    String? reason = "None";
    String? feedback = "";
    String? comment = "None";
    String? complainer = widget.complainerRollNo;
    String? worker_id = "";

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Programme',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Item'),
                    dropdownColor: Colors.grey[200],
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (newValue) {
                      print(service.userInDB?.token);
                      print(complainer);
                      setState(() {
                        programme_type = newValue.toString();
                      });
                      print(programme_type);
                      //print(valueItem);
                    },
                    value: programme_type,
                    items: complaintTypeItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Academic Year*',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Item'),
                    dropdownColor: Colors.grey[200],
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (newValue) {
                      setState(() {
                        academicyear = newValue.toString();
                      });

                      //print(valueItem);
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Scholarship/Awards',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Item'),
                    dropdownColor: Colors.grey[200],
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (newValue) {
                      print(service.userInDB?.token);
                      print(complainer);
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
              SizedBox(
                height: 30,
              ),
              Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        ComplaintService auth = ComplaintService();
                        // bool lodge = await auth.PreviousWinners(
                        //     formattedDate,
                        //     programme_type!,
                        //     academicyear!,
                        //     specific_academicyear,
                        //     details!,
                        //     status,
                        //     remarks,
                        //     flag,
                        //     reason,
                        //     feedback,
                        //     comment,
                        //     complainer,
                        //     worker_id);
                        TextInput.finishAutofillContext();
                        // if (lodge == true) {
                        //   return showDialog(
                        //     context: context,
                        //     builder: (ctx) => AlertDialog(
                        //       title: Text("Success"),
                        //       content: Text("Complaint Added Successfully"),
                        //       actions: <Widget>[
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.of(ctx).pop();
                        //           },
                        //           child: Text("okay"),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // } else {
                        //   return showDialog(
                        //     context: context,
                        //     builder: (ctx) => AlertDialog(
                        //       title: Text("Failed"),
                        //       content: Text("Cannot add above Complaint"),
                        //       actions: <Widget>[
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.of(ctx).pop();
                        //           },
                        //           child: Text("okay"),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.deepOrange;
                            return Colors
                                .deepOrangeAccent; // Use the component's default.
                          },
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
