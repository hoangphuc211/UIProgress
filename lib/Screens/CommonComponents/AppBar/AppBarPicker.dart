import 'package:app/Screens/CommonComponents/AppBar/AppBarBackOnly.dart';
import 'package:app/Screens/CommonComponents/AppBar/AppBarForInput.dart';
import 'package:app/Screens/CommonComponents/AppBar/AppBarGeneral.dart';
import 'package:flutter/material.dart';

import 'AppBarQuestionScreens.dart';

class AppBarPicker extends StatelessWidget with PreferredSizeWidget { // Can't compile without PreferredSizeWidget.
  @override
  final Size preferredSize; // Need this variable because of PreferredSizeWidget.

  final String appBarTitle; // 'title' is a string given by whatever screen is being displayed.
  final int appBarCaseNumber; // Represents the specific type of AppBar that needs to be rendered.

  // This constructor looks confusing as hell ngl.
  AppBarPicker(
      this.appBarCaseNumber,
      this.appBarTitle,
      {Key key}
      ) : preferredSize = Size.fromHeight(kToolbarHeight), // default value for preferredSize, which is 56.0
          super(key: key);

  @override
  Widget build(BuildContext context) {

    // Pick the correct type of AppBar to render based on the screen the user is viewing.
    switch (appBarCaseNumber) {
      case 0:
        return AppBarGeneral(appBarTitle);
        break;
      case 1:
        return AppBarBackOnly(appBarTitle);
        break;
      case 2:
        return AppBarForInput(appBarTitle);
        break;
      case 3:
        return AppBarQuestionScreens(appBarTitle);
        break;
      default:
        return AppBar();
        break;
    }
  }
}
