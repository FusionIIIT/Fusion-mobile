import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';

class ViewMenu extends StatefulWidget {
  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  CentralMessService _centralMessService = CentralMessService();

  bool _loading = false, _loadDish = false;
  String? selectedMess, selectedDay, selectedMeal;

  List<List<String>> mat = [
    ["MB", "ML", "MD"],
    ["TB", "TL", "TD"],
    ["WB", "WL", "WD"],
    ["THB", "THL", "THD"],
    ["FB", "FL", "FD"],
    ["SB", "SL", "SD"],
    ["SUB", "SUL", "SUD"],
  ];

  Map<int, String> week = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  };

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

  // List<String> dishes = [];
  // Future<void> fetchMenuData() async {
  //   final url = Uri.parse("http://172.27.113.207:5000/menu/?mess_option=$selectedMess&day=$selectedDay&meal_time=$selectedMeal");
  //   print(url);
  //   try {
  //     final response = await http.get(url);
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         dishes = List<String>.from(data['dishes']);
  //         _loadDish = true;
  //         print("got dishes info");
  //       });
  //     } else {
  //       throw Exception('Failed to fetch menu data');
  //     }
  //   } catch (e) {
  //     print('Error fetching menu data: $e');
  //     // Handle error accordingly
  //   }
  // }

  List<MessMenu> _menuItems = [];


  @override
  void initState() {
    super.initState();
    // _fetchMenuData();
  }


  void _fetchMenuData() async {
    try {
      List<MessMenu> menuItems = await _centralMessService.getMenu();
      setState(() {
        _menuItems = menuItems;
        _loadDish = true;
      });
      print('Received the menu');
    } catch (e) {
      print('Error fetching menu: $e');
    }
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
                        _fetchMenuData();
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

                _loadDish
                  ? SingleChildScrollView(
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                                child: Center(
                                  child: Text('Day/Meal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                )
                            ),
                            TableCell(
                                child: Center(
                                  child: Text('Breakfast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                )
                            ),
                            TableCell(
                                child: Center(
                                  child: Text('Lunch', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                )
                            ),
                            TableCell(
                                child: Center(
                                  child: Text('Dinner', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                )
                            ),
                          ],
                        ),
                        for (int i = 0; i < 7; i++)
                          TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                  child: Text(week[i+1]!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              for (int j = 0; j < 3; j++)
                                TableCell(
                                  child: Center(
                                    child: Text(_menuItems.where( (item) => ( (item.messOption == selectedMess) && (item.mealTime == mat[i][j]) ) ).first.dish),
                                    // child: Text(mat[i][j]),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 30.0),
              ],
            ),
                ) : Center(child: CircularProgressIndicator()),
            ],
            ),
            ),
            ),
            );

          // _loadDish
          //     ? Column(
          //   children: _menuItems.where((item)=> ((item.messOption == selectedMess) && (item.mealTime == (selectedDay)!+(selectedMeal)!) )).first.dish.split(',').map((menuItem) => Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       menuItem,
          //       maxLines: 5,
          //       style: TextStyle(fontSize: 20.0,),
          //     ),
          //   )).toList(),
          // )
          //     : SizedBox(height: 10.0),
    //     ],
    //   ),
    // ) : Center(child: CircularProgressIndicator());
  }
}
