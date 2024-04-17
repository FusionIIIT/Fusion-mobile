// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fusion/models/central_mess.dart';
// import 'package:fusion/services/central_mess_services.dart';
//
// class UpdateMenu extends StatefulWidget {
//   @override
//   _UpdateMenuState createState() => _UpdateMenuState();
// }
//
// class _UpdateMenuState extends State<UpdateMenu> {
//   CentralMessService _centralMessService = CentralMessService();
//   TextEditingController textController = TextEditingController();
//
//   bool _updateDish = false;
//   MessMenu? data;
//   String? selectedMess, selectedDay, selectedMeal, dish;
//
//   @override
//   void initState() {
//     super.initState();
//     // _fetchMenuData();
//   }
//
//   void _updateMenuData(data) async {
//     try {
//       http.Response menuItems = await _centralMessService.updateMenu(data);
//       if (menuItems.statusCode == 200) {
//         print('Received the menu');
//         setState(() {
//           _updateDish = true;
//         });
//       } else {
//         print('Couldn\'t Update');
//       }
//     } catch (e) {
//       print('Error fetching menu: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     textController.dispose(); // Dispose the controller
//     super.dispose();
//   }
//
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//           color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
//       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//     );
//   }
//
//   Text myText(String text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//     );
//   }
//
//   Padding myContainer(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: myText(text),
//         ),
//         decoration: myBoxDecoration(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final _messFormKey = GlobalKey<FormState>();
//     final ButtonStyle style = ElevatedButton.styleFrom(
//       textStyle: const TextStyle(
//           fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
//       backgroundColor: Colors.white,
//       shadowColor: Colors.black,
//     );
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Form(
//                 key: _messFormKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     DropdownButtonFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Select a Mess',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) =>
//                       value == null ? "Select a mess" : null,
//                       dropdownColor: Colors.white,
//                       value: selectedMess,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedMess = newValue!;
//                         });
//                       },
//                       items: [
//                         DropdownMenuItem(
//                             child: Text("Central Mess 1"),
//                             value: "mess1"),
//                         DropdownMenuItem(
//                             child: Text("Central Mess 2"),
//                             value: "mess2"),
//                       ],
//                     ),
//                     SizedBox(height: 10.0),
//                     DropdownButtonFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Select a day',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) =>
//                       value == null ? "Select a day" : null,
//                       dropdownColor: Colors.white,
//                       value: selectedDay,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedDay = newValue!;
//                         });
//                       },
//                       items: [
//                         DropdownMenuItem(
//                             child: Text("Monday"),
//                             value: "M"),
//                         DropdownMenuItem(
//                             child: Text("Tuesday"),
//                             value: "T"),
//                         DropdownMenuItem(
//                             child: Text("Wednesday"),
//                             value: "W"),
//                         DropdownMenuItem(
//                             child: Text("Thursday"),
//                             value: "TH"),
//                         DropdownMenuItem(
//                             child: Text("Friday"),
//                             value: "F"),
//                         DropdownMenuItem(
//                             child: Text("Saturday"),
//                             value: "S"),
//                         DropdownMenuItem(
//                             child: Text("Sunday"),
//                             value: "SU"),
//
//                       ],
//                     ),
//                     SizedBox(height: 10.0),
//                     DropdownButtonFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Select a Meal',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) =>
//                       value == null ? "Select a meal" : null,
//                       dropdownColor: Colors.white,
//                       value: selectedMeal,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedMeal = newValue!;
//                         });
//                       },
//                       items: [
//                         DropdownMenuItem(
//                             child: Text("Breakfast"),
//                             value: "B"),
//                         DropdownMenuItem(
//                             child: Text("Lunch"),
//                             value: "L"),
//                         DropdownMenuItem(
//                             child: Text("Dinner"),
//                             value: "D"),
//                       ],
//                     ),
//                     SizedBox(height: 10.0),
//                     TextFormField(
//                       maxLines: 4,
//                       cursorHeight: 30,
//                       decoration: InputDecoration(
//                         labelText: 'Enter a new dish',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent, width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       controller: textController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Enter a new dish";
//                         } else {
//                           return null;
//                         }
//                       },
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     ElevatedButton(
//                         style: style,
//                         onPressed: () {
//                           if (_messFormKey.currentState!.validate()) {
//                             // Handle valid flow
//                             // print("Selected mess: $selectedValue");
//                             dish = textController.text;
//                             data?.messOption = selectedMess!;
//                             data?.mealTime = selectedDay! + selectedMeal!;
//                             data?.dish = dish!;
//                             // print({selectedMess, selectedDay, selectedMeal, dish});
//                             setState(() {
//                               data = MessMenu(
//                                   messOption: selectedMess!,
//                                   mealTime: selectedDay! + selectedMeal!,
//                                   dish: dish!);
//                             });
//                             // print(data);
//                             _updateMenuData(data);
//                             setState(() {
//                               data = null;
//                             });
//                             // Now we can perform actions based on the selected mess
//                           }
//                         },
//                         child: Text("Update"))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // updated successfully
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';

class UpdateMenu extends StatefulWidget {
  @override
  _UpdateMenuState createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  CentralMessService _centralMessService = CentralMessService();
  TextEditingController textController = TextEditingController();

  bool _updateDish = false, _loading = false;
  MessMenu? data;
  String? selectedMess, selectedDay, selectedMeal, dish;

  @override
  void initState() {
    super.initState();
    // _fetchMenuData();
  }

  void _updateMenuData(data) async {
    try {
      setState(() {
        _loading = true; // Set loading state to true before sending request
      });
      http.Response menuItems =
      await _centralMessService.updateMenu(data);
      if (menuItems.statusCode == 200) {
        print('Received the menu');
        setState(() {
          _updateDish = true;
          _loading = false; // Set loading state to false after successful request
        });
        _showSuccessSnackbar();
      } else {
        print('Couldn\'t Update');
        setState(() {
          _loading = false; // Set loading state to false after failed request
        });
        _showFailureSnackbar();
      }
    } catch (e) {
      print('Error fetching menu: $e');
      setState(() {
        _loading = false; // Set loading state to false if there's an error
      });
      _showFailureSnackbar();
    }
  }

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Menu Updated Successfully',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green, // Set background color to green for success
      ),
    );
  }

  void _showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Try again after some time !!!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red, // Set background color to red for failure
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose(); // Dispose the controller
    super.dispose();
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
                    DropdownButtonFormField<String>(
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
                          value: "mess1",
                        ),
                        DropdownMenuItem(
                          child: Text("Central Mess 2"),
                          value: "mess2",
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
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
                        DropdownMenuItem(child: Text("Monday"), value: "M"),
                        DropdownMenuItem(child: Text("Tuesday"), value: "T"),
                        DropdownMenuItem(child: Text("Wednesday"), value: "W"),
                        DropdownMenuItem(child: Text("Thursday"), value: "TH"),
                        DropdownMenuItem(child: Text("Friday"), value: "F"),
                        DropdownMenuItem(child: Text("Saturday"), value: "S"),
                        DropdownMenuItem(child: Text("Sunday"), value: "SU"),
                      ],
                    ),
                    SizedBox(height: 10.0),
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
                        DropdownMenuItem(child: Text("Breakfast"), value: "B"),
                        DropdownMenuItem(child: Text("Lunch"), value: "L"),
                        DropdownMenuItem(child: Text("Dinner"), value: "D"),
                      ],
                    ),
                    SizedBox(height: 10.0),
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
                      controller: textController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a new dish";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: style,
                      onPressed: _loading
                          ? null
                          : () {
                        if (_messFormKey.currentState!.validate()) {
                          setState(() {
                            _updateDish = true;
                          });
                          dish = textController.text;
                          data = MessMenu(
                            messOption: selectedMess!,
                            mealTime: selectedDay! + selectedMeal!,
                            dish: dish!,
                          );
                          _updateMenuData(data);
                          setState(() {
                            // Reset fields
                            selectedMess = null;
                            selectedDay = null;
                            selectedMeal = null;
                            dish = null;
                            data = null;
                            textController.text = ''; // Clear text field
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Update"),
                          if (_loading) CircularProgressIndicator(),
                        ],
                      ),
                    )
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
