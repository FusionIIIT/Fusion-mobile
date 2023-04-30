import 'package:flutter/material.dart';

class MessTable extends StatelessWidget {
  const MessTable({Key? key, required this.head, required this.body,this.child}) : super(key: key);
  final List<List<String>> head;
  final List<List<String>> body;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [..._buildHeading(head),..._buildRows(body,child)]
      ),
    );
  }
}


List<Widget> _buildCells(List<String> val) {
  return List.generate(
    val.length,
        (index) => Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.white,
      margin: EdgeInsets.all(4.0),
      child: Text(val[index]),
    ),
  );
}

List<Widget> _buildRows(List<List<String>> items,Widget? child) {

  return List.generate(
    items.length,
        (index) => Row(
      children: [..._buildCells(items[index]),
        child??Container(),],
    ),
  );
}

List<Widget> _buildHeading(List<List<String>> items) {
  return List.generate(
    items.length,
        (index) => Row(
      children: _buildCells(items[index]),
    ),
  );
}

class RespondButton extends StatelessWidget {
  const RespondButton({Key? key, required this.val, required this.color,required this.onclick}) : super(key: key);
  final String val;
  final Color color;
  final void Function() onclick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 25.0,
        color: color,
        margin: EdgeInsets.all(4.0),
        child: Text(val),
      ),
    );
  }
}