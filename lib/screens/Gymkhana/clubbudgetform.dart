// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class ClubBudgetForm extends StatefulWidget {
//   @override
//   _ClubBudgetFormState createState() => _ClubBudgetFormState();
// }

// class _ClubBudgetFormState extends State<ClubBudgetForm> {
//   String _club = '';
//   String _budgetFor = '';
//   double _budgetAmount = 0.0;
//   String _attachment = '';
//   String _detailsDescription = '';
//   String _status = 'open'; // Add status field with default value 'open'

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Club Budget Form', style: TextStyle(color: Colors.deepOrangeAccent)),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Club',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter club name';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _club = value ?? '';
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Budget For',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter budget for';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _budgetFor = value ?? '';
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Budget Amount',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter budget amount';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _budgetAmount = double.tryParse(value) ?? 0.0;
//                   });
//                 },
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   final result = await FilePicker.platform.pickFiles();

//                   if (result != null) {
//                     setState(() {
//                       _attachment = result.files.single.name ?? '';
//                     });
//                   }
//                 },
//                 child: Text(
//                   'Attachment',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrangeAccent,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Details & Description',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter details & description';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _detailsDescription = value ?? '';
//                   });
//                 },
//                 maxLines: null,
//               ),
//               SizedBox(height: 20),
//               // Status field with default value 'open'
//               TextFormField(
//                 initialValue: _status,
//                 enabled: false, // Disable editing
//                 decoration: InputDecoration(
//                   labelText: 'Status',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Submit form logic goes here
//                     // You can access form fields using _club, _budgetFor, _budgetAmount, _attachment, and _detailsDescription variables
//                     // Status will always be 'open'
//                   }
//                 },
//                 child: Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrangeAccent,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'Club Budget Form',
//     theme: ThemeData(
//       primaryColor: Colors.deepOrangeAccent,
//       accentColor: Colors.deepOrangeAccent,
//     ),
//     home: ClubBudgetForm(),
//   ));
// }









// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:fusion/services/clubbudgetservices.dart';

// class ClubBudgetForm extends StatefulWidget {
//   @override
//   _ClubBudgetFormState createState() => _ClubBudgetFormState();
// }

// class _ClubBudgetFormState extends State<ClubBudgetForm> {
//   String _club = '';
//   String _budgetFor = '';
//   int _budgetAmount = 0; // Changed to integer type
//   String _attachment = '';
//   String _detailsDescription = '';
//   String _status = 'open'; // Add status field with default value 'open'

//   final _formKey = GlobalKey<FormState>();

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Make a call to your ClubBudgetServices class to create a club budget
//         await ClubBudgetServices().createClubBudget(
//           club: _club,
//           budgetFor: _budgetFor,
//           budgetAmt: _budgetAmount, // Passing integer value directly
//           budgetFile: _attachment,
//           status: _status,
//         );
//         // Reset the form after successful submission
//         _formKey.currentState!.reset();
//         // Clear attachment field after successful submission
//         setState(() {
//           _attachment = '';
//         });
//       } catch (e) {
//         print('Error while submitting form: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Club Budget Form',
//             style: TextStyle(color: Colors.deepOrangeAccent)),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Club',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide:
//                         BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter club name';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _club = value ?? '';
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Budget For',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide:
//                         BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter budget for';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _budgetFor = value ?? '';
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Budget Amount',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide:
//                         BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter budget amount';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _budgetAmount =
//                         int.tryParse(value) ?? 0; // Parse to integer
//                   });
//                 },
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   final result = await FilePicker.platform.pickFiles();

//                   if (result != null) {
//                     setState(() {
//                       _attachment = result.files.single.name ?? '';
//                     });
//                   }
//                 },
//                 child: Text(
//                   'Attachment',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrangeAccent,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Details & Description',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide:
//                         BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter details & description';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _detailsDescription = value ?? '';
//                   });
//                 },
//                 maxLines: null,
//               ),
//               SizedBox(height: 20),
//               // Status field with default value 'open'
//               TextFormField(
//                 initialValue: _status,
//                 enabled: false, // Disable editing
//                 decoration: InputDecoration(
//                   labelText: 'Status',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide:
//                         BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrangeAccent,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void main() {
//     runApp(MaterialApp(
//       title: 'Club Budget Form',
//       theme: ThemeData(
//         primaryColor: Colors.deepOrangeAccent,
//         accentColor: Colors.deepOrangeAccent,
//       ),
//       home: ClubBudgetForm(),
//     ));
//   }
// }


import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../services/clubbudgetservices.dart';

class ClubBudgetForm extends StatefulWidget {
  @override
  _ClubBudgetFormState createState() => _ClubBudgetFormState();
}

class _ClubBudgetFormState extends State<ClubBudgetForm> {
  String _club = '';
  String _budgetFor = '';
  int _budgetAmount = 0; // Changed to integer type
  String _attachment = '';
  String _detailsDescription = '';
  String _status = 'open'; // Add status field with default value 'open'

  final _formKey = GlobalKey<FormState>();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Make a call to your ClubBudgetServices class to create a club budget
        await ClubBudgetServices().createClubBudget(
          club: _club,
          budgetFor: _budgetFor,
          budgetAmt: _budgetAmount, // Passing integer value directly
          budgetFile: _attachment,
          status: _status,
        );
        // Reset the form after successful submission
        _formKey.currentState!.reset();
        // Clear attachment field after successful submission
        setState(() {
          _attachment = '';
        });
        // Notify user after file is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File selected: $_attachment')),
        );
      } catch (e) {
        print('Error while submitting form: $e');
      }
    }
  }

  Future<void> _selectFile() async {
  FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc'],
  );

  if (resultFile != null) {
    setState(() {
      PlatformFile fileName = resultFile.files.first;
      _attachment = fileName.name;
    });

    // Show a SnackBar to notify the user that the file has been selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('File $_attachment has been selected'),
      ),
    );
  } else {
    throw Exception('No files picked or file picker was canceled');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club Budget Form', style: TextStyle(color: Colors.deepOrangeAccent)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Club',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter club name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _club = value ?? '';
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Budget For',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter budget for';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _budgetFor = value ?? '';
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Budget Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter budget amount';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _budgetAmount = int.tryParse(value) ?? 0; // Parse to integer
                  });
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectFile,
                child: Text(
                  'Select File',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Details & Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter details & description';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _detailsDescription = value ?? '';
                  });
                },
                maxLines: null,
              ),
              SizedBox(height: 20),
              // Status field with default value 'open'
              TextFormField(
                initialValue: _status,
                enabled: false, // Disable editing
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Club Budget Form',
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
      accentColor: Colors.deepOrangeAccent,
    ),
    home: ClubBudgetForm(),
  ));
}
