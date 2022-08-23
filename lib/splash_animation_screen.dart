import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreenAnimation extends StatefulWidget {
  const SplashScreenAnimation({Key? key}) : super(key: key);

  @override
  State<SplashScreenAnimation> createState() => _SplashScreenAnimationState();
}

class _SplashScreenAnimationState extends State<SplashScreenAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animationController.addListener(() {setState(() {});});
    animationController.forward();
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
      body: Center(
        child: Transform.rotate(
          angle: Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController).value,
          child: AnimatedContainer(
            duration: const Duration(seconds: 3),
            curve: Curves.bounceInOut,
            color: Colors.blue.shade100,
            padding: const EdgeInsets.all(15),
            width: (!animationController.isCompleted) ? 150 : MediaQuery.of(context).size.width,
            height: (!animationController.isCompleted) ? 150 : MediaQuery.of(context).size.height,
            child: const FlutterLogo(size: 100),
          ),
        ),
      )
    );
  }
}
