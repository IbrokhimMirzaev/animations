import 'package:flutter/material.dart';

class EightsPart2 extends StatefulWidget {
  const EightsPart2({Key? key}) : super(key: key);

  @override
  State<EightsPart2> createState() => _EightsPart2State();
}

class _EightsPart2State extends State<EightsPart2> {
  bool onTap = false;
  bool firstVisibility = true;
  bool secondVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: (onTap) ? Alignment.bottomRight : Alignment.topLeft,
              child: GestureDetector(
                onTap: () async {
                  onTap = !onTap;
                  secondVisibility = false;
                  setState(() {});
                  await Future.delayed(const Duration(seconds: 1));
                  secondVisibility = true;
                  setState(() {});
                },
                child: Visibility(
                  visible: firstVisibility,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    color: Colors.blue,
                    width: (onTap) ? 200 : 130,
                    height: 130,
                  ),
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: (onTap) ? Alignment.topLeft : Alignment.bottomRight,
              child: GestureDetector(
                onTap: () async {
                  onTap = !onTap;
                  firstVisibility = false;
                  setState(() {});
                  await Future.delayed(const Duration(seconds: 1));
                  firstVisibility = true;
                  setState(() {});
                },
                child: Visibility(
                  visible: secondVisibility,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    color: Colors.blue,
                    width: (onTap) ? 130 : 200,
                    height: 130,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
