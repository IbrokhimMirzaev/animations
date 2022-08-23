import 'package:flutter/material.dart';

class FifthPart2 extends StatefulWidget {
  const FifthPart2({Key? key}) : super(key: key);

  @override
  State<FifthPart2> createState() => _FifthPart2State();
}

class _FifthPart2State extends State<FifthPart2> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Woolha.com')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
              child: AnimatedSize(
                duration: const Duration(seconds: 2),
                child: Container(
                  width: selected ? 350 : 200,
                  height: selected ? 350 : 200,
                  color: const Color(0xFF0090AA),
                  child: Center(
                    child: Text(
                      "Woolha",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: selected ? 80 : 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  selected = !selected;
                  setState(() {});
                },
                child: const Text("Change size"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
