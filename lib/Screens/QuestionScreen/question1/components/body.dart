import 'package:app/Screens/CommonComponents/QuestionScreenTransitionAnimation.dart';
import 'package:app/objects/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Screens/QuestionScreen/question1/components/background.dart';
import 'package:app/Screens/QuestionScreen/question2/question2.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body(userInfo);

  UserInfo userInfo;
  Body({this.userInfo});
}

class _Body extends State<Body> {
  UserInfo userInfo;
  _Body(this.userInfo);

  String name = "";

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
                height: 70,
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "Hi there." + "\n" + "What should we call you?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color_0,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    color: color_4,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  style: TextStyle(
                    color: color_0,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      hintText: "name or nickname",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,

                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: color_0,
                    onPressed: () {
                      if (name != "" && name != null) {
                        userInfo.name = name;
                        Navigator.of(context).push(firstTransitionAnimation(Question2(userInfo: userInfo)));
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //       userInfo.name = name;
                        //       return Question2(userInfo: userInfo);
                        //     }));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Sorry. This field is required.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: color_0,
                            textColor: Colors.black,
                            fontSize: 16.0
                        );
                      }
                    },
                    child: Text(
                      "Go",
                      style: TextStyle(
                          color: color_4,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                ),
              )
            ]),
      ),
    );
  }
}

Route firstTransitionAnimation(destinationScreen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}