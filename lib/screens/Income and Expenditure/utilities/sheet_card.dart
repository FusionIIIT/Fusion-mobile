import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';

class HelpCard extends StatelessWidget {
  String title;
  String buttonText;
  final Function onTap;

  HelpCard(
      {Key? key,
      required this.buttonText,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Row(children: [
                    Text(DateTime.now().year.toString(), style: TextStyle()),
                    Icon(Icons.arrow_drop_down)
                  ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () => onTap, child: Text(buttonText))
              ],
            )
          ],
      ),
    ),
        ));
  }
}
