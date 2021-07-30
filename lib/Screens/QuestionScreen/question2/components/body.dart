import 'package:app/Screens/CommonComponents/QuestionScreenTransitionAnimation.dart';
import 'package:app/objects/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Screens/QuestionScreen/question2/components/background.dart';
import 'package:app/Screens/QuestionScreen/question3/question3.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body(userInfo);

  UserInfo userInfo;
  Body({this.userInfo});
}

class _Body extends State<Body> {
  UserInfo userInfo;
  _Body(this.userInfo);

  String finalDate;

  DateTime date = DateTime.now();

//======================================================================
  void showCupertinoDatePicker(BuildContext context, Widget child) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text("Done"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  Widget buildCupertinoDatePicker() => Container(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (datetime) {
            setState(() {
              date = datetime;
            });
          },
          initialDateTime: date,
          minimumDate: date.subtract(Duration(days: 40 * 3)),
          maximumDate: date,
        ),
      );
//==================================================================

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date.subtract(Duration(days: (40 * 3))),
        lastDate: date);
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  String getDate() {
    if (date == null) {
      return 'Select day';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            height: 50,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "When did your last period start?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: color_0, fontSize: 24),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              getDate(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: color_3, fontSize: 25),
            ),
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                  color: color_4, borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                  color: color_0,
                  icon: Icon(Icons.calendar_today),
                  iconSize: 30,
                  onPressed: () {
                    showCupertinoDatePicker(
                        context, buildCupertinoDatePicker());
                  }),
            )
          ]),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: color_4,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  finalDate = date.toString();
                  userInfo.periodStart = date;
                  print("not sure lmao");
                  // return Question3(
                  //   userInfo: userInfo,
                  // );
                  // }));
                  Navigator.of(context).push(questionScreenTransitionAnimation(
                      Question3(userInfo: userInfo)));
                },
                child: Text(
                  "Not sure",
                  style: TextStyle(
                      color: color_0,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            SizedBox(width: 50),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: color_0,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  print(date);
                  finalDate = date.toString();
                  userInfo.periodStart = date;
                  //   return Question3(
                  //     userInfo: userInfo,
                  //   );
                  // }));
                  Navigator.of(context).push(questionScreenTransitionAnimation(
                    Question3(userInfo: userInfo),
                    // 1.0,
                    // 0.0
                  ));
                },
                child: Text(
                  "Go",
                  style: TextStyle(
                      color: color_4,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          ]),
        ]),
      ),
    );
  }
}
