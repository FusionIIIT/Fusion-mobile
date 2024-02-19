import 'package:flutter/material.dart';

class CreateFilePage extends StatefulWidget {
  @override
  _CreateFilePageState createState() => _CreateFilePageState();
}

class _CreateFilePageState extends State<CreateFilePage> {
  // Form controllers
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _attachController = TextEditingController();
  final _remarksController = TextEditingController();
  final _forwardToController = TextEditingController();
  final _designationController = TextEditingController();

  // Submit form with placeholder logic
  Future<void> _submitForm() async {
    // Handle form data validation and submission (replace with your logic)
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      print('Error: Title and Description are required.');
      return;
    }

    print('Form data:');
    print('Title: ${_titleController.text}');
    print('Description: ${_descriptionController.text}');
    print('Remarks: ${_remarksController.text}');
    print('Forward To: ${_forwardToController.text}');
    print('Designation: ${_designationController.text}');

    // Clear form fields after submission
    _titleController.clear();
    _descriptionController.clear();
    _remarksController.clear();
    _forwardToController.clear();
    _designationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create File'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User profile view (adapt from your previous code)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO: Add your user profile image and details
                  CircleAvatar(
                    radius: 30.0,
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: Replace with user name and designation
                      Text(
                        "Rohit Sharma",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "21BCS329",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Designation",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Divider
            Divider(thickness: 1.0, color: Colors.grey[300]),

            // Form content
            Column(
              children: [
                // Title field
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    // errorText: _titleController.text.isEmpty ? 'Required' : null,
                  ),
                ),

                // Description field
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    // errorText: _descriptionController.text.isEmpty ? 'Required' : null,
                  ),
                ),

                // Attach field
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text 'Attach File'
                  Text('Attach File'),
                  SizedBox(width: 16.0), // Add spacing between text and button

                  // ElevatedButton with 'Upload' text
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('File Attachment'),
                          content: Text('File attachment is not currently supported in this web app.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Upload'),
                  ),
                ],
              ),

                // Remarks field
                TextField(
                  controller: _remarksController,
                  decoration: InputDecoration(
                    labelText: 'Remarks',
                  ),
                ),

                // Forward to field
                TextField(
                  controller: _forwardToController,
                  decoration: InputDecoration(
                    labelText: 'Forward To',
                  ),
                ),

                // Designation field
                TextField(
                  controller: _designationController,
                  decoration: InputDecoration(
                    labelText: 'Receiver\'s Designation',
                  ),
                ),

                // Send button
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
