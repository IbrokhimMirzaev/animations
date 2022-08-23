import 'package:flutter/material.dart';

class FirstPart3 extends StatefulWidget {
  const FirstPart3({Key? key}) : super(key: key);

  @override
  State<FirstPart3> createState() => _FirstPart3State();
}

class _FirstPart3State extends State<FirstPart3> {
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Switcher"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1400),
              child: (!onPressed)
                  ? Container(
                      key: UniqueKey(),
                      width: 300,
                      height: 300,
                      color: const Color(0xFFFB9600),
                      child: const Center(
                        child: Text("This is First Widget"),
                      ),
                    )
                  : Container(
                      key: UniqueKey(),
                      width: 300,
                      height: 300,
                      color: const Color(0xFF4BAD4F),
                      child: const Center(
                        child: Text("This is Second Widget"),
                      ),
                    ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  onPressed = !onPressed;
                });
              },
              style: ElevatedButton.styleFrom(primary: Colors.grey.shade400),
              child: const Text("Click here"),
            )
          ],
        ),
      ),
    );
  }
}
