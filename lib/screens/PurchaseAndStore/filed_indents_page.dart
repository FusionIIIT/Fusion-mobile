import '../../Components/custom_widgets.dart';
import 'package:flutter/material.dart';

class AllFiledIndents extends StatefulWidget {
  const AllFiledIndents({Key? key}) : super(key: key);

  @override
  State<AllFiledIndents> createState() => _AllFiledIndentsState();
}

class _AllFiledIndentsState extends State<AllFiledIndents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Filed Indents",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: customDrawer(),
      body: Column(
        children: [
          buildRecieverDesig(),
          filedIndents("Table", "1001", "20/04/2023"),
          filedIndents("Chair", "2001", "10/04/2023"),
        ],
      ),
    );
  }
}
