import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class ViewSalary extends StatefulWidget {
  const ViewSalary({Key? key}) : super(key: key);

  @override
  State<ViewSalary> createState() => _ViewSalaryState();
}

class _ViewSalaryState extends State<ViewSalary> {
  TextEditingController _monthController=TextEditingController();

  TextEditingController _yearController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [ Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                // month
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Month",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _monthController,
                  decoration: InputDecoration(
                    hintText: "Month",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // year
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Year",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _yearController,
                  decoration: InputDecoration(
                    hintText: "Year",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child:SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 1,color: Colors.white,),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                        onPressed: (){},
                        child: Text('print',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    )
                )
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
