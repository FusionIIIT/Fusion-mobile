import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';

class AddCompany extends StatefulWidget {
  @override
  _AddCompanyState createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final _formKey = GlobalKey<FormState>();
  String _companyName = "";
  String _placementType = "";
  List<String> _rolesOffered = [];
  int _ctc = 0;
  String _jobDescription = "";
  DateTime _dateOfVisit = DateTime.now();
  DateTime _deadlineToApply = DateTime.now();
  final List<Map<String, dynamic>> _companyList = [];

  void _previewCompanyDetails() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Company Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Company Name: $_companyName'),
                Text('Placement Type: $_placementType'),
                Text('Roles Offered: ${_rolesOffered.join(", ")}'),
                Text('CTC: $_ctc'),
                Text('Job Description: $_jobDescription'),
                Text('Date of Visit: ${DateFormat('yyyy-MM-dd').format(_dateOfVisit)}'),
                Text('Deadline to Apply: ${DateFormat('yyyy-MM-dd').format(_deadlineToApply)}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  _companyList.add({
                    'companyName': _companyName,
                    'placementType': _placementType,
                    'rolesOffered': _rolesOffered,
                    'ctc': _ctc,
                    'jobDescription': _jobDescription,
                    'dateOfVisit': _dateOfVisit,
                    'deadlineToApply': _deadlineToApply,
                  });
                  _formKey.currentState!.reset();
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Details'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Company Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a company name';
                      }
                      return null;
                    },
                    onSaved: (value) => _companyName = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Placement Type'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter whether its intern or full time job';
                      }
                      return null;
                    },
                    onSaved: (value)=> _placementType = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Roles Offered'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter roles offered';
                      }
                      return null;
                    },
                    onSaved: (value) => _rolesOffered = value!.split(','),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'CTC'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CTC';
                      }
                      if (int.tryParse(value) == null) {
                        return 'CTC must be a valid integer';
                      }
                      return null;
                    },
                    onSaved: (value) => _ctc = int.parse(value!),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Job Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter job description';
                      }
                      return null;
                    },
                    onSaved: (value) => _jobDescription = value!,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Date of Visit'),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                  );
                                  if (picked != null && picked != _dateOfVisit) {
                                    setState(() {
                                      _dateOfVisit = picked;
                                    });
                                  }
                                },
                                child: Text(
                                  _dateOfVisit == null
                                      ? 'Pick a date'
                                      : DateFormat('yyyy-MM-dd').format(
                                      _dateOfVisit),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Deadline to Apply'),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                  );
                                  if (picked != null &&
                                      picked != _deadlineToApply) {
                                    setState(() {
                                      _deadlineToApply = picked!;
                                    });
                                  }
                                },
                                child: Text(
                                  _deadlineToApply == null
                                      ? 'Pick a date and time'
                                      : DateFormat('yyyy-MM-dd')
                                      .format(_deadlineToApply),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _companyList.length,
                itemBuilder: (context, index) {
                  final company = _companyList[index];
                  return Dismissible(
                    key: Key(company['companyName']),
                    onDismissed: (direction) {
                      setState(() {
                        _companyList.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(company['companyName']),
                      subtitle: Text(company['placementType']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyDetailsPage(
                              company: company,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _previewCompanyDetails,
              child: Text('Preview'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _companyList.add({
              'companyName': _companyName,
              'placementType': _placementType,
              'rolesOffered': _rolesOffered,
              'ctc': _ctc,
              'jobDescription': _jobDescription,
              'dateOfVisit': _dateOfVisit,
              'deadlineToApply': _deadlineToApply,
            });
            _formKey.currentState!.reset();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
class CompanyDetailsPage extends StatelessWidget {
  final Map<String, dynamic> company;

  CompanyDetailsPage({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company['companyName']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Placement Type: ${company['placementType']}'),
            SizedBox(height: 8),
            Text('Roles Offered: ${company['rolesOffered'].join(', ')}'),
            SizedBox(height: 8),
            Text('CTC: ${company['ctc']}'),
            SizedBox(height: 8),
            Text('Job Description: ${company['jobDescription']}'),
            SizedBox(height: 8),
            Text('Date of Visit: ${DateFormat('yyyy-MM-dd').format(company['dateOfVisit'])}'),
            SizedBox(height: 8),
            Text('Deadline to Apply: ${DateFormat('yyyy-MM-dd HH:mm').format(company['deadlineToApply'])}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}