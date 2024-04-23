import 'package:flutter/material.dart';

class BrowseApplications extends StatefulWidget {
  const BrowseApplications({super.key});

  @override
  State<BrowseApplications> createState() => _BrowseApplicationsState();
}

class _BrowseApplicationsState extends State<BrowseApplications> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Applications',
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing: Text(
                  'Review',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Row(
                  children: [
                    Text("213432"),
                  ],
                ));
          }),
    );
  }
}
