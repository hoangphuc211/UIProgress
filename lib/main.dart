import 'package:app/constants.dart';

import 'package:app/Screens/SplashScreen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() => runApp(
      Phoenix(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moon Project',
      theme: ThemeData(
        primaryColor: color_0,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
      // home: Loader(),
    );
  }
}
