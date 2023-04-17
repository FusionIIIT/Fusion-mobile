import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isFilled,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? text;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                isFilled ? MaterialStateProperty.all(kPrimaryColor) : null),
            onPressed: onPressed,
            child: Text(
              '$text',
              style: TextStyle(
                color: isFilled ? Colors.white : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}