import 'package:flutter/material.dart';

Route questionScreenTransitionAnimation(destinationScreen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    // transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //   var begin = Offset(offsetH, offsetV);
    //   var end = Offset.zero;
    //   var curve = Curves.ease;
    //
    //   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    //
    //   return SlideTransition(
    //     position: animation.drive(tween),
    //     child: child,
    //   );
    // },
  );
}