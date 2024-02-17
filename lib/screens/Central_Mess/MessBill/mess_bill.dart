import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class ViewBill extends StatefulWidget {
  @override
  _ViewBillState createState() => _ViewBillState();
}

class _ViewBillState extends State<ViewBill> {
  bool _loading = true;
  String? selectedValue;

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Mess Bill",
                      style:
                      TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Form(
                  // key: _messFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrangeAccent, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) =>
                        value == null ? "Select a mess" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                              child: Text("Central Mess 1"),
                              value: "mess1"),
                          DropdownMenuItem(
                              child: Text("Central Mess 2"),
                              value: "mess2"),
                        ],
                      ),
                      ElevatedButton(
                          style: style,
                          onPressed: () {
                            // if (_messFormKey.currentState!.validate()) {
                            //   // Handle valid flow
                            //   // print("Selected mess: $selectedValue");
                            //   // Now we can perform actions based on the selected mess
                            // }
                          },
                          child: Text("Download"))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
