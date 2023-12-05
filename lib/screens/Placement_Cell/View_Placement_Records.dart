import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Placement_Cell/Batch_Statistics.dart';
import 'package:fusion/screens/Placement_Cell/Past_Records.dart';


class ViewPlacementRecords extends StatefulWidget {
  @override
  State<ViewPlacementRecords> createState() => _ViewPlacementRecords();
}

class _ViewPlacementRecords extends State<ViewPlacementRecords> {
  var selectedIndex = 0;
  String _value = 'Past Records';
  Widget _activePage = PastRecords();
  @override
  Widget build(BuildContext context) {
    switch(_value)
    {
      case 'Past Records':
        _activePage = PastRecords();
        break;
      case 'Batch Statistics':
        _activePage = BatchStatistics();
        break;
      default:
        _activePage = PastRecords();
        break;
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButton<String>(
                  value: _value,
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Past Records',
                      child: Text('Past Records'),
                    ),
                    DropdownMenuItem(
                        value: 'Batch Statistics',
                        child: Text('Batch Statistics')
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() => _value = value!);
                  },
                ),
              ],
            )
        ),
        body: _activePage,
        drawer: SideDrawer(),
      );
    });
  }
}


