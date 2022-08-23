import 'package:flutter/material.dart';

class SixthPart2 extends StatefulWidget {
  const SixthPart2({Key? key}) : super(key: key);

  @override
  State<SixthPart2> createState() => _SixthPart2State();
}

class _SixthPart2State extends State<SixthPart2> {
  double _fontSize = 14;
  String text = "Bigger font";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bigger Font")),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          children: [
            AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: _fontSize,
                color: Colors.black,
              ),
              duration: const Duration(seconds: 1),
              child: const Text("Hello! Welcome to TutorialKart. This is a basic demonstration of animation in Flutter"),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_fontSize == 14){
                    _fontSize = 50;
                    text = "Smaller Font";
                  }
                  else {
                    _fontSize = 14;
                    text = "Bigger Font";
                  }
                  setState(() {});
                },
                child: Text(text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
