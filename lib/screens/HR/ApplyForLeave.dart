import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class ApplyForLeave extends StatefulWidget {
  const ApplyForLeave();

  @override
  State<ApplyForLeave> createState() {
    return _ApplyForLeaveState();
  }
}

class _ApplyForLeaveState extends State<ApplyForLeave> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _applicationDateController =
      TextEditingController();
  final TextEditingController _personalFileNumberController =
      TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _natureOfLeaveController =
      TextEditingController();
  final TextEditingController _durationOfLeaveController =
      TextEditingController();
  final TextEditingController _purposeOfLeaveController =
      TextEditingController();
  final TextEditingController _addressDuringLeaveController =
      TextEditingController();
  final TextEditingController _responsibilitiesAssignedController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _designationController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your designation';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _applicationDateController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Application Date',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the application date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _personalFileNumberController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Personal File Number',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your personal file number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _departmentController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Department/Discipline',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your department/discipline';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _natureOfLeaveController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Nature of Leave',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the nature of leave';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _durationOfLeaveController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Duration of Leave',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the duration of leave';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _purposeOfLeaveController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Purpose of Leave',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the purpose of leave';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressDuringLeaveController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Address during Leave',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address during leave';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _responsibilitiesAssignedController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText:
                        'Academic and Administrative Responsibilities assigned to',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your responsibilities';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
