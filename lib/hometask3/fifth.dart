import 'package:animations/widgets/login_register_button.dart';
import 'package:flutter/material.dart';

class FifthPart3 extends StatefulWidget {
  const FifthPart3({Key? key}) : super(key: key);

  @override
  State<FifthPart3> createState() => _FifthPart3State();
}

class _FifthPart3State extends State<FifthPart3>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  bool loginPressed = false;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: const Offset(1.5, 0), end: Offset.zero).animate(controller);
    controller.addListener(() {setState(() {});});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.flash_on,
                      color: Colors.amber,
                      size: 50,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Flash Chat",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                LoginRegister(
                  onPressed: () {
                    controller.forward();
                    loginPressed = true;
                  },
                  text: "Login",
                  color: Colors.lightBlueAccent,
                ),
                const SizedBox(height: 20),
                LoginRegister(
                  onPressed: () {
                    controller.forward();
                    loginPressed = false;
                  },
                  text: "Register",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          SlideTransition(
            position: animation,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.flash_on, color: Colors.amber, size: 100),
                  const SizedBox(height: 30),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  const SizedBox(height: 40),
                  LoginRegister(
                    onPressed: () {},
                    color: loginPressed ? Colors.lightBlueAccent : Colors.blue,
                    text: loginPressed ? "Login" : "Register",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
