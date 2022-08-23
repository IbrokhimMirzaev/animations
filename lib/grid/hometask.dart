import 'package:animations/animation_second.dart';
import 'package:animations/hometask1/at_lesson.dart';
import 'package:animations/hometask1/fifth.dart';
import 'package:animations/hometask1/first.dart';
import 'package:animations/hometask1/fourth.dart';
import 'package:animations/hometask1/second.dart';
import 'package:animations/hometask1/sixth.dart';
import 'package:animations/hometask1/third.dart';
import 'package:animations/hometask2/eights.dart';
import 'package:animations/hometask2/fifth.dart';
import 'package:animations/hometask2/first.dart';
import 'package:animations/hometask2/fourth.dart';
import 'package:animations/hometask2/lesson_animation.dart';
import 'package:animations/hometask2/second.dart';
import 'package:animations/hometask2/seventh.dart';
import 'package:animations/hometask2/sixth.dart';
import 'package:animations/hometask2/third.dart';
import 'package:animations/hometask3/fifth.dart';
import 'package:animations/hometask3/first.dart';
import 'package:animations/hometask3/football.dart';
import 'package:animations/hometask3/fourth.dart';
import 'package:animations/hometask3/second.dart';
import 'package:animations/hometask3/third.dart';
import 'package:animations/splash_animation_screen.dart';
import 'package:flutter/material.dart';

class HomeTask extends StatefulWidget {
  const HomeTask({Key? key}) : super(key: key);

  @override
  State<HomeTask> createState() => _HomeTaskState();
}

class _HomeTaskState extends State<HomeTask> with TickerProviderStateMixin {

  List screens = const [
    First(), Second(), Third(), Fourth(), Fifth(), Sixth(),
    Lesson(),
    FirstPart2(), SecondPart2(), ThirdPart2(), FourthPart2(), FifthPart2(), SixthPart2(), SeventhPart2(), EightsPart2(),
    LessonAnimation(),
    SplashScreenAnimation(),
    AnimationSecond(),
    FirstPart3(), SecondPart3(), ThirdPart3(), FourthPart3(), FifthPart3(),
    Football(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
        centerTitle: true,
      ),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        children: List.generate(
          screens.length,
          (index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 5,
                  offset: const Offset(1, 3),
                  color: Colors.grey.shade300,
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => screens[index]));
              },
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
