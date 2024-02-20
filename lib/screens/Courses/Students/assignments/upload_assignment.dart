// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:fusion/services/login_service.dart';
// import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';
// import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';

// class uploadAssignment extends StatefulWidget {
//   @override
//   _uploadAssignmentState createState() => _uploadAssignmentState();
// }

// class _uploadAssignmentState extends State<uploadAssignment> {
//   bool _loading = true;
//   late String name;
//   late String depttype;

//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _assignmentNameController;

//   @override
//   void initState() {
//     super.initState();
//     var service = locator<StorageService>();
//     name = service.profileData.user!["first_name"] +
//         " " +
//         service.profileData.user!["last_name"];
//     depttype = service.profileData.profile!['department']!['name'] +
//         " " +
//         service.profileData.profile!['user_type'];
//     _assignmentNameController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _assignmentNameController.dispose();
//     super.dispose();
//   }

//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//         color: Colors.deepOrangeAccent,
//         width: 2.0,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.all(
//         Radius.circular(15.0),
//       ),
//     );
//   }

//   Text myText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//     );
//   }

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

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Form is validated, proceed to convert form data to JSON
//       Map<String, dynamic> formData = {
//         'assignmentName': _assignmentNameController.text,
//         // Add more fields if needed
//       };
//       String jsonData = jsonEncode(formData);
//       print(jsonData); // Print or use the JSON data as needed
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = '';
//     return Scaffold(
//       appBar: DefaultAppBar().buildAppBar(),
//       drawer: SideDrawer(),
//       body: ListView(
//         shrinkWrap: true,
//         physics: ClampingScrollPhysics(),
//         children: [
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
//             shadowColor: Colors.black,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 20.0),
//                   width: 170.0,
//                   height: 170.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/unknown.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   name,
//                   style: TextStyle(fontSize: 20.0, color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   depttype,
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                   child: Text(
//                     "Assignments",
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.deepOrangeAccent,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0.0, 1.0),
//                     blurRadius: 2.0,
//                   )
//                 ],
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5.0),
//                 ),
//               ),
//             ),
//           ),
//           Card(
//             elevation: 2.0,
//             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             shadowColor: Colors.black,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // InkWell(
//                 //   child: myContainer("Assignment 1"),
//                 //   onTap: () {
//                 //     Navigator.pushNamed(
//                 //       context,
//                 //       '/registered_courses/course_home/module',
//                 //       arguments: data,
//                 //     );
//                 //   },
//                 // ),
//                 // InkWell(
//                 //   child: myContainer("Assignment 2"),
//                 //   onTap: () {
//                 //     Navigator.pushNamed(
//                 //       context,
//                 //       '/registered_courses/course_home/module',
//                 //       arguments: data,
//                 //     );
//                 //   },
//                 // ),
//                 // InkWell(
//                 //   child: myContainer("Assignment 3"),
//                 //   onTap: () {
//                 //     Navigator.pushNamed(
//                 //       context,
//                 //       '/registered_courses/course_home/module',
//                 //       arguments: data,
//                 //     );
//                 //   },
//                 // ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _assignmentNameController,
//                         decoration: InputDecoration(
//                           labelText: 'Assignment Name',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter assignment name';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: _submitForm,
//                         child: Text('Submit'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/services/login_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:file_picker/file_picker.dart';

class uploadAssignment extends StatefulWidget {
  @override
  _uploadAssignmentState createState() => _uploadAssignmentState();
}

class _uploadAssignmentState extends State<uploadAssignment> {
  bool _loading = true;
  late String name;
  late String depttype;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _assignmentNameController;
  String? _filePath;

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'] +
        " " +
        service.profileData.profile!['user_type'];
    _assignmentNameController = TextEditingController();
  }

  @override
  void dispose() {
    _assignmentNameController.dispose();
    super.dispose();
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is validated, proceed to convert form data to JSON
      Map<String, dynamic> formData = {
        'assignmentName': _assignmentNameController.text,
        'filePath': _filePath,
      };
      String jsonData = jsonEncode(formData);
      print(jsonData); // Print or use the JSON data as needed
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = '';
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  depttype,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Assignments",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _assignmentNameController,
                        decoration: InputDecoration(
                          labelText: 'Assignment Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter assignment name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _pickFile,
                        child: Text('Select PDF File'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
