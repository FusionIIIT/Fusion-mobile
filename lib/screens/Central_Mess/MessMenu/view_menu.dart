import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewMenu extends StatefulWidget {
  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  bool _loading = false, _loadDish = false;
  String? selectedMess, selectedDay, selectedMeal;


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

  List<String> dishes = [];
  Future<void> fetchMenuData() async {
    final url = Uri.parse("http://172.27.113.207:5000/menu/?mess_option=$selectedMess&day=$selectedDay&meal_time=$selectedMeal");
    print(url);
    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dishes = List<String>.from(data['dishes']);
          _loadDish = true;
          print("got dishes info");
        });
      } else {
        throw Exception('Failed to fetch menu data');
      }
    } catch (e) {
      print('Error fetching menu data: $e');
      // Handle error accordingly
    }
  }


  @override
  void initState() {
    super.initState();
    // fetchMenuData();
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
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_messFormKey.currentState!.validate()) {
                            // Handle valid flow
                            // print("Selected mess: $selectedValue");
                            // Now we can perform actions based on the selected mess
                            print({selectedDay, selectedMeal, selectedMess});
                            fetchMenuData();
                          }
                        },
                        child: Text("View Menu"))
                  ],
                ),
              ),
            ),
          ),
          _loadDish
              ? Column(
            children: dishes.map((dish) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dish,
                maxLines: 5,
                style: TextStyle(fontSize: 20.0,),
              ),
            )).toList(),
          )
              : SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
