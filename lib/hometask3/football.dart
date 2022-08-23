import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Football extends StatefulWidget {
  const Football({Key? key}) : super(key: key);

  @override
  State<Football> createState() => _FootballState();
}

class _FootballState extends State<Football> with TickerProviderStateMixin {
  late AnimationController animationController, alignController;
  late Animation rotateAnimation, alignAnimation, shadowAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    alignController = AnimationController(vsync: this, duration: const Duration(milliseconds: 495));
    rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(animationController);
    alignAnimation = Tween(begin: Alignment.bottomCenter, end: Alignment.topCenter).animate(alignController);
    shadowAnimation = Tween(begin: 40.0, end: 100.0).animate(alignController);
    animationController.addListener(() {setState(() {});});
    alignController.addListener(() {setState(() {});});
    animationController.repeat();
    alignController.repeat(reverse: true);
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                child: Align(
                  alignment: alignAnimation.value,
                  child: Transform.rotate(
                    angle: rotateAnimation.value,
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset("assets/img.png"),
                    ),
                  ),
                ),
              ),
              Container(
                width: shadowAnimation.value,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black.withOpacity(0.7),
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 400,
            child: Lottie.asset("assets/ball.json", fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
