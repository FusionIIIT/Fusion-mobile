import 'package:flutter/material.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/application_data_provider.dart';
import 'package:provider/provider.dart';

class ViewApplicationStatus extends StatelessWidget {
  const ViewApplicationStatus({super.key});

  @override
  Widget build(BuildContext context) {

    final submittedapplications =
        context.watch<ApplicationDataProvider>().submittedapplications;
    
    return Scaffold(
      appBar: AppBar(title: Text('Application Status',),backgroundColor: Colors.deepOrangeAccent,),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: submittedapplications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
         leading: const Icon(Icons.list),
         trailing: Text(
              'Under Process',
           style: TextStyle(color: Colors.green, fontSize: 15),
         ),
         title: Row(
           children: [
         
            Text(submittedapplications[index]['type']),

           ],
         ));
        }),
    );
 
  }
}
