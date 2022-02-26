import 'package:flutter/material.dart';

class TabBarChildrenWithTextButton extends StatelessWidget {
  const TabBarChildrenWithTextButton({
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
