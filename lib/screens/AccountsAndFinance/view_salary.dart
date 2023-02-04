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
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Container(
        child: ListView(
          children: [ Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                // month
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,top: 10.0),
                  child: Text("Month",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _monthController,
                  decoration: InputDecoration(
                    hintText: "January",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // year
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 10),
                  child: Text("Year :",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _monthController,
                  decoration: InputDecoration(
                    hintText: "2023",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Center(
                    child:TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: (){},
                      child: Text("Print", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    )
                )
              ],
            ),
          ),
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shadowColor: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, 'account_finance/department');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Department',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(
                            context, 'account_finance/bank_detail');
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bank Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, 'account_finance/view_salary');
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View Salary',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                ],
              ),
            ),],
        ),
      ),
    );
  }
}