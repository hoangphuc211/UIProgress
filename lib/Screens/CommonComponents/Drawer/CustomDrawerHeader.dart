import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatefulWidget {
  // const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  _CustomDrawerHeaderState createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text("[name here pls]", style: TextStyle(color: Colors.black),),
      accountEmail: Text("idk what to put here yet", style: TextStyle(color: Colors.black),),
      arrowColor: Colors.black,
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/icons/user.png'),
      ),
      decoration: BoxDecoration(color: color_4,),
      onDetailsPressed: () {},
    );
  }
}
