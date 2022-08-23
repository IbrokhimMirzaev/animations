import 'dart:math';

import 'package:flutter/material.dart';

class Sixth extends StatefulWidget {
  const Sixth({Key? key}) : super(key: key);

  @override
  State<Sixth> createState() => _SixthState();
}

class _SixthState extends State<Sixth> with TickerProviderStateMixin{

  late AnimationController animationController1, animationController2;
  late Animation animation1, animation2;

  @override
  void initState() {
    animationController1 = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController2 = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation1 = Tween(begin: 0.0, end: 2 * pi).animate(animationController1);
    animation2 = Tween(begin: 2 * pi, end: 1).animate(animationController2);

    animationController1.addListener(() {setState(() {});});
    animationController2.addListener(() {setState(() {});});

    animationController1.repeat(reverse: true);
    animationController2.repeat(reverse: true);

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
        title: const Text("Sixth"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.rotate(
              angle: animation1.value,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.green,
              ),
            ),
            Transform.rotate(
              angle: animation2.value,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
