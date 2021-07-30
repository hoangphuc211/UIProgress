import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class AppBarForInput extends StatelessWidget {
  final String appBarTitle;

  const AppBarForInput(
      this.appBarTitle,
      {Key key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // General beautification of AppBar
      backgroundColor: Colors.transparent,
      elevation: 0,                                   // Remove AppBar shadow.
      centerTitle: true,                              // Align AppBar title to center. Default is left side.
      iconTheme: IconThemeData(color: color_0), // Make all buttons on AppBar the same color.

      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.cancel),

            onPressed: () {                       // Because we replaced the drawer button with an icon containing no logic,...
              Navigator.pop(context);  // ...we have to add the logic back so that it opens the drawer when pressed.
            },                                    // This is stupid.

            tooltip: 'Cancel', // An entire code block just to get to this single line fml.
          );
        },
      ),

      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.done),
          tooltip: 'Save',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      // 'title' is a string given by whatever screen is being displayed.
      title: Text(appBarTitle, style: TextStyle(color: color_0)),
    );
  }
}
