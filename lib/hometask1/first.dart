import 'dart:math';

import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation<double> animation1, animation2;

  @override
  void initState() {
    animationController1 = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController2 = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    animationController2.addListener(() {setState(() {});});
    animationController1.addListener(() {setState(() {});});

    animation1 = Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController1);
    animation2 = Tween<double>(begin: 2 * pi, end: 0.0).animate(animationController2);

    animationController1.forward();
    animationController2.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.rotate(
              angle: animation1.value,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                ),
              ),
            ),
            Transform.rotate(
              angle: animation2.value,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
