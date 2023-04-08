import 'package:flutter/material.dart';

import '../../Components/custom_widgets.dart';

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
          draftCard("Table", "1001", "20/04/2023"),
          draftCard("Chair", "2001", "10/04/2023"),
        ],
      ),
    );
  }
}
