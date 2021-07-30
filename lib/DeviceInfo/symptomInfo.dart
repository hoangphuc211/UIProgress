import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app/objects/info.dart';
import 'package:app/models/getSymptoms.dart';
import 'package:app/Screens/TableCalendar/tableCalendar.dart';

class SymptomsInfo extends StatefulWidget {
  UserInfo userInfo;
  SymptomsInfo({this.userInfo});

  @override
  _SymptomsInfoState createState() => _SymptomsInfoState(userInfo);
}

class _SymptomsInfoState extends State<SymptomsInfo> {
  UserInfo userInfo;
  _SymptomsInfoState(this.userInfo);

  List<SymptomInfo> symptomInfo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getSymptom(userInfo.deviceId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var i = 0; i < snapshot.data.length; i++) {
                SymptomInfo symptom = SymptomInfo(
                    snapshot.data[i].date, snapshot.data[i].symptomLevel);
                symptomInfo.add(symptom);
              }
              return TableCalender(
                userInfo: userInfo,
                symptomInfo: symptomInfo,
                callBack: () {
                  setState(() {});
                },
              );
            } else if (snapshot.hasError) {
              return Text("Has an error ${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
