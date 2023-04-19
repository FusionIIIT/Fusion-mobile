import '../../Components/custom_widgets.dart';
import 'package:flutter/material.dart';

import '../../models/PurchaseAndStore.dart';

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
          // filedIndents("Table", "1001", "20/04/2023"),
          // filedIndents("Chair", "2001", "10/04/2023"),
          Expanded(
              child: ListView.builder(
                  itemCount: Item.draftItemList.length,
                  itemBuilder: (context, ind) => filedIndents(
                      Item.draftItemList[ind].itemName,
                      Item.draftItemList[ind].uniqueId,
                      Item.draftItemList[ind].estimatedCost)))
        ],
      ),
    );
  }
}
