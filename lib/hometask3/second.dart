import 'dart:math';

import 'package:flutter/material.dart';

class SecondPart3 extends StatefulWidget {
  const SecondPart3({Key? key}) : super(key: key);

  @override
  State<SecondPart3> createState() => _SecondPart3State();
}

class _SecondPart3State extends State<SecondPart3>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation, sizeAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0.0, end: pi).animate(animationController);
    sizeAnimation = Tween<double>(begin: 40, end: 200).animate(animationController);
    animationController.addListener(() {setState(() {});});
    animationController.repeat(reverse: true);
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
        title: const Text("Custom Loading Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
