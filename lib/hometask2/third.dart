import 'package:flutter/material.dart';

class ThirdPart2 extends StatefulWidget {
  const ThirdPart2({Key? key}) : super(key: key);

  @override
  State<ThirdPart2> createState() => _ThirdPart2State();
}

class _ThirdPart2State extends State<ThirdPart2> {
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Opacity Demo")),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _opacity,
          child: Container(
            width: 250,
            height: 250,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _opacity = (_opacity == 1) ? 0 : 1;
          setState(() {});
        },
        child: const Icon(Icons.opacity),
      ),
    );
  }
}
