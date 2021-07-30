import 'dart:async';

import 'package:app/Screens/HomeScreen/homeScreen.dart';
import 'package:app/Screens/SuggestionScreen/SuggestionScreen.dart';
import 'package:app/Screens/VoiceDiaryScreen/VoiceDiaryScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/objects/info.dart';

class MasterPageRouter {
  UserInfo userInfo;
  // final CurvedNavigationBarState navBarState = bottomNavigationKey.currentState;

  void selectedPage(BuildContext context, int index) {
    switch (index) {
      case 0:
          Navigator.of(context).push(_pageOpener(HomeScreen(userInfo: userInfo)));
        break;
      case 1:
          Navigator.of(context).push(_pageOpener(VoiceDiaryScreen()));
        break;
      case 2:
          Navigator.of(context).push(_pageOpener(SuggestionScreen()));
        break;
      default:
          Navigator.of(context).push(_pageOpener(HomeScreen(userInfo: userInfo)));
        break;
    }
  }
}

Route _pageOpener(destinationScreen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}