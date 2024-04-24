import 'package:flutter/material.dart';
import 'package:fusion/api.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class AddRemoveStudents extends StatefulWidget {
  @override
  _AddRemoveStudentsState createState() => _AddRemoveStudentsState();
}

class _AddRemoveStudentsState extends State<AddRemoveStudents> {
  CentralMessService _centralMessService = CentralMessService();
  bool _loading = false;
  String? selectedMess, studentId;
  final studentIdController = TextEditingController();
  Map<String, dynamic> regRecords = {};

  @override
  void initState() {
    super.initState();
  }
  getData() async {
    setState(() {
      _loading = true;
    });
    try {
      Map<String, String> data = {
        'type': 'search',
        'student_id': studentIdController.text!,
      };
      List<RegMain> regMainList = await _centralMessService.getRegMain(data);

      if(regMainList.isEmpty) _showSnackbar('Invalid Student Id: $studentId', Colors.red);

      setState(() {

      });
    } catch (e) {
      print(e);
      _showSnackbar('$e', Colors.red);
    }
    setState(() {
      _loading= false;
    });
  }

  void _updateStudentStatus(String type) async{
    setState(() {
      _loading = true;
    });
    try{
      if(type=='mess1' || type=='mess2'){

      }else{

      }
    }catch(e){

    }
    setState(() {
      _loading = false;
    });
  }

  void _showSnackbar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: backgroundColor,
      ),
    );
  }

  List<Map<String, String>> menuDropDownItems = [
    {"text": "Mess 1", "value": "mess1"},
    {"text": "Mess 2", "value": "mess2"},
  ];

  @override
  Widget build(BuildContext context) {
    final _messFormKey = GlobalKey<FormState>();
    ButtonStyle buildButtonStyle(Color backgroundColor) {
      return ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        backgroundColor: backgroundColor,
        shadowColor: Colors.black,
      );
    }

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
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Student Id',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter student id";
                        }
                      },
                      controller: studentIdController,
                      onSaved: (newValue) {
                        studentIdController.text = newValue!;
                        studentIdController.text = studentIdController.text.toUpperCase();
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      style: buildButtonStyle(Colors.white),
                      onPressed: () {
                        if (_messFormKey.currentState!.validate()) {
                          _updateStudentStatus(studentIdController.text);
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Remove"),
                          if (_loading) CircularProgressIndicator(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: buildButtonStyle(Colors.white),
                      onPressed: () {
                        // if (_messFormKey.currentState!.validate()) {}
                        _updateStudentStatus("mess1");
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Remove All from Mess1"),
                          if (_loading) CircularProgressIndicator(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: buildButtonStyle(Colors.white),
                      onPressed: () {
                        // if (_messFormKey.currentState!.validate()) {}
                        _updateStudentStatus("mess2");
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Remove All from Mess2"),
                          if (_loading) CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
