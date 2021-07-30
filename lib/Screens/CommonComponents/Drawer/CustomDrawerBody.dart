import 'package:app/Screens/CommonComponents/BottomNavigationBar/CustomBottomNavigationBar.dart';
import 'package:app/Screens/CommonComponents/Drawer/CustomDrawerRouter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomDrawerBody extends StatefulWidget {
  // const CustomDrawerBody({Key? key}) : super(key: key);

  @override
  _CustomDrawerBodyState createState() => _CustomDrawerBodyState();
}

class _CustomDrawerBodyState extends State<CustomDrawerBody> {
  CurvedNavigationBarState navBarState = CustomBottomNavigationBarState().bottomNavigationKey.currentState;

  @override
  Widget build(BuildContext context) {
    print(navBarState);
    return Expanded(
      child: ListView(
        children: [
          ListTileTheme(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                CustomDrawerRouter().selectedItem(context, 0);
              },
            ),
          ),

          ListTileTheme(
            child: ListTile(
              leading: Icon(Icons.mic),
              title: Text('Voice Diary'),
              onTap: () {
                CustomDrawerRouter().selectedItem(context, 1);
              },
            ),
          ),
          ListTileTheme(
            child: ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Suggestions'),
              onTap: () {
                CustomDrawerRouter().selectedItem(context, 2);
              },
            ),
          ),
        ],
      ),
    );
  }
}

