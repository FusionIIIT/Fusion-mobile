import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableText({required this.text, this.maxLines = 1});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isLongText = widget.text.length > 30;

    return InkWell(
      onTap: () {
        if (isLongText) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(''),
                content: Text(widget.text),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: Text.rich(
        TextSpan(
          text: _isExpanded || !isLongText
              ? widget.text
              : widget.text.substring(0, 30),
          children: <TextSpan>[
            TextSpan(
              text: isLongText ? '...' : '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        maxLines: _isExpanded ? null : widget.maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
