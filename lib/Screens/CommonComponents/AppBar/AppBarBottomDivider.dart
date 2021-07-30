import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class AppBarBottomDivider extends Divider implements PreferredSizeWidget {
  AppBarBottomDivider({
    Key key,
    height = 0.0,
    indent = 0.0,
    color,
    // thickness = 3.0,
  })  : assert(height >= 0.0),
        super(
        key: key,
        height: height,
        indent: indent,
        color: color,
        // thickness: thickness,
      ) {
    preferredSize = Size(double.infinity, height);
  }

  @override
  Size preferredSize;
}