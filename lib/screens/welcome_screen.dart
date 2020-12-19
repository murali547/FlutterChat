import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/round_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation = CurvedAnimation(parent: controller,curve: Curves.easeIn);
    controller.forward();
    animation.addListener(() {setState(() {
      animation.value;
    });});


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  repeatForever: true,
                  speed: Duration(seconds: 1),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(colour: Colors.lightBlueAccent,onPressed: () {
              Navigator.pushNamed(context, "login_screen");
            },text: 'Login',),
            RoundButton(colour: Colors.blueAccent,text: 'Register', onPressed: () {
    Navigator.pushNamed(context, "register_screen");
    },)
          ],
        ),
      ),
    );
  }
}
