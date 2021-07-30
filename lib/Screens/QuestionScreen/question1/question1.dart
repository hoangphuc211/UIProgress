import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/QuestionScreen/question1/components/body.dart';

class Question1 extends StatelessWidget {
  UserInfo userInfo;

  Question1({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userInfo: userInfo),
    );
  }
}
