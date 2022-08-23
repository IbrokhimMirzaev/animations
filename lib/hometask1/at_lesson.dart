import 'package:flutter/material.dart';

class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> with SingleTickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(60),
      boxShadow: const [
        BoxShadow(
          blurRadius: 30,
          offset: Offset(1, 3),
          color: Colors.black54,
        )
      ],
    ),
    end: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(1, 3),
            color: Colors.grey.shade500,
          )
        ]),
  );

  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(animationController),
          child: const SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: FlutterLogo(size: 100),
            ),
          ),
        ),
      ),
    );
  }
}
