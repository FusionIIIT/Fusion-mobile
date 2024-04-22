// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:fusion/services/createpoll.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(
//     home: VotingPolls(),
//   ));
// }

// class VotingPolls extends StatefulWidget {
//   @override
//   _VotingPollsState createState() => _VotingPollsState();
// }

// class _VotingPollsState extends State<VotingPolls> {
//   int _selectedIndex = 0;

//   static List<Widget> _widgetOptions = <Widget>[
//     CreatePolls(),
//     ActivePolls(),
//     PollStatus(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Voting Polls',
//             style: TextStyle(color: Colors.deepOrangeAccent)),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: 'Create Polls',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Active Polls',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.poll),
//             label: 'Poll Status',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.orange.shade900,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class CreatePolls extends StatefulWidget {
//   @override
//   _CreatePollsState createState() => _CreatePollsState();
// }

// class _CreatePollsState extends State<CreatePolls> {
//   List<String> choices = [''];
//   DateTime? _selectedDate;
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _titleController = TextEditingController();
//   String? _selectedForwardTo;

//   void addChoice() {
//     setState(() {
//       choices.add('');
//     });
//   }

//   void deleteChoice() {
//     setState(() {
//       if (choices.length > 1) {
//         choices.removeLast();
//       }
//     });
//   }

//   void _submitPoll() {
//     // Prepare data for creating the poll
//     String title = _titleController.text;
//     String description = _descriptionController.text;
//     String expDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(_selectedDate!);
//     String createdBy = 'current_user';

//     String groups = _selectedForwardTo ?? '';
//     List<Map<String, String>> choicesList = choices
//         .map((choice) => {'title': choice, 'description': description})
//         .toList();
//     print(title);
//     print(expDate);
//     print(createdBy);
//     print(groups);
//     print(choicesList);

//     // Call createPoll method from createpoll.dart
//     CreatePoll()
//         .createPoll(
//       title: title,
//       pubDate: DateTime.now().toString(),
//       expDate: expDate,
//       createdBy: createdBy,
//       groups: groups,
//       choices: choicesList,
//     )
//         .then((_) {
//       // Poll created successfully, you can handle any further actions here
//       print('Poll created successfully');
//     }).catchError((error) {
//       // Handle errors here
//       print('Failed to create poll: $error');

