import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

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
    'internet',
    'other',
  ];
  String? location;
  List locationTypeItem = [
    'hall-1',
    'hall-3',
    'hall-4',
    'CC1',
    'CC2',
    'core_lab',
    'LHTC',
    'NR2',
    'Rewa_Residency',
    'Maa Saraswati Hostel',
    'Nagarjuna Hostel',
    'Panini Hostel'
  ];
  var service = locator<StorageService>();
  File? selectedFile;
  String? specific_location;
  String? details;
  @override
  Widget build(BuildContext context) {
    DateTime? complaintFinish = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(complaintFinish);
    print(formattedDate);
    String? status = "0";
    String? remarks = "On-Hold";
    String? flag = "0";
    String? reason = "None";
    String? feedback = "";
    String? comment = "None";
    String? complainer = widget.complainerRollNo;
    String? workerId = "";


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Lodge Complaint",
            style: TextStyle(color: Colors.white),
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
                  setState(() {
                    specific_location = input;
                  });
                  print("$specific_location, $input");
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
                  setState(() {
                    details = input;
                  });
                  print("$details, $input");
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter details';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Attach File (Optional)',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10
              ),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                  await FilePicker.platform.pickFiles();

                  if (result != null) {
                    setState(() {
                      selectedFile = File(result.files.single.path ?? '');
                    });
                  }
                  print("$details");
                },
                child: Text('Select File'),
              ),
              if (selectedFile != null) Text(selectedFile!.path.split('/').last),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    print(details);
                    ComplaintService auth = ComplaintService();
                    bool lodge = await auth.lodgeComplaint(
                        formattedDate,
                        complaint_type!,
                        location!,
                        specificLocation,
                        details!,
                        status,
                        remarks,
                        flag,
                        reason,
                        feedback,
                        comment,
                        complainer,
                        worker_id,
                        selectedFile,
                        );
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
                                Navigator.of(context).pop();
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
