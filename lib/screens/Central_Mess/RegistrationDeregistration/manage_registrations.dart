import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
// import 'package:file_picker/file_picker.dart';

class ManageRegistrations extends StatefulWidget {
  @override
  _ManageRegistrationsState createState() => _ManageRegistrationsState();
}

class _ManageRegistrationsState extends State<ManageRegistrations> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = false, _uploadExcel = false;
  String? selectedMess, selectedProgramme, selectedBranch;
  String? selectedBatch;
  // int? selectedBatch;
  late String? _filePath;


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  // Future<void> _openFileExplorer() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['xlsx', 'xls'], // Specify allowed file extensions
  //     );
  //
  //     if (result != null) {
  //       setState(() {
  //         _filePath = result.files.single.path;
  //       });
  //     }
  //   } catch (e) {
  //     print('Error picking file: $e');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final _messFormKey = GlobalKey<FormState>();
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Programme',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a programme" : null,
                      dropdownColor: Colors.white,
                      value: selectedProgramme,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProgramme = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("B.Tech"),
                            value: "B.Tech"),
                        DropdownMenuItem(
                            child: Text("M.Tech"),
                            value: "M.Tech"),
                        DropdownMenuItem(
                            child: Text("B.Des"),
                            value: "B.Des"),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Batch',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a batch" : null,
                      dropdownColor: Colors.white,
                      value: selectedBatch,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBatch = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("2021"),
                            value: "2021"),
                        DropdownMenuItem(
                            child: Text("2022"),
                            value: "2022"),
                        DropdownMenuItem(
                            child: Text("2023"),
                            value: "2023"),
                        DropdownMenuItem(
                            child: Text("2024"),
                            value: "2024"),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Branch',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a branch" : null,
                      dropdownColor: Colors.white,
                      value: selectedBranch,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBranch = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("CSE"),
                            value: "CSE"),
                        DropdownMenuItem(
                            child: Text("ECE"),
                            value: "ECE"),
                        DropdownMenuItem(
                            child: Text("ME"),
                            value: "ME"),
                        DropdownMenuItem(
                            child: Text("SM"),
                            value: "SM"),
                        DropdownMenuItem(
                            child: Text("Design"),
                            value: "Design"),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Mess',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a mess" : null,
                      dropdownColor: Colors.white,
                      value: selectedMess,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMess = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Central Mess 1"),
                            value: "mess1"),
                        DropdownMenuItem(
                            child: Text("Central Mess 2"),
                            value: "mess2"),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_messFormKey.currentState!.validate()) {
                          }
                        },
                        child: Text("Update"))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OR",
              style: const TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              // _openFileExplorer();
            },
            child: Text('Upload Excel File'),
          ),

          // Display selected file path
          // Text(_filePath ?? 'No file selected'),
        ],
      ),
    );
  }
}
