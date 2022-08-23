import 'dart:math';

import 'package:flutter/material.dart';

class FourthPart3 extends StatefulWidget {
  const FourthPart3({Key? key}) : super(key: key);

  @override
  State<FourthPart3> createState() => _FourthPart3State();
}

class _FourthPart3State extends State<FourthPart3> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation widthAnimation, countAnimation, colorAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    widthAnimation = Tween(begin: 0.0, end: 350.0).animate(animationController);
    countAnimation = Tween(begin: 0.0, end: 100.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.black).animate(animationController);
    animationController.addListener(() {setState(() {});});
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int percent = (countAnimation.value).toInt();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundColor: colorAnimation.value),
            const SizedBox(height: 30),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 35,
                  color: Colors.blue.shade100,
                ),
                Container(
                  width: widthAnimation.value,
                  height: 35,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              (percent == 100) ? "Done" : "$percent %",
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  animationController.reset();
                  animationController.forward();
                });
              },
              child: const Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}
