import 'package:app/Screens/CommonComponents/Drawer/CustomDrawerRouter.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class CustomDrawerFooter extends StatefulWidget {
  // const CustomDrawerFooter({Key? key}) : super(key: key);

  @override
  _CustomDrawerFooterState createState() => _CustomDrawerFooterState();
}

class _CustomDrawerFooterState extends State<CustomDrawerFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: color_0),
              title: Text('Settings', style: TextStyle(color: color_0)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: color_0),
              title: Text('Log Out', style: TextStyle(color: color_0)),
              onTap: () {
                CustomDrawerRouter().selectedItem(context, 5);
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: color_0),
              title: Text('About', style: TextStyle(color: color_0)),
              onTap: () {
                CustomDrawerRouter().selectedItem(context, 6);
              },
            ),
          ],
        ),
      ),
    );
  }
}
