import 'package:flutter/material.dart';


class CardListTile extends StatelessWidget {
    final IconData iconData;
    final String label;
    final String value;
    final Color color;
    const CardListTile({
      required this.iconData,
      required this.label,
      required this.value,
      required this.color,
    });
  
    @override
    Widget build(BuildContext context) {
      return ListTile(
        leading: Icon(iconData),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(label),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(value),
              ),
            ),
          ],
        ),
        tileColor: color,
      );
    }
}
  