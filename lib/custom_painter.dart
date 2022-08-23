import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Painter: drawCircle")),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: CustomPaint(
            size: const Size(300, 300),
            painter: MyPainter(),
          )
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.green;

    canvas.drawCircle(const Offset(150, 150), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
