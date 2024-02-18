import 'package:flutter/material.dart';


class UpdateMenu extends StatefulWidget {
  @override
  _UpdateMenuState createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  bool _loading = false, _updateDish = false;
  String? selectedMess, selectedDay, selectedMeal, dish;


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
    final _messFormKey = GlobalKey<FormState>();
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Mess',
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
                      value: selectedMess,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMess = newValue!;
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
                    SizedBox(height: 30.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a day',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a day" : null,
                      dropdownColor: Colors.white,
                      value: selectedDay,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDay = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Monday"),
                            value: "Monday"),
                        DropdownMenuItem(
                            child: Text("Tuesday"),
                            value: "Tuesday"),
                        DropdownMenuItem(
                            child: Text("Wednesday"),
                            value: "Wednesday"),
                        DropdownMenuItem(
                            child: Text("Thursday"),
                            value: "Thursday"),
                        DropdownMenuItem(
                            child: Text("Friday"),
                            value: "Friday"),
                        DropdownMenuItem(
                            child: Text("Saturday"),
                            value: "Saturday"),
                        DropdownMenuItem(
                            child: Text("Sunday"),
                            value: "Sunday"),

                      ],
                    ),
                    SizedBox(height: 30.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select a Meal',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a meal" : null,
                      dropdownColor: Colors.white,
                      value: selectedMeal,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMeal = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Breakfast"),
                            value: "Breakfast"),
                        DropdownMenuItem(
                            child: Text("Lunch"),
                            value: "Lunch"),
                        DropdownMenuItem(
                            child: Text("Dinner"),
                            value: "Dinner"),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      maxLines: 4,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Enter a new dish',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a new dish";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_messFormKey.currentState!.validate()) {
                            // Handle valid flow
                            // print("Selected mess: $selectedValue");
                            // Now we can perform actions based on the selected mess
                          }
                        },
                        child: Text("Update"))
                  ],
                ),
              ),
            ),
          ),
          // updated successfully
          // _updateDish
          //     ? Column(
          //   children:
          // )
          //     : SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
