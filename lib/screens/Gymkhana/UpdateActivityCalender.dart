import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ActivityCalendar extends StatefulWidget {
  @override
  _ActivityCalendarState createState() => _ActivityCalendarState();
}

class _ActivityCalendarState extends State<ActivityCalendar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedClub = 'Club 1';
  String _fileName = '';
  bool _fileChosen = false;

  Future<void> _openFileExplorer() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'png'],
    );

    if (resultFile != null) {
      setState(() {
        // _filePath = result.files.single.path!;
        _fileChosen = true;
        PlatformFile file = resultFile.files.first;
        _fileChosen = true;
        _fileName = file.name;
        print(_fileName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Activity Calendar',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedClub,
                  items: <String>['Club 1', 'Club 2', 'Club 3', 'Club 4']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedClub = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Text(
                  'Activity Calendar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              // Text(_fileName.isEmpty
              //     ? 'No file selected'
              //     : _fileName),
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   'Choose File',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16.0,
                  //   ),
                  // ),
                  SizedBox(width: 20.0),
                  ElevatedButton.icon(
                    onPressed: _openFileExplorer,
                    icon: Icon(Icons.attach_file),
                    label: Text(
                      'Choose File',
                      style: TextStyle(color: Colors.black),
                    ),
                    
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                    ),
                  ),
                  Text(_fileName.isEmpty
                  ? 'No file selected'
                  : _fileName),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the form data here
                    print('Form submitted');
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
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
    home: ActivityCalendar(),
    theme: ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.deepOrangeAccent,
    ),
  ));
}
