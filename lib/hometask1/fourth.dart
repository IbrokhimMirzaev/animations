import 'dart:math';

import 'package:flutter/material.dart';

class Fourth extends StatefulWidget {
  const Fourth({Key? key}) : super(key: key);

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController);
    animationController.addListener(() {setState(() {});});
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth"),
        centerTitle: true,
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(
            height: 220,
            width: 220,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
