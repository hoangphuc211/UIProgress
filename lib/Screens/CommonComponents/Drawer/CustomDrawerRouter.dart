import 'package:app/Screens/AboutScreen/AboutScreen.dart';
import 'package:app/Screens/CommonComponents/BottomNavigationBar/CustomBottomNavigationBar.dart';
import 'package:app/Screens/CommonComponents/Drawer/LogOutAlertDialog.dart';
import 'package:app/Screens/CommonComponents/MasterPageRouter.dart';
import 'package:app/Screens/HomeScreen/homeScreen.dart';
import 'package:app/Screens/SuggestionScreen/SuggestionScreen.dart';
import 'package:app/Screens/VoiceDiaryScreen/VoiceDiaryScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/objects/info.dart';

class CustomDrawerRouter {
  UserInfo userInfo;

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(userInfo: userInfo),
        ));
        // navBarState.setPage(index);
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VoiceDiaryScreen(),
        ));
        // navBarState.setPage(index);
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SuggestionScreen(),
        ));
        // navBarState.setPage(index);
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutScreen(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutScreen(),
        ));
        break;
      case 5:
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => LogOutAlertDialog(),
        );
        break;
      case 6:
        // Navigator.of(context).push(_screenOpener(AboutScreen(), -1.0, 0.0, Duration(milliseconds: 300)));
        Navigator.of(context).push(_screenOpener(AboutScreen()));
        break;
    }
  }
}

Route _screenOpener(destinationScreen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
