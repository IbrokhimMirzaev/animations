import 'package:flutter/material.dart';

class Fifth extends StatefulWidget {
  const Fifth({Key? key}) : super(key: key);

  @override
  State<Fifth> createState() => _FifthState();
}

class _FifthState extends State<Fifth> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation borderColorAnimation;
  late Animation borderSizeAnimation;
  late Animation borderWidthAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.blue).animate(animationController);
    borderColorAnimation = ColorTween(begin: Colors.black, end: Colors.red).animate(animationController);
    borderSizeAnimation = Tween(begin: 150.0, end: 30.0).animate(animationController);
    borderWidthAnimation = Tween(begin: 2.0, end: 30.0).animate(animationController);

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
        title: const Text("Fifth"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(borderSizeAnimation.value),
            border: Border.all(
              color: borderColorAnimation.value,
              width: borderWidthAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}
