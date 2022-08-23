import 'package:flutter/material.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
