import 'package:flutter/material.dart';

class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation borderSizeAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.green).animate(animationController);
    sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(animationController);
    borderSizeAnimation = Tween(begin: 70.0, end: 40.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

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
        title: const Text("Animations"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(borderSizeAnimation.value),
          ),
        ),
      ),
    );
  }
}
