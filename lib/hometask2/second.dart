import 'package:flutter/material.dart';

class SecondPart2 extends StatefulWidget {
  const SecondPart2({Key? key}) : super(key: key);

  @override
  State<SecondPart2> createState() => _SecondPart2State();
}

class _SecondPart2State extends State<SecondPart2> {
  Color _color = Colors.blue;
  double _fontSize = 25;
  FontWeight _fontWeight = FontWeight.w400;
  FontStyle _fontStyle = FontStyle.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedDefaultTextStyles"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 1),
              style: TextStyle(
                color: _color,
                fontSize: _fontSize,
                fontWeight: _fontWeight,
                fontStyle: _fontStyle,
              ),
              textAlign: TextAlign.center,
              child: const Text("Hello Flutter World!"),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _color = Colors.red;
                      _fontSize = 60;
                      _fontWeight = FontWeight.w700;
                      _fontStyle = FontStyle.italic;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _color = Colors.blue;
                      _fontSize = 25;
                      _fontWeight = FontWeight.w400;
                      _fontStyle = FontStyle.normal;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.settings_backup_restore,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
