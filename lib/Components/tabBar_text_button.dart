import 'package:flutter/material.dart';

class TabBarTextButton extends StatelessWidget {
  const TabBarTextButton({
    Key? key,
    this.label = "",
    this.onPressed,
  }) : super(key: key);
  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: onPressed,
          child: Text('$label'),
        ),
      ),
    );
  }
}
