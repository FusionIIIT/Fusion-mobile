import 'package:flutter/material.dart';

import '../../Components/custom_widgets.dart';
import '../../models/PurchaseAndStore.dart';

class IdentDraftPage extends StatefulWidget {
  const IdentDraftPage({Key? key}) : super(key: key);

  @override
  State<IdentDraftPage> createState() => _IdentDraftPageState();
}

class _IdentDraftPageState extends State<IdentDraftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Indent Drafts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: customDrawer(),
      body: Column(
        children: [
          buildRecieverDesig(),
          Expanded(
              child: ListView.builder(
                  itemCount: Item.draftItemList.length,
                  itemBuilder: (context, ind) => draftCard(
                      Item.draftItemList[ind].itemName,
                      Item.draftItemList[ind].uniqueId,
                      Item.draftItemList[ind].estimatedCost)))
        ],
      ),
    );
  }
}
