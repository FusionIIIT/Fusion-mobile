import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/placement.dart';
import 'package:fusion/services/placement_service.dart';
import 'package:fusion/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class AddEvent extends StatefulWidget {
  @override
  AddEventState createState() {
    return AddEventState();
  }
}

class AddEventState extends State<AddEvent> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  String _value = 'Add Event';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DropdownButton<String>(
              value: _value,
              style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              focusColor: kPrimaryColor,
              dropdownColor: kPrimaryColor,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  value: 'Placement Schedule',
                  child: Text(
                    'Placement Schedule',
                  ),
                ),
                DropdownMenuItem(
                    value: 'Add Placement Record', child: Text('Add Placement Record')
                ),
                DropdownMenuItem(
                    value: 'Add Event', child: Text('Add Event')
                ),DropdownMenuItem(
                    value: 'Past Records', child: Text('Past Records')
                ),DropdownMenuItem(
                    value: 'Batch Statistics', child: Text('Batch Statistics')
                ),

              ],

              onChanged: (String? value) {
                setState((){
                  _value = value!;
                  switch(_value){
                    case 'Placement Schedule':
                      Navigator.pushReplacementNamed(context, '/placement_cell/placement_cell_home');
                      break;
                    case 'Add Placement Record':
                      Navigator.pushReplacementNamed(context, '/placement_cell/add_placement_record');
                      break;
                    case 'Add Event':
                      Navigator.pushReplacementNamed(context, 'placement_cell/add_event');
                      break;
                    case 'Batch Statistics':
                      Navigator.pushReplacementNamed(context, '/placement_cell/batch_statistics');
                      break;
                    case 'Past Records':
                      Navigator.pushReplacementNamed(context, '/placement_cell/past_records');
                      break;
                    default:
                      break;
                  }

                });
              },
            ),
          ],
        ),
      ),
      drawer: SideDrawer(),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter Company Name',
                      labelText: 'Company Name',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter Placement Type',
                      labelText: 'Placement Type',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter the Date',
                      labelText: 'Date',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter Role Offered',
                      labelText: 'Role Offered',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter Job Description',
                      labelText: 'Job Description',
                    ),
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                      child: new ElevatedButton(
                        child: const Text('Add Event'),
                        onPressed: null,
                      )),
                ],
                ),
          ),
          ),
    );
    }
}