//       if (error is http.Response) {
//         print('Response body: ${error.body}');
//       }

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text("Failed to create poll: $error"),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         SizedBox(height: 20),
//         TextFormField(
//           controller: _titleController, // Use the title controller
//           decoration: InputDecoration(
//             labelText: 'Title',
//             labelStyle: TextStyle(color: Colors.orange.shade900),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.orange.shade900),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//           style: TextStyle(color: Colors.black),
//         ),
//         SizedBox(height: 20),
//         TextFormField(
//           controller: _descriptionController,
//           decoration: InputDecoration(
//             labelText: 'Description',
//             labelStyle: TextStyle(color: Colors.orange.shade900),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.orange.shade900),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//           maxLines: null,
//           style: TextStyle(color: Colors.black),
//         ),
//         SizedBox(height: 20),
//         DropdownButtonFormField<String>(
//           value: _selectedForwardTo,
//           decoration: InputDecoration(
//             labelText: 'Forward To',
//             labelStyle: TextStyle(color: Colors.orange.shade900),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.orange.shade900),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//           ),
//           items: <String>[
//             '2017 Batch',
//             '2018 Batch',
//             '2019 Batch',
//             '2017 CSE Batch',
//             '2017 ME Batch',
//             '2017 ECE Batch',
//             '2017 Design Batch',
//             '2018 CSE Batch',
//             '2018 ME Batch',
//             '2018 ECE Batch',
//             '2018 Design Batch',
//             '2019 CSE Batch',
//             '2019 ME Batch',
//             '2019 ECE Batch',
//             '2019 Design Batch'
//                 '2020 CSE Batch',
//             '2020 ME Batch',
//             '2020 ECE Batch',
//             '2020 Design Batch',
//             '2021 Batch',
//             '2021 CSE Batch',
//             '2021 ME Batch',
//             '2021 ECE Batch',
//             '2021 Design Batch'
//           ].map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(
//                 value,
//                 style: TextStyle(color: Colors.black),
//               ),
//             );
//           }).toList(),
//           onChanged: (String? value) {
//             setState(() {
//               _selectedForwardTo = value;
//             });
//           },
//         ),
//         SizedBox(height: 20),
//         TextFormField(
//           decoration: InputDecoration(
//             labelText: 'Expiry Date',
//             labelStyle: TextStyle(color: Colors.orange.shade900),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.orange.shade900),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//           style: TextStyle(color: Colors.black),
//           onTap: () async {
//             final DateTime? pickedDate = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime.now(),
//               lastDate: DateTime(2100),
//             );
//             if (pickedDate != null) {
//               setState(() {
//                 _selectedDate = pickedDate;
//               });
//             }
//           },
//           readOnly: true,
//           controller: TextEditingController(
//             text: _selectedDate != null
//                 ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
//                 : '',
//           ),
//         ),
//         SizedBox(height: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Choices',
//               style: TextStyle(color: Colors.orange.shade900),
//             ),
//             SizedBox(height: 10),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: choices.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'Choice ${index + 1}',
//                           hintStyle: TextStyle(color: Colors.orange.shade900),
//                           border: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.orange.shade900),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.black),
//                         onChanged: (value) {
//                           // Update the choices list when the user types
//                           choices[index] = value;
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         if (choices.length > 1) {
//                           deleteChoice();
//                         }
//                       },
//                     ),
//                   ],
//                 );
//               },
//             ),
//             SizedBox(height: 10),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   addChoice();
//                 },
//                 child: Text('Add Choice',
//                     style: TextStyle(color: Colors.orange.shade900)),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed:
//               _submitPoll, // Call the _submitPoll method when button is pressed
//           child: Text(
//             'Submit',
//             style: TextStyle(color: Colors.black),
//           ),
//           style: ElevatedButton.styleFrom(
//             primary: Colors.orange.shade900,
//           ),
//         ),
//         SizedBox(height: 20),
//       ],
//     );
//   }
// }

// class ActivePolls extends StatefulWidget {
//   @override
//   _ActivePollsState createState() => _ActivePollsState();
// }

// class _ActivePollsState extends State<ActivePolls> {
//   String? _selectedPollTitle;

//   // Sample data for demonstration
//   List<Map<String, dynamic>> _polls = [
//     {
//       'title': 'Poll 1',
//       'description': 'Description of Poll 1',
//       'expiryDate': '2024-02-20',
//       'choices': ['Choice 1', 'Choice 2', 'Choice 3'],
//       'selectedChoiceIndex': -1,
//     },
//     {
//       'title': 'Poll 2',
//       'description': 'Description of Poll 2',
//       'expiryDate': '2024-02-25',
//       'choices': ['Option A', 'Option B'],
//       'selectedChoiceIndex': -1,
//     },
//   ];

//   void _selectChoice(int pollIndex, int choiceIndex) {
//     setState(() {
//       _polls[pollIndex]['selectedChoiceIndex'] = choiceIndex;
//     });
//   }

//   void _submitPoll(int pollIndex) {
//     // Handle submitting the poll
//     print(
//         'Poll ${pollIndex + 1} submitted with choice ${_polls[pollIndex]['selectedChoiceIndex']}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _polls.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Card(
//             child: ExpansionTile(
//               title: Text(
//                 _polls[index]['title'] as String,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.orange),
//               ),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Description:',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             fontStyle: FontStyle.italic,
//                             color: Colors.orange),
//                       ),
//                       SizedBox(height: 5),
//                       Text(_polls[index]['description'] as String,
//                           style: TextStyle(fontSize: 14, color: Colors.black)),
//                       SizedBox(height: 10),
//                       Text(
//                         'Expiry Date:',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.orange),
//                       ),
//                       SizedBox(height: 5),
//                       Text(_polls[index]['expiryDate'] as String,
//                           style: TextStyle(fontSize: 14, color: Colors.black)),
//                       SizedBox(height: 10),
//                       Text(
//                         'Choices:',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.orange),
//                       ),
//                       Column(
//                         children: List.generate(
//                           _polls[index]['choices'].length,
//                           (choiceIndex) {
//                             final choice =
//                                 _polls[index]['choices'][choiceIndex] as String;
//                             final isSelected = _polls[index]
//                                     ['selectedChoiceIndex'] ==
//                                 choiceIndex;
//                             return GestureDetector(
//                               onTap: () => _selectChoice(index, choiceIndex),
//                               child: Container(
//                                 color: isSelected ? Colors.green : Colors.white,
//                                 child: ListTile(
//                                   title: Text(choice),
//                                   trailing: isSelected
//                                       ? Icon(Icons.check, color: Colors.green)
//                                       : null,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: _polls[index]['selectedChoiceIndex'] != -1
//                             ? () => _submitPoll(index)
//                             : null,
//                         child: Text('Submit',
//                             style: TextStyle(color: Colors.black)),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.orange,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class PollStatus extends StatefulWidget {
//   @override
//   _PollStatusState createState() => _PollStatusState();
// }

// class _PollStatusState extends State<PollStatus> {
//   // Sample data for demonstration
//   List<Map<String, dynamic>> _polls = [
//     {
//       'title': 'Senate',
//       'expiryDate': DateTime.now()
//           .add(Duration(days: 7)), // Sample expiry date 7 days from now
//       'votes': 2,
//       'choices': {'Choice 1': 0, 'Choice 2': 1, 'Choice 3': 1},
//     },
//     {
//       'title': 'cordinator',
//       'expiryDate':
//           DateTime.now().subtract(Duration(days: 2)), // Sample expired poll
//       'votes': 1,
//       'choices': {'Option A': 1, 'Option B': 0},
//     },
//   ];

//   void _deletePoll(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Confirm Delete"),
//           content: Text("Are you sure you want to delete this poll?"),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("No"),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _polls.removeAt(index); // Delete the poll
//                 });
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("Yes"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _polls.length,
//       itemBuilder: (context, index) {
//         final poll = _polls[index];
//         final bool isExpired = poll['expiryDate'].isBefore(DateTime.now());
//         return Card(
//           margin: EdgeInsets.all(10),
//           child: Padding(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Poll: ${poll['title']}',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () => _deletePoll(index),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Status: ${isExpired ? 'Expired' : 'Active'}',
//                   style: TextStyle(
//                       color: isExpired ? Colors.red : Colors.green,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Expiry Date: ${DateFormat('yyyy-MM-dd').format(poll['expiryDate'])}',
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Votes: ${poll['votes']}',
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Choices:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 ...poll['choices']
//                     .entries
//                     .map((entry) => Text('${entry.key}: ${entry.value}')),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:fusion/services/createpoll.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:fusion/services/showvoting_polls.dart';

// // void main() {
// //   runApp(MaterialApp(
// //     home: VotingPolls(),
// //   ));
// // }

// // class VotingPolls extends StatefulWidget {
// //   @override
// //   _VotingPollsState createState() => _VotingPollsState();
// // }

// // class _VotingPollsState extends State<VotingPolls> {
// //   int _selectedIndex = 0;

// //   static List<Widget> _widgetOptions = <Widget>[
// //     CreatePolls(),
// //     ActivePolls(),
// //     PollStatus(),
// //   ];

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Voting Polls',
// //             style: TextStyle(color: Colors.deepOrangeAccent)),
// //         backgroundColor: Colors.black,
// //         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Center(
// //           child: _widgetOptions.elementAt(_selectedIndex),
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: const <BottomNavigationBarItem>[
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.add),
// //             label: 'Create Polls',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.list),
// //             label: 'Active Polls',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.poll),
// //             label: 'Poll Status',
// //           ),
// //         ],
// //         currentIndex: _selectedIndex,
// //         selectedItemColor: Colors.orange.shade900,
// //         onTap: _onItemTapped,
// //       ),
// //     );
// //   }
// // }

// // class CreatePolls extends StatefulWidget {
// //   @override
// //   _CreatePollsState createState() => _CreatePollsState();
// // }

// // class _CreatePollsState extends State<CreatePolls> {
// //   List<String> choices = [''];
// //   DateTime? _selectedDate;
// //   TextEditingController _descriptionController = TextEditingController();
// //   TextEditingController _titleController = TextEditingController();
// //   String? _selectedForwardTo;

// //   void addChoice() {
// //     setState(() {
// //       choices.add('');
// //     });
// //   }

// //   void deleteChoice() {
// //     setState(() {
// //       if (choices.length > 1) {
// //         choices.removeLast();
// //       }
// //     });
// //   }

// //   void _submitPoll() {
// //     // Prepare data for creating the poll
// //     String title = _titleController.text;
// //     String description = _descriptionController.text;
// //     String expDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(_selectedDate!);
// //     String createdBy = 'current_user';

// //     String groups = _selectedForwardTo ?? '';
// //     List<Map<String, String>> choicesList = choices
// //         .map((choice) => {'title': choice, 'description': description})
// //         .toList();
// //     print(title);
// //     print(expDate);
// //     print(createdBy);
// //     print(groups);
// //     print(choicesList);

// //     // Call createPoll method from createpoll.dart
// //     CreatePoll()
// //         .createPoll(
// //       title: title,
// //       pubDate: DateTime.now().toString(),
// //       expDate: expDate,
// //       createdBy: createdBy,
// //       groups: groups,
// //       choices: choicesList,
// //     )
// //         .then((_) {
// //       // Poll created successfully, you can handle any further actions here
// //       print('Poll created successfully');
// //     }).catchError((error) {
// //       // Handle errors here
// //       print('Failed to create poll: $error');

// //       if (error is http.Response) {
// //         print('Response body: ${error.body}');
// //       }

// //       showDialog(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             title: Text("Error"),
// //             content: Text("Failed to create poll: $error"),
// //             actions: <Widget>[
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.of(context).pop(); // Close the dialog
// //                 },
// //                 child: Text("OK"),
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView(
// //       children: [
// //         SizedBox(height: 20),
// //         TextFormField(
// //           controller: _titleController, // Use the title controller
// //           decoration: InputDecoration(
// //             labelText: 'Title',
// //             labelStyle: TextStyle(color: Colors.orange.shade900),
// //             border: OutlineInputBorder(
// //               borderSide: BorderSide(color: Colors.orange.shade900),
// //               borderRadius: BorderRadius.circular(10.0),
// //             ),
// //           ),
// //           style: TextStyle(color: Colors.black),
// //         ),
// //         SizedBox(height: 20),
// //         TextFormField(
// //           controller: _descriptionController,
// //           decoration: InputDecoration(
// //             labelText: 'Description',
// //             labelStyle: TextStyle(color: Colors.orange.shade900),
// //             border: OutlineInputBorder(
// //               borderSide: BorderSide(color: Colors.orange.shade900),
// //               borderRadius: BorderRadius.circular(10.0),
// //             ),
// //           ),
// //           maxLines: null,
// //           style: TextStyle(color: Colors.black),
// //         ),
// //         SizedBox(height: 20),
// //         DropdownButtonFormField<String>(
// //           value: _selectedForwardTo,
// //           decoration: InputDecoration(
// //             labelText: 'Forward To',
// //             labelStyle: TextStyle(color: Colors.orange.shade900),
// //             border: OutlineInputBorder(
// //               borderSide: BorderSide(color: Colors.orange.shade900),
// //               borderRadius: BorderRadius.circular(10.0),
// //             ),
// //             filled: true,
// //             fillColor: Colors.white,
// //           ),
// //           items: <String>[
// //             '2017 Batch',
// //             '2018 Batch',
// //             '2019 Batch',
// //             '2017 CSE Batch',
// //             '2017 ME Batch',
// //             '2017 ECE Batch',
// //             '2017 Design Batch',
// //             '2018 CSE Batch',
// //             '2018 ME Batch',
// //             '2018 ECE Batch',
// //             '2018 Design Batch',
// //             '2019 CSE Batch',
// //             '2019 ME Batch',
// //             '2019 ECE Batch',
// //             '2019 Design Batch'
// //                 '2020 CSE Batch',
// //             '2020 ME Batch',
// //             '2020 ECE Batch',
// //             '2020 Design Batch',
// //             '2021 Batch',
// //             '2021 CSE Batch',
// //             '2021 ME Batch',
// //             '2021 ECE Batch',
// //             '2021 Design Batch'
// //           ].map((String value) {
// //             return DropdownMenuItem<String>(
// //               value: value,
// //               child: Text(
// //                 value,
// //                 style: TextStyle(color: Colors.black),
// //               ),
// //             );
// //           }).toList(),
// //           onChanged: (String? value) {
// //             setState(() {
// //               _selectedForwardTo = value;
// //             });
// //           },
// //         ),
// //         SizedBox(height: 20),
// //         TextFormField(
// //           decoration: InputDecoration(
// //             labelText: 'Expiry Date',
// //             labelStyle: TextStyle(color: Colors.orange.shade900),
// //             border: OutlineInputBorder(
// //               borderSide: BorderSide(color: Colors.orange.shade900),
// //               borderRadius: BorderRadius.circular(10.0),
// //             ),
// //           ),
// //           style: TextStyle(color: Colors.black),
// //           onTap: () async {
// //             final DateTime? pickedDate = await showDatePicker(
// //               context: context,
// //               initialDate: DateTime.now(),
// //               firstDate: DateTime.now(),
// //               lastDate: DateTime(2100),
// //             );
// //             if (pickedDate != null) {
// //               setState(() {
// //                 _selectedDate = pickedDate;
// //               });
// //             }
// //           },
// //           readOnly: true,
// //           controller: TextEditingController(
// //             text: _selectedDate != null
// //                 ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
// //                 : '',
// //           ),
// //         ),
// //         SizedBox(height: 20),
// //         Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Choices',
// //               style: TextStyle(color: Colors.orange.shade900),
// //             ),
// //             SizedBox(height: 10),
// //             ListView.builder(
// //               shrinkWrap: true,
// //               itemCount: choices.length,
// //               itemBuilder: (BuildContext context, int index) {
// //                 return Row(
// //                   children: [
// //                     Expanded(
// //                       child: TextFormField(
// //                         decoration: InputDecoration(
// //                           hintText: 'Choice ${index + 1}',
// //                           hintStyle: TextStyle(color: Colors.orange.shade900),
// //                           border: OutlineInputBorder(
// //                             borderSide:
// //                                 BorderSide(color: Colors.orange.shade900),
// //                             borderRadius: BorderRadius.circular(10.0),
// //                           ),
// //                         ),
// //                         style: TextStyle(color: Colors.black),
// //                         onChanged: (value) {
// //                           // Update the choices list when the user types
// //                           choices[index] = value;
// //                         },
// //                       ),
// //                     ),
// //                     IconButton(
// //                       icon: Icon(Icons.delete),
// //                       onPressed: () {
// //                         if (choices.length > 1) {
// //                           deleteChoice();
// //                         }
// //                       },
// //                     ),
// //                   ],
// //                 );
// //               },
// //             ),
// //             SizedBox(height: 10),
// //             Align(
// //               alignment: Alignment.centerRight,
// //               child: TextButton(
// //                 onPressed: () {
// //                   addChoice();
// //                 },
// //                 child: Text('Add Choice',
// //                     style: TextStyle(color: Colors.orange.shade900)),
// //               ),
// //             ),
// //           ],
// //         ),
// //         SizedBox(height: 20),
// //         ElevatedButton(
// //           onPressed:
// //               _submitPoll, // Call the _submitPoll method when button is pressed
// //           child: Text(
// //             'Submit',
// //             style: TextStyle(color: Colors.black),
// //           ),
// //           style: ElevatedButton.styleFrom(
// //             primary: Colors.orange.shade900,
// //           ),
// //         ),
// //         SizedBox(height: 20),
// //       ],
// //     );
// //   }
// // }

// // class ActivePolls extends StatefulWidget {
// //   @override
// //   _ActivePollsState createState() => _ActivePollsState();
// // }

// // class _ActivePollsState extends State<ActivePolls> {
// //   String? _selectedPollTitle;
// //   List<Map<String, dynamic>>? _polls;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchPollsFromBackend();
// //   }

// //   Future<void> _fetchPollsFromBackend() async {
// //     try {
// //       // Instantiate the ShowVotingPollsService
// //       var showVotingPollsService = ShowVotingPollsService();
// //       // Call the method to fetch voting polls
// //       List<Map<String, dynamic>> fetchedPolls =
// //           await showVotingPollsService.getShowVotingPolls();
// //       setState(() {
// //         _polls = fetchedPolls;
// //       });
// //     } catch (e) {
// //       print('Error fetching polls: $e');
// //       // Handle errors here
// //     }
// //   }

// //   void _selectChoice(int pollIndex, int choiceIndex) {
// //     setState(() {
// //       _polls![pollIndex]['selectedChoiceIndex'] = choiceIndex;
// //     });
// //   }

// //   void _submitPoll(int pollIndex) {
// //     // Handle submitting the poll
// //     print(
// //         'Poll ${pollIndex + 1} submitted with choice ${_polls![pollIndex]['selectedChoiceIndex']}');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return _polls == null
// //         ? Center(child: CircularProgressIndicator())
// //         : _buildPollsListView();
// //   }

// //   Widget _buildPollsListView() {
// //     return ListView.builder(
// //       itemCount: _polls!.length,
// //       itemBuilder: (context, index) {
// //         return Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Card(
// //             child: ExpansionTile(
// //               title: Text(
// //                 _polls![index]['title'] as String,
// //                 style: TextStyle(
// //                     fontWeight: FontWeight.bold, color: Colors.orange),
// //               ),
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Description:',
// //                         style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 16,
// //                             fontStyle: FontStyle.italic,
// //                             color: Colors.orange),
// //                       ),
// //                       SizedBox(height: 5),
// //                       Text(_polls![index]['description'] as String,
// //                           style: TextStyle(fontSize: 14, color: Colors.black)),
// //                       SizedBox(height: 10),
// //                       Text(
// //                         'Expiry Date:',
// //                         style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 16,
// //                             color: Colors.orange),
// //                       ),
// //                       SizedBox(height: 5),
// //                       Text(
// //                           _polls![index]['expiryDate'] != null
// //                               ? _polls![index]['expiryDate'] as String
// //                               : 'No expiry date',
// //                           style: TextStyle(fontSize: 14, color: Colors.black)),
// //                       SizedBox(height: 10),
// //                       Text(
// //                         'Choices:',
// //                         style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 16,
// //                             color: Colors.orange),
// //                       ),
// //                       Column(
// //                         children: List.generate(
// //                           _polls![index]['choices'].length,
// //                           (choiceIndex) {
// //                             final choice = _polls![index]['choices']
// //                                 [choiceIndex] as String;
// //                             final isSelected = _polls![index]
// //                                     ['selectedChoiceIndex'] ==
// //                                 choiceIndex;
// //                             return GestureDetector(
// //                               onTap: () => _selectChoice(index, choiceIndex),
// //                               child: Container(
// //                                 color: isSelected ? Colors.green : Colors.white,
// //                                 child: ListTile(
// //                                   title: Text(choice),
// //                                   trailing: isSelected
// //                                       ? Icon(Icons.check, color: Colors.green)
// //                                       : null,
// //                                 ),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                       SizedBox(height: 10),
// //                       ElevatedButton(
// //                         onPressed: _polls![index]['selectedChoiceIndex'] != -1
// //                             ? () => _submitPoll(index)
// //                             : null,
// //                         child: Text('Submit',
// //                             style: TextStyle(color: Colors.black)),
// //                         style: ElevatedButton.styleFrom(
// //                           primary: Colors.orange,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class PollStatus extends StatefulWidget {
// //   @override
// //   _PollStatusState createState() => _PollStatusState();
// // }

// // class _PollStatusState extends State<PollStatus> {
// //   // Sample data for demonstration
// //   List<Map<String, dynamic>> _polls = [
// //     {
// //       'title': 'Senate',
// //       'expiryDate': DateTime.now()
// //           .add(Duration(days: 7)), // Sample expiry date 7 days from now
// //       'votes': 2,
// //       'choices': {'Choice 1': 0, 'Choice 2': 1, 'Choice 3': 1},
// //     },
// //     {
// //       'title': 'cordinator',
// //       'expiryDate':
// //           DateTime.now().subtract(Duration(days: 2)), // Sample expired poll
// //       'votes': 1,
// //       'choices': {'Option A': 1, 'Option B': 0},
// //     },
// //   ];

// //   void _deletePoll(int index) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text("Confirm Delete"),
// //           content: Text("Are you sure you want to delete this poll?"),
// //           actions: <Widget>[
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop(); // Close the dialog
// //               },
// //               child: Text("No"),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _polls.removeAt(index); // Delete the poll
// //                 });
// //                 Navigator.of(context).pop(); // Close the dialog
// //               },
// //               child: Text("Yes"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: _polls.length,
// //       itemBuilder: (context, index) {
// //         final poll = _polls[index];
// //         final bool isExpired = poll['expiryDate'].isBefore(DateTime.now());
// //         return Card(
// //           margin: EdgeInsets.all(10),
// //           child: Padding(
// //             padding: EdgeInsets.all(10),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Poll: ${poll['title']}',
// //                       style:
// //                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                     IconButton(
// //                       icon: Icon(Icons.delete),
// //                       onPressed: () => _deletePoll(index),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 10),
// //                 Text(
// //                   'Status: ${isExpired ? 'Expired' : 'Active'}',
// //                   style: TextStyle(
// //                       color: isExpired ? Colors.red : Colors.green,
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   'Expiry Date: ${DateFormat('yyyy-MM-dd').format(poll['expiryDate'])}',
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   'Votes: ${poll['votes']}',
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   'Choices:',
// //                   style: TextStyle(fontWeight: FontWeight.bold),
// //                 ),
// //                 ...poll['choices']
// //                     .entries
// //                     .map((entry) => Text('${entry.key}: ${entry.value}')),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: VotingPolls(),
  ));
}

