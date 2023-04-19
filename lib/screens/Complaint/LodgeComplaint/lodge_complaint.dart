import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';

import '../../../Components/utils.dart';

kTextFieldInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Utils().primarycolor),
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Utils().primarycolor),
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
  );
}

class LodgeComplaint extends StatefulWidget {
  final String? complainerRollNo;
  LodgeComplaint(this.complainerRollNo);
  @override
  _LodgeComplaintState createState() => _LodgeComplaintState();
}

class _LodgeComplaintState extends State<LodgeComplaint> {
  var sl = TextEditingController();
  var det = new TextEditingController();
  Utils utils = Utils();
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
    DateTime? complaintFinish = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(complaintFinish);
    print(formattedDate);
    String? specificLocation = "";
    String? details = "";
    String? status = "0";
    String? remarks = "On-Hold";
    String? flag = "0";
    String? reason = "None";
    String? feedback = "";
    String? comment = "None";
    String? complainer = widget.complainerRollNo;
    String? workerId = "";
    renew() {
      setState(() {
        sl.clear();
        det.clear();
      });
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: utils.primarybackgroundcolor,
          leading: utils.leadingPopIconsButton(utils.primarycolor, context),
          title: Text(
            "Lodge Complaint",
            style: TextStyle(
                color: utils.primarycolor, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add a new Complaint',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Complaint Type *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: utils.primarycolor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Complaint Type'),
                    dropdownColor: Colors.grey[200],
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (newValue) {
                      print(service.userInDB?.token);
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
                height: 15,
              ),
              Text(
                'Location *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: utils.primarycolor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Location'),
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
                height: 15,
              ),
              Text(
                'Specific Location *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: false,
                controller: sl,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration:
                    kTextFieldInputDecoration("Room Number, Floor, Block etc."),
                onChanged: (input) {
                  specificLocation = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter specific_location';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Complaint Details *',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: false,
                controller: det,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration:
                    kTextFieldInputDecoration("What is your Complaint?"),
                onChanged: (input) {
                  details = input;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter details';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "*Complaint will be registered with your User Id: ${widget.complainerRollNo}",
                style: TextStyle(
                    fontSize: 12.4,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7)),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    print("working");
                    ComplaintService auth = ComplaintService();
                    bool lodge = await auth.lodgeComplaint(
                        formattedDate,
                        complaint_type!,
                        location!,
                        sl.text,
                        det.text,
                        status,
                        remarks,
                        flag,
                        reason,
                        feedback,
                        comment,
                        widget.complainerRollNo,
                        workerId);
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
                                // Navigator.popUntil(context, )
                                Navigator.of(ctx).pop();
                                renew();
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
                      style: TextStyle(
                          fontSize: 20, color: utils.primarybackgroundcolor),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return utils.lightgrey;
                        return utils
                            .primarycolor; // Use the component's default.
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
