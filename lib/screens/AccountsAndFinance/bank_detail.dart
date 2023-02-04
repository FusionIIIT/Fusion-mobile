import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class BankDetail extends StatefulWidget {
  const BankDetail({Key? key}) : super(key: key);

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  TextEditingController _accountController=TextEditingController();
  TextEditingController _ifscController=TextEditingController();
  TextEditingController _bankNameController=TextEditingController();
  TextEditingController _branchNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Container(
        child: ListView(
          children:[ Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                // month
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                  child: Text("Account No.:",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _accountController,
                  decoration: InputDecoration(
                    hintText: "Account No.",
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

                // Bank Name
                Padding(
                  padding: const EdgeInsets.only(left: 5,top: 10),
                  child: Text("Bank Name :",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _bankNameController,
                  decoration: InputDecoration(
                    hintText: "e.g. SBI",
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

                // IFSC
                Padding(
                  padding: const EdgeInsets.only(left: 5,top: 10),
                  child: Text("IFSC :",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _ifscController,
                  decoration: InputDecoration(
                    hintText: "IFSC code",
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

                // Branch Name
                Padding(
                  padding: const EdgeInsets.only(left: 5,top: 10),
                  child: Text("Branch Name :",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _branchNameController,
                  decoration: InputDecoration(
                    hintText: "",
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

                // submit button
                Center(
                    child:TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,

                      ),
                      onPressed: (){},
                      child: Text('submit', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                    )
                )
                ,
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
          ],
        ),
      ),
    );
  }
}