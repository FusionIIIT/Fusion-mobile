
import 'package:flutter/material.dart';
import 'package:fusion/services/academic_service.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:flutter/services.dart';
// void initState() {
//     super.initState();
//     academicService = AcademicService();
//   }

class CourseListHome extends StatefulWidget {
  @override
  _CourseListHome createState() => _CourseListHome();
}

class _CourseListHome extends State<CourseListHome> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late String _selectedProgram = programs.first;
late String _selectedBranch = branches.first;
late String _selectedBatch = batches.first;

  final List<String> programs = ['PhD', 'M Tech', 'B Tech', 'B Des', 'M Des'];
  final List<String> branches = ['CSE', 'ECE', 'ME', 'SM'];
  final List<String> batches = ['2021', '2022', '2023', '2024', '2025'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Course List",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          // bottom: TabBar(
          //   isScrollable: true,
          //   indicatorColor: Colors.white,
          //   indicatorWeight: 6.0,
          //   // tabs: [
          //   //   Tab(
          //   //     child: Container(
          //   //       child: Text(
          //   //         'Configure Pre Registration',
          //   //       ),
          //   //     ),
          //   //   ),
          //   // ],
          // ),
        ),
        drawer: SideDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DropdownButtonFormField(
  value: _selectedProgram,
  hint: Text('Select Program'),
  onChanged: (value) {
    setState(() {
      _selectedProgram = value as String;
    });
  },
  items: programs.map((program) {
    return DropdownMenuItem(
      value: program,
      child: Text(program),
    );
  }).toList(),
  validator: (value) {
    if (value == null) {
      return 'Please select a program';
    }
    return null;
  },
),

                SizedBox(height: 16.0),
                DropdownButtonFormField(
  value: _selectedBranch,
  hint: Text('Select Branch'),
  onChanged: (value) {
    setState(() {
      _selectedBranch = value as String;
    });
  },
  items: branches.map((branch) {
    return DropdownMenuItem(
      value: branch,
      child: Text(branch),
    );
  }).toList(),
  validator: (value) {
    if (value == null) {
      return 'Please select a branch';
    }
    return null;
  },
),
                SizedBox(height: 16.0),
                DropdownButtonFormField(
  value: _selectedBatch,
  hint: Text('Select Batch'),
  onChanged: (value) {
    setState(() {
      _selectedBatch = value as String;
    });
  },
  items: batches.map((batch) {
    return DropdownMenuItem(
      value: batch,
      child: Text(batch),
    );
  }).toList(),
  validator: (value) {
    if (value == null) {
      return 'Please select a batch';
    }
    return null;
  },
),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    
                    if (_formKey.currentState!=null) {
                      // Submit logic here
                      print('Program: $_selectedProgram');
                      print('Branch: $_selectedBranch');
                      print('Batch: $_selectedBatch');
                    }
                  },
                  
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






//   DateTime? _startDate;
//   DateTime? _endDate;
//   String? _responseText;
//   int? _semesterNumber;
//   late AcademicService academicService;

  

//   Future<void> _selectStartDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _startDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != _startDate) {
//       setState(() {
//         _startDate = picked;
//       });
//     }
//   }

//   Future<void> _selectEndDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _endDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != _endDate) {
//       setState(() {
//         _endDate = picked;
//       });
//     }
//   }

//   Future<void> _submitForm() async {
//     // if (_startDate == null || _endDate == null) {
//     //   return;
//     // }
//     Navigator.pushNamed(context, "/course_list");
//     // If the form is valid, proceed with API call
//     // final startDate = _startDate!.toString().substring(0, 10);
//     // final endDate = _endDate!.toString().substring(0, 10);
//     // int semester = _semesterNumber!;

//     // Response response = await academicService.configurePreRegistration(
//     //     startDate, endDate, semester);
//     // setState(() {
//     //   _responseText = (jsonDecode(response.body))["message"];
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text(
//             "FUSION",
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.search),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.notifications),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.more_vert),
//             ),
//           ],
//           bottom: TabBar(
//             isScrollable: true,
//             indicatorColor: Colors.white,
//             indicatorWeight: 6.0,
//             tabs: [
//               Tab(
//                 child: Container(
//                   child: Text(
//                     'Get Course List',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         drawer: SideDrawer(),
//         body: TabBarView(
//           children: [
//             Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ListTile(
//                     title: Row(
//                       children: [
//                         Icon(Icons.date_range),
//                         SizedBox(width: 10),
//                         Text(
//                           _startDate == null
//                               ? 'Select Start Date'
//                               : 'Start Date: ${_startDate!.toString().split(" ")[0]}',
//                         ),
//                       ],
//                     ),
//                     onTap: () => _selectStartDate(context),
//                   ),
//                   ListTile(
//                     title: Row(
//                       children: [
//                         Icon(Icons.date_range),
//                         SizedBox(width: 10),
//                         Text(
//                           _endDate == null
//                               ? 'Select End Date'
//                               : 'End Date: ${_endDate!.toString().split(" ")[0]}',
//                         ),
//                       ],
//                     ),
//                     onTap: () => _selectEndDate(context),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.all(16.0), // Adjust the padding as needed
//                     child: TextFormField(
//                       keyboardType: TextInputType.number,
//                       inputFormatters: <TextInputFormatter>[
//                         FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                       ],
//                       decoration: InputDecoration(
//                         labelText: 'Semester Number',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter semester number';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         setState(() {
//                           // print(value);
//                           _semesterNumber = int.tryParse(value);
//                         });
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: _submitForm,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange[800],
//                         foregroundColor: Colors.white,
//                       ),
//                       child: Text('Submit'),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   _responseText == null
//                       ? Container()
//                       : Text(
//                           _responseText!,
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 20,
//                           ),
//                         ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }












// class _CourseListFormState extends State<CourseListForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _selectedProgram;
//   String _selectedBranch;
//   String _selectedBatch;

//   final List<String> programs = ['PhD', 'M Tech', 'B Tech', 'B Des', 'M Des'];
//   final List<String> branches = ['CSE', 'ECE', 'ME', 'SM'];
//   final List<String> batches = ['2021', '2022', '2023', '2024', '2025'];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Course List Form'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 DropdownButtonFormField(
//                   value: _selectedProgram,
//                   hint: Text('Select Program'),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedProgram = value;
//                     });
//                   },
//                   items: programs.map((program) {
//                     return DropdownMenuItem(
//                       value: program,
//                       child: Text(program),
//                     );
//                   }).toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a program';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 DropdownButtonFormField(
//                   value: _selectedBranch,
//                   hint: Text('Select Branch'),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedBranch = value;
//                     });
//                   },
//                   items: branches.map((branch) {
//                     return DropdownMenuItem(
//                       value: branch,
//                       child: Text(branch),
//                     );
//                   }).toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a branch';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 DropdownButtonFormField(
//                   value: _selectedBatch,
//                   hint: Text('Select Batch'),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedBatch = value;
//                     });
//                   },
//                   items: batches.map((batch) {
//                     return DropdownMenuItem(
//                       value: batch,
//                       child: Text(batch),
//                     );
//                   }).toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a batch';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 32.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       // Submit logic here
//                       print('Program: $_selectedProgram');
//                       print('Branch: $_selectedBranch');
//                       print('Batch: $_selectedBatch');
//                     }
//                   },
//                   child: Text(
//                     'Submit',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.orange,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }