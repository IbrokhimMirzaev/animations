import 'package:flutter/material.dart';

class ThirdPart3 extends StatefulWidget {
  const ThirdPart3({Key? key}) : super(key: key);

  @override
  State<ThirdPart3> createState() => _ThirdPart3State();
}

class _ThirdPart3State extends State<ThirdPart3> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late DecorationTween decorationAnimation;
  bool selected = false;

  List<Decoration> decorations = [
    BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 4),
        boxShadow: [
          BoxShadow(
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(1, 3),
            color: Colors.grey.shade400,
          )
        ]),
    BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)),
  ];

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    decorationAnimation = DecorationTween(begin: decorations[0], end: decorations[1]);
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
        title: const Text("DecoratedBox Transition"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBoxTransition(
              decoration: decorationAnimation.animate(animationController),
              child: Container(
                key: UniqueKey(),
                width: 200,
                height: 200,
                child: const Center(
                  child: FlutterLogo(size: 150),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                selected = !selected;
                (selected) ? animationController.forward() : animationController.reverse();
              },
              child: const Text("Click me!"),
            ),
          ],
        ),
      ),
    );
  }
}
