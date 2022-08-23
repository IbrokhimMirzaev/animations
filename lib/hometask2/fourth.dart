import 'package:flutter/material.dart';

class FourthPart2 extends StatefulWidget {
  const FourthPart2({Key? key}) : super(key: key);

  @override
  State<FourthPart2> createState() => _FourthPart2State();
}

class _FourthPart2State extends State<FourthPart2> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Changing Alignment Animation"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.blue.shade100,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 2500),
                alignment: selected ? Alignment.bottomRight : Alignment.topLeft,
                curve: Curves.bounceInOut,
                child: Container(
                  color: Colors.green,
                  child: const Text(
                    "Woolha.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                selected = !selected;
                setState(() {});
              },
              child: const Text("Change Alignment"),
            ),
          ],
        ),
      ),
    );
  }
}
