import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';

//TODO: Update Elevated Button

class Convocation extends StatefulWidget {
  @override
  _ConvocationState createState() => _ConvocationState();
}

class _ConvocationState extends State<Convocation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? programme_type;
  List complaintTypeItem = [
    "Directors Gold Medal",
    "Directors Silver Medal",
    'Notional Prizes',
    'MCM Scholarship',
    'D&M Proficiency Gold Medal',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              // SizedBox(height: 10),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Center(
              //         child: Text(
              //       "Apply",
              //       style: TextStyle(
              //         fontSize: 20.0,
              //       // color: Colors.deepOrangeAccent,
              //       ),         
              //     )),
              //   ),
              //   decoration: new BoxDecoration(
              //     color: Colors.deepOrangeAccent,
              //     border: new Border.all(
              //       color: Colors.deepOrange,
              //       width: 1.0,
              //       style: BorderStyle.solid,
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(0.0, 1.0),
              //         blurRadius: 2.0,
              //       )
              //     ],
              //     borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Enter Award'),
                    dropdownColor: Colors.grey[200],
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (newValue) {
                      // print(service.userInDB?.token);
                      // print(complainer);
                      setState(() {
                        programme_type = newValue.toString();
                      });
                      print(programme_type);
                      //print(valueItem);
                    },
                    value: programme_type,
                    items: complaintTypeItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              // SizedBox(height: 28),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Enter Scholarship Name',
              //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(32.0),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text(
              //       'Search',
              //       style: TextStyle(fontSize: 20.0),
              //     ),
              //   ),
              //   onPressed: () {
              //     // Respond to button press
              //   },
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
              //       (Set<MaterialState> states) {
              //         if (states.contains(MaterialState.pressed))
              //           return Colors.deepOrange;
              //         return Colors
              //             .deepOrangeAccent; // Use the component's default.
              //       },
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  thickness: 1,
                  color: Colors.black54,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
