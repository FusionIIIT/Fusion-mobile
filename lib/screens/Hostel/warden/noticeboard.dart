
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/side_drawer.dart';

class Notice {
  final String headline;
  final String description;
  final DateTime date;

  Notice(this.headline, this.description, this.date);
}


class Noticeboard extends StatefulWidget {
  const Noticeboard({Key? key}) : super(key: key);

  @override
  _NoticeboardState createState() => _NoticeboardState();
}

class _NoticeboardState extends State<Noticeboard> {

  List<Notice> notices = []; // Define the 'notices' list

  @override
  void initState() {
    super.initState();
    // Populate with sample notice boards
    _populateNoticeBoards();
  }

  // Method to populate sample notice boards
  void _populateNoticeBoards() {
    // Sample notice board 1
    notices.add(
      Notice(
        'Important Announcement',
        'All students are hereby informed that using Alcohol,Cigaretts andElectical Items are prohibited in hostels.If found heavy fine will be imposed.',
        DateTime(2024, 4, 22),
      ),
    );

    // Sample notice board 2
    notices.add(
      Notice(
        'Republic Day 2k24',
        'As you all are aware today is Republic day,so interested students can attend the flag hosting infront of hostel which will be starting at 8:00am.',
        DateTime(2024, 1, 26),
      ),
    );

    // Notify the UI about the changes
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Notice Board'),

        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 20),
                    color: Color.fromARGB(255, 255, 229, 218),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color.fromARGB(255, 245, 103, 47),
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notices[index].headline,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${notices[index].date.day}/${notices[index].date.month}/${notices[index].date.year}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            notices[index].description,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Handle file upload logic here
                            },
                            child: Text('View Uploaded File'),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                // Remove notice board logic here
                                setState(() {
                                  notices.removeAt(index);
                                });
                              },
                              child: Text('Remove Notice'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // Display dialog to add a new notice
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String headline = '';
              String description = '';

              return AlertDialog(
                title: Text('Add New Notice'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Headline',
                      ),
                      onChanged: (value) {
                        headline = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle file upload logic here
                      },
                      child: Text('Upload File'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add new notice logic here
                      setState(() {
                        notices.add(Notice(headline, description, DateTime.now()));
                      });
                      // Invoke sample POST API
                      // _invokePostAPI(headline, description, file);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
    );
  }

  // Method to invoke a POST API
  void _invokePostAPI(String headline, String description, String file) {
    // Your implementation to invoke POST API
    // Example: http.post(url, body: {'headline': headline, 'description': description, 'file': file});
  }

}