class VotingPolls extends StatefulWidget {
  @override
  _VotingPollsState createState() => _VotingPollsState();
}

class _VotingPollsState extends State<VotingPolls> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CreatePolls(),
    ActivePolls(),
    PollStatus(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting Polls',
            style: TextStyle(color: Colors.deepOrangeAccent)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Polls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Active Polls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Poll Status',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange.shade900,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CreatePolls extends StatefulWidget {
  @override
  _CreatePollsState createState() => _CreatePollsState();
}

class _CreatePollsState extends State<CreatePolls> {
  List<String> choices = [''];
  DateTime? _selectedDate;
  String? _selectedForwardTo;

  void addChoice() {
    setState(() {
      choices.add('');
    });
  }

  void deleteChoice() {
    setState(() {
      if (choices.length > 1) {
        choices.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Title',
            labelStyle: TextStyle(color: Colors.orange.shade900),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange.shade900),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: TextStyle(color: Colors.orange.shade900),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange.shade900),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          maxLines: null,
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 20),
        DropdownButtonFormField<String>(
          value: _selectedForwardTo,
          decoration: InputDecoration(
            labelText: 'Forward To',
            labelStyle: TextStyle(color: Colors.orange.shade900),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange.shade900),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          items: <String>[
            '2017 Batch',
            '2018 Batch',
            '2019 Batch',
            '2017 CSE Batch',
            '2017 ME Batch',
            '2017 ECE Batch',
            '2017 Design Batch',
            '2018 CSE Batch',
            '2018 ME Batch',
            '2018 ECE Batch',
            '2018 Design Batch',
            '2019 CSE Batch',
            '2019 ME Batch',
            '2019 ECE Batch',
            '2019 Design Batch'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedForwardTo = value;
            });
          },
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Expiry Date',
            labelStyle: TextStyle(color: Colors.orange.shade900),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange.shade900),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          style: TextStyle(color: Colors.black),
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              setState(() {
                _selectedDate = pickedDate;
              });
            }
          },
          readOnly: true,
          controller: TextEditingController(
            text: _selectedDate != null
                ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                : '',
          ),
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choices',
              style: TextStyle(color: Colors.orange.shade900),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: choices.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Choice ${index + 1}',
                          hintStyle: TextStyle(color: Colors.orange.shade900),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange.shade900),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        if (choices.length > 1) {
                          deleteChoice();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  addChoice();
                },
                child: Text('Add Choice',
                    style: TextStyle(color: Colors.orange.shade900)),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Submit poll
          },
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange.shade900,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ActivePolls extends StatefulWidget {
  @override
  _ActivePollsState createState() => _ActivePollsState();
}

