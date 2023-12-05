import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';

class AddPlacementRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPlacementRecord();
}

class _AddPlacementRecord extends State<AddPlacementRecord> {
  String _value = 'Add Placement Record';
  var _currentSelectedValue;
  var _placementTypes = [
    "PlacementType1",
    "PlacementType2",
  ];
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                  child: Text(
                    'New Placement Record!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  labelText: 'Student Name',
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: 'Placement Type',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _placementTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: Colors.grey)),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: TextFormField(
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              labelText: 'Year',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ListTile(
                          title: TextFormField(
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              labelText: 'CTC in lpa',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  labelText: 'Test Score',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  labelText: 'Test Type',
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.deepOrange;
                    return Colors
                        .deepOrangeAccent; // Use the component's default.
                  },
                ),
              ),
              onPressed: () {
                print('Search Pressed');
              },
              icon: Icon(Icons.arrow_right),
              label: Text('Submit'),
            )
          ],
        ),
      ),
      drawer: SideDrawer(),
    );
  }
}
