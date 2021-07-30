import 'package:app/Screens/CommonComponents/AppBar/AppBarPicker.dart';
import 'package:app/Screens/NotificationScreen/components/NotificationList.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  // const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBarPicker(1, 'Notifications'),
      // body: Body(data : 'Here be Notifications.'),
      body: NotificationList(),
    );
  }
}
