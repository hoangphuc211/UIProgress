import 'package:app/Screens/CommonComponents/AppBar/AppBarPicker.dart';
import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/QuestionScreen/question2/components/body.dart';

class Question2 extends StatelessWidget {
  UserInfo userInfo;

  Question2({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarPicker(3, "Getting started..."),
      body: Body(userInfo: userInfo),
    );
  }
}
