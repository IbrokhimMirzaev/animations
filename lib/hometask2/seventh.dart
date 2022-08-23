import 'package:flutter/material.dart';

class SeventhPart2 extends StatefulWidget {
  const SeventhPart2({Key? key}) : super(key: key);

  @override
  State<SeventhPart2> createState() => _SeventhPart2State();
}

class _SeventhPart2State extends State<SeventhPart2>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation1, colorAnimation2, sizeAnimation2;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    colorAnimation1 = ColorTween(begin: const Color(0xFFF3542C), end: const Color(0xFFF89305)).animate(animationController);
    colorAnimation2 = ColorTween(begin: const Color(0xFFB25393), end: const Color(0xFFF9E143)).animate(animationController);

    sizeAnimation2 = Tween(begin: 170.0, end: 270.0).animate(animationController);

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
      appBar: AppBar(title: const Text("Circle Animation")),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 280,
              height: 280,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorAnimation1.value,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(5, 5),
                    spreadRadius: 3,
                    color: Colors.black,
                  )
                ]
              ),
            ),
          ),
          Center(
            child: Container(
              width: sizeAnimation2.value,
              height: sizeAnimation2.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorAnimation2.value,
              ),
            ),
          )
        ],
      ),
    );
  }
}
