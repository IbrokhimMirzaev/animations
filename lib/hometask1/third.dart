import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation widthAnimation;
  late Animation heightAnimation;
  late Animation borderAnimation;

  int _index = 0;

  var heights = [50.0, 210.0, 140.0, 100.0, 180.0, 250.0, 300.0, 370.0, 100.0, 50.0, 220.0, 200.0, 50.0];
  var widths = [50.0, 30.0, 63.0, 280.0, 180.0, 85.0, 90.0, 150.0, 220.0, 100.0, 300.0, 130.0, 50.0];
  var borders = [5.0, 30.0, 35.0, 55.0, 25.0, 28.0, 55.0, 45.0, 55.0, 55.0, 15.0, 60.0, 5.0];
  var colors = const [
    Color(0xFF439C4C),
    Color(0xFF3E20A6),
    Color(0xFF109AC9),
    Color(0xFFA0B42F),
    Color(0xFF0079A4),
    Color(0xFFAF99E4),
    Color(0xFF23814F),
    Color(0xFFD2ECAD),
    Color(0xFF3860F5),
    Color(0xFFA47BE5),
    Color(0xFFEE5D0E),
    Color(0xFF2F443B),
    Color(0xFF439C4C),
  ];

  @override
  void initState() {
    _init(_index);
    super.initState();
  }

  void _init(int index) {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    colorAnimation = ColorTween(begin: colors[index], end: colors[index + 1]).animate(animationController);
    heightAnimation = Tween(begin: heights[index], end: heights[index + 1]).animate(animationController);
    widthAnimation = Tween(begin: widths[index], end: widths[index + 1]).animate(animationController);
    borderAnimation = Tween(begin: borders[index], end: borders[index + 1]).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
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
        title: const Text("Third"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _init(_index);
          _index += 1;
          animationController.forward();

          if (_index == heights.length - 1){
            _index = 0;
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Container(
          width: widthAnimation.value,
          height: heightAnimation.value,
          decoration: BoxDecoration(
              color: colorAnimation.value,
              borderRadius: BorderRadius.circular(borderAnimation.value)),
        ),
      ),
    );
  }
}
