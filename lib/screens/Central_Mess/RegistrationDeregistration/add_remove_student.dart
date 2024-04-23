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
        'mess_option': 'all',
        'program': 'all',
        'status': 'all',
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

  void _updateStudentStatus() async{
    setState(() {
      _loading = true;
    });
    try{

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
                      items: menuDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Studend Id',
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
                        studentIdController.text = studentIdController.text.toLowerCase();
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjust as needed
                      children: [
                        ElevatedButton(
                          style: buildButtonStyle(Colors.white),
                          onPressed: () {
                            if (_messFormKey.currentState!.validate()) {}
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text("Add"),
                              if (_loading) CircularProgressIndicator(),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: buildButtonStyle(Colors.redAccent),
                          onPressed: () {
                            if (_messFormKey.currentState!.validate()) {}
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text("Remove"),
                              if (_loading) CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      ],
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
