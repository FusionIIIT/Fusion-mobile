import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';

class PastRecords extends StatefulWidget {
  @override
  State<PastRecords> createState() => _PastRecordsState();
}

class _PastRecordsState extends State<PastRecords> {

  String _value = 'Past Records';
  var _currentSelectedValue;

  String tab1 = 'Placement';

  String tab2 = 'PBI';

  String tab3 = 'Higher Studies';

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
      drawer: SideDrawer(),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                labelColor: Colors.black,
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 20.0),
                tabs: [Tab(text: tab1), Tab(text: tab2), Tab(text: tab3)]),
          ),
          body: TabBarView(
            children: [
              PlacementTab(),
              PlacementTab(),
              PlacementTab1(),
            ],
          ),
        ),
      ),
    );
  }
}

class PlacementTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: Text(
                'Search a Student!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Student Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Year',
            ),
          ),
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.blue)))),
          onPressed: () {
            print('Search Pressed');
          },
          icon: Icon(Icons.arrow_right),
          label: Text('Search'),
        )
      ],
    );
  }
}

class PlacementTab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: Text(
                'Search a Student!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Student Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              labelText: 'Year',
            ),
          ),
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.blue)))),
          onPressed: () {
            Navigator.pushNamed(context, '/add_placement_record');
            print('Search Pressed');
          },
          icon: Icon(Icons.arrow_right),
          label: Text('Search'),
        )
      ],
    );
  }
}