import 'package:flutter/material.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fusion/services/pdf_service.dart';

class ViewMenu extends StatefulWidget {

  final Map<String, dynamic> userMessData;
  final String? user;
  ViewMenu({required this.userMessData, required this.user});

  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  CentralMessService _centralMessService = CentralMessService();
  PdfService _pdfService = PdfService();

  bool _loadDish = false;
  // Map<String, dynamic> umd = widget.userMessData;
  // String? s = widget.user;
  String? selectedMess = "mess1", selectedDay, selectedMeal;

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

  List<MessMenu> _menuItems = [];


  @override
  void initState() {
    super.initState();
    _fetchMenuData();
  }


  void _fetchMenuData() async {
    try {
      List<MessMenu> menuItems = await _centralMessService.getMenu();
      setState(() {
        _menuItems = menuItems.reversed.toList();
        _loadDish = true;
      });
      print('Received the menu');
    } catch (e) {
      print('Error fetching menu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    const double columnWidth1 = 80.0, columnWidth2 = 100.0;
    late final pw.Widget customWidget = pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 15.0),
        pw.Center(
          child: pw.Text(selectedMess == "mess1" ? "Mess 1" : "Mess 2", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),),
        ),
        pw.SizedBox(height: 30.0),
        pw.Table(
          border: pw.TableBorder.all(),
          columnWidths: {
            0: pw.FixedColumnWidth(columnWidth1), // Day/Meal column
            1: pw.FixedColumnWidth(columnWidth2), // Breakfast column
            2: pw.FixedColumnWidth(columnWidth2), // Lunch column
            3: pw.FixedColumnWidth(columnWidth2), // Dinner column
          },
          children: [
            pw.TableRow(
              children: [
                pw.Container(
                    alignment: pw.Alignment.center,
                    padding: pw.EdgeInsets.all(5),
                    child: pw.Center(
                      child: pw.Text('Day/Meal', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),),
                    )
                ),
                pw.Container(
                    alignment: pw.Alignment.center,
                    padding: pw.EdgeInsets.all(5),
                    child: pw.Center(
                      child: pw.Text('Breakfast', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),),
                    )
                ),
                pw.Container(
                    alignment: pw.Alignment.center,
                    padding: pw.EdgeInsets.all(5),
                    child: pw.Center(
                      child: pw.Text('Lunch', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),),
                    )
                ),
                pw.Container(
                    alignment: pw.Alignment.center,
                    padding: pw.EdgeInsets.all(5),
                    child: pw.Center(
                      child: pw.Text('Dinner', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),),
                    )
                ),
              ],
            ),
            for (int i = 0; i < 7; i++)
              pw.TableRow(
                children: [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    padding: pw.EdgeInsets.all(5),
                    child: pw.Center(
                      child: pw.Text(week[i+1]!, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),),
                    ),
                  ),
                  for (int j = 0; j < 3; j++)
                    pw.Container(
                      alignment: pw.Alignment.center,
                      padding: pw.EdgeInsets.all(5),
                      child: pw.Center(
                        child: pw.Text(_menuItems.where( (item) => ( (item.messOption == selectedMess) && (item.mealTime == mat[i][j]) ) ).first.dish, style: pw.TextStyle(fontSize: 12)),
                        // child: Text(mat[i][j]),
                      ),
                    ),
                ],
              ),
          ],
        )
      ],
    );

    final _messFormKey = GlobalKey<FormState>();

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
                                  child: Text('Day/Meal', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                )
                            ),
                            TableCell(
                                child: Center(
                                  child: Text('Breakfast', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                )
                            ),
                            TableCell(
                                child: Center(
                                  child: Text('Lunch', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                )
                            ),
                            TableCell(
                                child: Center(
                                  child: Text('Dinner', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                )
                            ),
                          ],
                        ),
                        for (int i = 0; i < 7; i++)
                          TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                  child: Text(week[i+1]!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              for (int j = 0; j < 3; j++)
                                TableCell(
                                  child: Center(
                                    child: Text(_menuItems.where( (item) => ( (item.messOption == selectedMess) && (item.mealTime == mat[i][j]) ) ).first.dish, style: TextStyle(fontSize: 12)),
                                    // child: Text(mat[i][j]),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () async {
                        final data = await _pdfService.generatePdf(customWidget: customWidget, heading: "Central Mess");
                        _pdfService.savePdfFile("Mess-Menu", data);
                      },
                      // onPressed: (){},
                      child: Text('Download as PDF'),
                    ),

                  ],
                ),
              ) : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}