import 'package:flutter/material.dart';

class Convocation extends StatefulWidget {
  @override
  _ConvocationState createState() => _ConvocationState();
}

class _ConvocationState extends State<Convocation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? programme_type;
  List awardTypeItem = [
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
                      setState(() {
                        programme_type = newValue.toString();
                      });
                      print(programme_type);
                      //print(valueItem);
                    },
                    value: programme_type,
                    items: awardTypeItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
