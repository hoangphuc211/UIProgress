import 'dart:convert';
import 'package:app/Screens/CommonComponents/QuestionScreenTransitionAnimation.dart';
import 'package:app/objects/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Screens/QuestionScreen/question4/components/background.dart';
import 'package:app/Screens/HomeScreen/homeScreen.dart';
import 'package:app/models/postUser.dart';

import 'dart:async';


class Body extends StatefulWidget {
  @override
  _Body createState() => _Body(userInfo);

  UserInfo userInfo;
  Body({this.userInfo});
}

class _Body extends State<Body> {
  UserInfo userInfo;
  _Body(this.userInfo);

  int length = 15;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "What's your usual cycle length?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color_0,
                      fontSize: 24),
                ),
              ),
              Container(
                height: 100,
                width: size.width * 0.5,
                child: CupertinoPicker(
                  selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                    background: color_3.withOpacity(0.15),
                  ),
                  children: <Widget>[
                    for (var i = 15; i < 41; i++)
                      Text(
                        i.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: color_0),
                      )
                  ],
                  itemExtent: 30,
                  onSelectedItemChanged: (value) {
                    length = value + 15;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: color_0,
                  onPressed: () async{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          userInfo.cycle = length;
                          return HomeScreen(userInfo: userInfo);
                        }));
                    await submitData(
                        userInfo.name,
                        userInfo.deviceId,
                        userInfo.periodStart.toString(),
                        length.toString(),
                        userInfo.userId.toString(),
                        userInfo.periodRange.toString()
                    );

                  },
                  child: Text(
                    "Go",
                    style: TextStyle(
                        color: color_4,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ]),
      ),
    );
  }
}