class _ActivePollsState extends State<ActivePolls> {
  String? _selectedPollTitle;

  // Sample data for demonstration
  List<Map<String, dynamic>> _polls = [
    {
      'title': 'Poll 1',
      'description': 'Description of Poll 1',
      'expiryDate': '2024-02-20',
      'choices': ['Choice 1', 'Choice 2', 'Choice 3'],
      'selectedChoiceIndex': -1,
    },
    {
      'title': 'Poll 2',
      'description': 'Description of Poll 2',
      'expiryDate': '2024-02-25',
      'choices': ['Option A', 'Option B'],
      'selectedChoiceIndex': -1,
    },
  ];

  void _selectChoice(int pollIndex, int choiceIndex) {
    setState(() {
      _polls[pollIndex]['selectedChoiceIndex'] = choiceIndex;
    });
  }

  void _submitPoll(int pollIndex) {
    // Handle submitting the poll
    print(
        'Poll ${pollIndex + 1} submitted with choice ${_polls[pollIndex]['selectedChoiceIndex']}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _polls.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ExpansionTile(
              title: Text(
                _polls[index]['title'] as String,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.orange),
                      ),
                      SizedBox(height: 5),
                      Text(_polls[index]['description'] as String,
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      SizedBox(height: 10),
                      Text(
                        'Expiry Date:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.orange),
                      ),
                      SizedBox(height: 5),
                      Text(_polls[index]['expiryDate'] as String,
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      SizedBox(height: 10),
                      Text(
                        'Choices:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.orange),
                      ),
                      Column(
                        children: List.generate(
                          _polls[index]['choices'].length,
                          (choiceIndex) {
                            final choice =
                                _polls[index]['choices'][choiceIndex] as String;
                            final isSelected = _polls[index]
                                    ['selectedChoiceIndex'] ==
                                choiceIndex;
                            return GestureDetector(
                              onTap: () => _selectChoice(index, choiceIndex),
                              child: Container(
                                color: isSelected ? Colors.green : Colors.white,
                                child: ListTile(
                                  title: Text(choice),
                                  trailing: isSelected
                                      ? Icon(Icons.check, color: Colors.green)
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _polls[index]['selectedChoiceIndex'] != -1
                            ? () => _submitPoll(index)
                            : null,
                        child: Text('Submit',
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PollStatus extends StatefulWidget {
  @override
  _PollStatusState createState() => _PollStatusState();
}

class _PollStatusState extends State<PollStatus> {
  // Sample data for demonstration
  List<Map<String, dynamic>> _polls = [
    {
      'title': 'Senate',
      'expiryDate': DateTime.now()
          .add(Duration(days: 7)), // Sample expiry date 7 days from now
      'votes': 2,
      'choices': {'Choice 1': 0, 'Choice 2': 1, 'Choice 3': 1},
    },
    {
      'title': 'cordinator',
      'expiryDate':
          DateTime.now().subtract(Duration(days: 2)), // Sample expired poll
      'votes': 1,
      'choices': {'Option A': 1, 'Option B': 0},
    },
  ];

  void _deletePoll(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this poll?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _polls.removeAt(index); // Delete the poll
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _polls.length,
      itemBuilder: (context, index) {
        final poll = _polls[index];
        final bool isExpired = poll['expiryDate'].isBefore(DateTime.now());
        return Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Poll: ${poll['title']}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deletePoll(index),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Status: ${isExpired ? 'Expired' : 'Active'}',
                  style: TextStyle(
                      color: isExpired ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Expiry Date: ${DateFormat('yyyy-MM-dd').format(poll['expiryDate'])}',
                ),
                SizedBox(height: 5),
                Text(
                  'Votes: ${poll['votes']}',
                ),
                SizedBox(height: 5),
                Text(
                  'Choices:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...poll['choices']
                    .entries
                    .map((entry) => Text('${entry.key}: ${entry.value}')),
              ],
            ),
          ),
        );
      },
    );
  }
}
