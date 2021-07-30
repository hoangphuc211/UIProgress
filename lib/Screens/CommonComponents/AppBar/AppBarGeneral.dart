import 'package:app/Screens/NotificationScreen/NotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class AppBarGeneral extends StatelessWidget {

  final String appBarTitle;

  const AppBarGeneral(
      this.appBarTitle,
      {Key key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      // General beautification of AppBar
      backgroundColor: Colors.transparent,            // Transparent AppBar with shadow underneath.
      elevation: 0,                                   // Remove AppBar shadow -> true transparency.
      centerTitle: true,                              // Align AppBar title to center. Default is left side.
      iconTheme: IconThemeData(color: color_0), // Make all buttons on AppBar the same color.

      // 'title' is a string given by whatever screen is being displayed.
      title: Text(appBarTitle, style: TextStyle(color: color_0)),

      // This entire code block is to customize the drawer button (burger menu) so that it says 'Menu' when held down.
      // Without this code block, the drawer button says 'Open navigation menu', which sounds kinda stupid.
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),

            onPressed: () {                       // Because we replaced the drawer button with an icon containing no logic,...
              Scaffold.of(context).openDrawer();  // ...we have to add the logic back so that it opens the drawer when pressed.
            },                                    // This is stupid.

            tooltip: 'Menu', // An entire code block just to get to this single line fml.
          );
        },
      ),

      // Bell icon. Opens the notification page when pressed.
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Notifications',
          onPressed: () {
            Navigator.of(context).push(_openNotificationScreen());
          },
        ),
      ],
    );
  }
}

Route _openNotificationScreen() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => NotificationScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
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