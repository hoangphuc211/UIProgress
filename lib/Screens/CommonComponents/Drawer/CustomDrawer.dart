import 'package:app/constants.dart';
import 'package:flutter/material.dart';

import 'CustomDrawerBody.dart';
import 'CustomDrawerFooter.dart';
import 'CustomDrawerHeader.dart';

class CustomDrawer extends StatefulWidget {
  // const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomDrawerHeader(),
          // CustomDrawerBody(),
          Expanded(child: Container(),),
          CustomDrawerFooter(),
        ],
      ),
    );
  }
}
