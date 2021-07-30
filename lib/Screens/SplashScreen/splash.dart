import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/Screens/QuestionScreen/question1/question1.dart';
import 'package:app/DeviceInfo/deviceInfo.dart';
import 'package:app/constants.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
            'assets/images/full-moon.png'
        ),
        splashIconSize: size.height * 0.2,
        nextScreen: DeviceInfo(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: color_4,
      )
    );
  }
}