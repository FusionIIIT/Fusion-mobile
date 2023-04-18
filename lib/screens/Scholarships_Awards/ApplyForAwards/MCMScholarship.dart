import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class MCMScholarship extends StatefulWidget {
  @override
  _MCMScholarshipState createState() => _MCMScholarshipState();
}

class _MCMScholarshipState extends State<MCMScholarship> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? fatherocc_type;
  List fatheroccTypeItem = [
    "Government",
    "Private",
    "Public",
    "Business",
    "Medical",
    "Consultant",
    "Pensioners",
  ];
  String? motherocc_type;
  List motheroccTypeItem = [
    "EMPLOYED",
    "HOUSE_WIFE",
  ];
  String? house_type;
  List houseTypeItem = [
    'RENTED',
    'OWNED',
  ];
  @override
  Widget build(BuildContext context) {
    String? specific_location;
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Container(
              child: new Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "MCM Scholarship Application Form:",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.download,
                      size: 24.0,
                    ),
                    label: Text('Form A'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.download,
                      size: 24.0,
                    ),
                    label: Text('Form B'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.download,
                      size: 24.0,
                    ),
                    label: Text('Form C'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Container(
                    padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Category: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Category',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new Container(
                          child: new Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Hall No. :',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 140.0,
                                child: TextFormField(
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Hall No.',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          child: new Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Room No. :',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 140.0,
                                child: TextFormField(
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Room No. ',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Father's Name :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Father's Name",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: Column(children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Father's Occupation :",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 140.0,
                          child: DropdownButton(
                            hint: Text('Select Item'),
                            dropdownColor: Colors.grey[200],
                            icon: Icon(Icons.arrow_drop_down),
                            underline: SizedBox(),
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            onChanged: (newValue) {
                              setState(() {
                                fatherocc_type = newValue.toString();
                              });
                              print(fatherocc_type);
                              //print(valueItem);
                            },
                            value: fatherocc_type,
                            items: fatheroccTypeItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Mother's Name :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Mother's Name ",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: Column(children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Mother's Occupation :",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 140.0,
                          child: DropdownButton(
                            hint: Text('Select Item'),
                            dropdownColor: Colors.grey[200],
                            icon: Icon(Icons.arrow_drop_down),
                            underline: SizedBox(),
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            onChanged: (newValue) {
                              setState(() {
                                motherocc_type = newValue.toString();
                              });
                              print(motherocc_type);
                              //print(valueItem);
                            },
                            value: motherocc_type,
                            items: motheroccTypeItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Father's Occupation Description *",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Father Occupation Description ",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mother's Occupation Description *",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Mother Occupation Description ",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Brother's Name: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Brother's Name",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Brother's Occupation: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Occup.. ",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Sister's Name: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Name",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Sister's Occupation: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Occup.. ",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Father's Annual Income: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Father Annual Income",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mother's Annual Income: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Mother Annual Income: ",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Other sources Annual Income: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Other sources Annual Income ",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '# of Four Wheeler : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 140.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Number of 4 Wheelers',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Four Wheeler Description: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Four Wheeler Description ",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '# of Two Wheeler : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 140.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Number of 2 Wheelers',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Two Wheeler Description: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350.0,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Two Wheeler Description ",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "House Type :",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 140.0,
                      child: DropdownButton(
                        hint: Text('Select Item'),
                        dropdownColor: Colors.grey[200],
                        icon: Icon(Icons.arrow_drop_down),
                        underline: SizedBox(),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        onChanged: (newValue) {
                          setState(() {
                            house_type = newValue.toString();
                          });
                          print(house_type);
                          //print(valueItem);
                        },
                        value: house_type,
                        items: houseTypeItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Plot Area: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Area ...",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Constructed Area: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Area.. ",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Fees 10th Standard: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Fees ...",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Name of School: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "School.. ",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Fees 12th Standard: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Fees ...",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Name of College: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "College.. ",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Amount of Edu. Bank loan: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Amount ...",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Bank Name: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140.0,
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Bank.. ",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.deepOrange;
                            return Colors
                                .deepOrangeAccent; // Use the component's default.
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
