import 'package:flutter/material.dart';

class FirstPart2 extends StatefulWidget {
  const FirstPart2({Key? key}) : super(key: key);

  @override
  State<FirstPart2> createState() => _FirstPart2State();
}

class _FirstPart2State extends State<FirstPart2> {
  double padding = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First (Part 2)"),
        centerTitle: true,
      ),
      body: AnimatedPadding(
        duration: const Duration(seconds: 1),
        padding: EdgeInsets.all(padding),
        child: Center(
          child: GestureDetector(
            onTap: () {
              padding = (padding == 15) ? 100 : 15;
              setState(() {});
            },
            child: Container(
              height: 150,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
