import 'package:animations/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> with SingleTickerProviderStateMixin {
  double bottom = 0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: left,
                    bottom: bottom,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ButtonElevated(
                    onPressed: () {
                      if (bottom + 100 <= MediaQuery.of(context).size.height * 0.65){
                        bottom += 30;
                        setState(() {});
                      }
                    },
                    iconData: Icons.arrow_drop_up,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonElevated(
                        onPressed: () {
                          if (left != 0){
                            left -= 30;
                            setState(() {});
                          }
                        },
                        iconData: Icons.arrow_left,
                      ),
                      const SizedBox(width: 100),
                      ButtonElevated(
                        onPressed: () {
                          if (left + 130 <= MediaQuery.of(context).size.width){
                            left += 30;
                            setState(() {});
                          }
                        },
                        iconData: Icons.arrow_right,
                      ),
                    ],
                  ),
                  ButtonElevated(
                    onPressed: () {
                      if (bottom != 0){
                        bottom -= 30;
                        setState(() {});
                      }
                    },
                    iconData: Icons.arrow_drop_down,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
