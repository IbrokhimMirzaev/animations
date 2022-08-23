import 'dart:math';

import 'package:flutter/material.dart';

class AnimationSecond extends StatefulWidget {
  const AnimationSecond({Key? key}) : super(key: key);

  @override
  State<AnimationSecond> createState() => _AnimationSecondState();
}

class _AnimationSecondState extends State<AnimationSecond>
    with TickerProviderStateMixin {
  late AnimationController animationController, alignController;
  late Animation alignAnimation, angle;

  @override
  void initState() {
    alignController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    alignAnimation = Tween(begin: Alignment.bottomLeft, end: Alignment.topRight).animate(alignController);
    angle = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn, reverseCurve: Curves.easeOut));

    // adding status listener
    animationController.addListener(() {setState(() {});});
    alignController.addStatusListener((status) {
    if(status == AnimationStatus.completed){
      animationController.stop();
    }
    });

    animationController.repeat();
    alignController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    alignController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 300,
          height: 300,
          color: Colors.red,
          child: Align(
            alignment: alignAnimation.value,
            child: Transform.rotate(
              angle: angle.value,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
