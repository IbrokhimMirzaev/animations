import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[300],
        ),
        onPressed: onPressed,
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
