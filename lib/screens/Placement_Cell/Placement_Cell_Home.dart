import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/placement.dart';
import 'package:fusion/services/placement_service.dart';
import 'package:fusion/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class PlacementHomePage extends StatefulWidget {
  final String? token;
  static String tag = 'placement-page';
  PlacementHomePage(this.token);

  @override
  _PlacementHomePageState createState() => _PlacementHomePageState();
}

class _PlacementHomePageState extends State<PlacementHomePage> {
  bool _loading1 = true;
  late StreamController _placementController;
  late PlacementService placementService;
  late List<PlacementRecord> list;


  String _value = 'Placement Schedule';
  var _currentSelectedValue;
  var _placementTypes = [
    "PlacementType1",
    "PlacementType2",
  ];


  @override
  void initState() {
    super.initState();
    _placementController = StreamController();
    placementService = PlacementService();
    getPlacementDataStream();
  }

  getPlacementDataStream() async {
    try {
      Response response = await placementService.getPlacementRecord(
          widget.token!);
      setState(() {
        // print(response.body);
        var data = json.decode(response.body);
        var rest = data["placementrecord"] as List;
        print(rest);
        list = rest.map<PlacementRecord>((json) =>PlacementRecord.fromJson(json)).toList();
        print(list[0].name);
        // print("list size : ${list.length}");
        _loading1 = false;

      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getPlacementDataStream().then((res) {
      _placementController.add(res);
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.deepOrangeAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(15.0))
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: myBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
      ),
    );
  }

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
        body: _loading1
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                    'Placement Schedule :',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),

                  ),
                ),
                SafeArea(
                  child: ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return Card(child: Text(list[index].name));
                      }
                  ),
                ),
              ],
            )
        )
    );
  }
}
