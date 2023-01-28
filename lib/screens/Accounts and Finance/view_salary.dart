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
                      borderRadius: BorderRadius.circular(32.0),
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
                  controller: _monthController,
                  decoration: InputDecoration(
                    hintText: "Year",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child:TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                      ),
                      onPressed: (){},
                      child: Text('print'),
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
