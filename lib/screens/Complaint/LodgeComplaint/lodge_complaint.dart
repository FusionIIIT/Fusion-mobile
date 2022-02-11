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

class LodgeComplaint extends StatefulWidget {
  final String? complainerRollNo;
  LodgeComplaint(this.complainerRollNo);

  @override
  _LodgeComplaintState createState() => _LodgeComplaintState();
}

class _LodgeComplaintState extends State<LodgeComplaint> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? complaint_type;
  List complaintTypeItem = [
    'Electricity',
    'carpenter',
    'plumber',
    'garbage',
    'dustbin',
    'Internet',
    'Other',
  ];

  String? location;
  List locationTypeItem = [
    'hall-1',
    'hall-3',
    'hall-4',
    'CC1',
    'CC2',
    'Core Lab',
    'LHTC',
    'NR2',
    'Rewa Residency',
  ];

  var service = locator<StorageService>();

  @override
  Widget build(BuildContext context) {
    DateTime? complaint_finish = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(complaint_finish);
    print(formattedDate);

    String? specific_location;
    String? details;
    String? status = "0";
    String? remarks = "On-Hold";
    String? flag = "0";
    String? reason = "None";
    String? feedback = "";
    String? comment = "None";
    String? complainer = widget.complainerRollNo;
    String? worker_id = "";

    return SafeArea(
      child: Card(
        elevation: 2.0,
        // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shadowColor: Colors.black,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complaints',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Add a new Complaint',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Complaint Type *',
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
                      print(service.userInDB.token!);
                      print(complainer);
                      setState(() {
                        complaint_type = newValue.toString();
                      });
                      print(complaint_type);
                      //print(valueItem);
                    },
                    value: complaint_type,
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
                'Location *',
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
                        location = newValue.toString();
                      });

                      //print(valueItem);
                    },
                    value: location,
                    items: locationTypeItem.map((valueItem) {
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
                'Specific Location *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (input) {
                  specific_location = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter specific_location';
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Complaint Details *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (input) {
                  details = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter details';
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    ComplaintService auth = ComplaintService();
                    bool lodge = await auth.lodgeComplaint(
                        formattedDate,
                        complaint_type!,
                        location!,
                        specific_location,
                        details!,
                        status,
                        remarks,
                        flag,
                        reason,
                        feedback,
                        comment,
                        complainer,
                        worker_id);
                    TextInput.finishAutofillContext();
                    if (lodge == true) {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Success"),
                          content: Text("Complaint Added Successfully"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("okay"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Failed"),
                          content: Text("Cannot add above Complaint"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("okay"),
                            ),
                          ],
                        ),
                      );
                    }
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
