import 'package:app/Screens/CommonComponents/AppBar/AppBarBottomDivider.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class AppBarBackOnly extends StatelessWidget {
  final String appBarTitle;

  const AppBarBackOnly(
      this.appBarTitle,
      {Key key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // General beautification of AppBar
      backgroundColor: Colors.white,
      elevation: 0,                                   // Remove AppBar shadow.
      centerTitle: true,                              // Align AppBar title to center. Default is left side.
      iconTheme: IconThemeData(color: color_0), // Make all buttons on AppBar the same color.

      // 'title' is a string given by whatever screen is being displayed.
      title: Text(appBarTitle, style: TextStyle(color: color_0)),
      bottom: AppBarBottomDivider(),
    );
  }
}
