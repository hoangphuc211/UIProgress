import 'dart:async';

import 'package:app/Screens/CommonComponents/MasterPageRouter.dart';
import 'package:app/Screens/SuggestionScreen/SuggestionScreen.dart';
import 'package:app/Screens/VoiceDiaryScreen/VoiceDiaryScreen.dart';
import 'package:app/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  // const CustomBottomNavigationBar({Key? key}) : super(key: key);

  final int index;

  const CustomBottomNavigationBar(this.index, {Key key}) : super(key: key);

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  Duration animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    print(bottomNavigationKey);
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      backgroundColor: Colors.transparent,
      color: color_4,
      index: widget.index,
      animationDuration: animationDuration,
      buttonBackgroundColor: color_4,
      items: <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: Colors.grey,
        ),
        Icon(
          Icons.mic,
          size: 30,
          color: Colors.grey,
        ),
        Icon(
          Icons.lightbulb,
          size: 30,
          color: Colors.grey,
        ),
      ],
      onTap: (index) {
        Timer(animationDuration, () {
          MasterPageRouter().selectedPage(context, index);
        });
      },
    );
  }
}
