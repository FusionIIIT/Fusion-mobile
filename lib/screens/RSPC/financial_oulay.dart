import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';



class outlay extends StatefulWidget {
  final int index;
  const outlay({Key? key, required this.index}) : super(key: key);

  @override
  State<outlay> createState() => _outlayState();
}

class _outlayState extends State<outlay> {
   var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
 
  late Future<Map<String, dynamic>> _futureData = Future.value({});
  List<int> years = [];
  Map<int, Map<String, List<Map<String, dynamic>>>> yearWiseCategoryData = {};
  int? selectedYear;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var storage_service = locator<StorageService>();
      if (storage_service.userInDB?.token == null) {
        throw Exception('Token Error');
      }
      Map<String, String> headers = {
          // 'Authorization' : 'Token'+(' c1c9f84430ef95a67e8a192962044dcf73a3677f')
           'Authorization' : 'Token '+(storage_service.userInDB?.token??"")
      };
      var index1 = widget.index;
      http.Response response = await http.get(
        Uri.http("172.27.16.214:8000",
            "research_procedures/api/view_financial_outlay/$index1"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final data = jsonData['category_data'];
        setState(() {
          years = List<int>.from(jsonData['years']);
          for (var year in years) {
            yearWiseCategoryData[year] = {};
          }

          // Organize category data by year
          for (var categoryData in data.entries) {
            for (var item in categoryData.value) {
              final year = item['year'];
              if (years.contains(year)) {
                if (!yearWiseCategoryData.containsKey(year)) {
                  yearWiseCategoryData[year] = {};
                }
                final category = item['category'];
                if (!yearWiseCategoryData[year]!.containsKey(category)) {
                  yearWiseCategoryData[year]![category] = [];
                }
                yearWiseCategoryData[year]![category]!.add(item);
              }
            }
          }
        });
      } else {
        print(response.statusCode);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Research Module",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),

      body: SingleChildScrollView(
        // Wrap your Column in a SingleChildScrollView
        child: Center(
          child: years.isEmpty
              ? CircularProgressIndicator()
              : Column(
                 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 225, 225),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<int>(
                        hint: Text('Select outlay of particular year'),
                        value: selectedYear,
                        onChanged: (int? year) {
                          setState(() {
                            selectedYear = year;
                          });
                        },
                        underline: Container(
                          // Custom underline to remove the default underline
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey), // Border color and width
                              borderRadius: BorderRadius.circular(
                                  4.0), // Optional: add some border radius
                            ),
                          ),
                        ),
                        items: years.map<DropdownMenuItem<int>>((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Center(child: Text(year.toString())),
                            
                          );
                        }).toList(),
                        style: TextStyle(
                          // Optional: Customize the text style
                          fontSize: 16.0, // Font size
                          color: Colors.black87, // Text color
                        ),
                        iconSize: 30.0, // Optional: Adjust icon size
                      ),
                    ),
                    SizedBox(height: 20),
                    if (selectedYear != null)
                      SingleChildScrollView(
                        child: ListView(
                          // Remove the Expanded around your ListView
                          shrinkWrap: true, // Add shrinkWrap: true
                          children: [
                            for (var categoryData
                                in yearWiseCategoryData[selectedYear]!.entries)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      categoryData.key,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: categoryData.value.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final item = categoryData.value[index];
                                      return Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Project_id: ${item['project_id']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Category: ${item['category']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Sub-category: ${item['sub_category']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Amount: ${item['amount']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Year: ${item['year']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'staff_limit: ${item['staff_limit']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Utilized amount: ${item['utilized_amount']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }

//   void _showSubCategoriesDialog(String category) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(category),
//           content: categoryData[category]?.isEmpty ?? true
//               ? Text('No sub-categories available')
//               : ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: categoryData[category]!.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final item = categoryData[category]![index];
//                     return ListTile(
//                       title: Text(item['sub_category']),
//                       subtitle: Text('Amount: ${item['amount']}'),
//                     );
//                   },
//                 ),
//         );
//       },
//     );
//   }
// }
}
