import 'package:flutter/material.dart';

class LessonAnimation extends StatefulWidget {
  const LessonAnimation({Key? key}) : super(key: key);

  @override
  State<LessonAnimation> createState() => _LessonAnimationState();
}

class _LessonAnimationState extends State<LessonAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation widthAnimation, alignAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    widthAnimation = Tween(begin: 150.0, end: 300.0).animate(animationController);
    alignAnimation = Tween(begin: Alignment.topLeft, end: Alignment.bottomRight).animate(animationController);

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
        title: const Text("Lesson Animation"),
        centerTitle: true,
      ),
      body: Align(
        alignment: alignAnimation.value,
        child: Container(
          color: Colors.blue,
          width: widthAnimation.value,
          height: 180,
        ),
      ),
    );
  }
}
