import 'dart:convert';
import 'dart:async';

import 'package:app/Screens/HomeScreen/homeScreen.dart';
import 'package:app/Screens/QuestionScreen/question1/question1.dart';
import 'package:flutter/material.dart';
import 'package:app/objects/info.dart';
import 'package:device_info/device_info.dart';
import 'package:app/models/getUser.dart';

class DeviceInfo extends StatefulWidget {
  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  String deviceId = "";

  int checkInfo = 0;

  UserInfo userInfo = new UserInfo(
    deviceId: "",
    name: "",
    periodStart: DateTime.now(),
    periodRange: 0,
    cycle: 0,
    userId: 0
  );

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {

    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    setState(() {
      deviceId = androidInfo.androidId;
    });
  }

  int next_userId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              userInfo.deviceId = deviceId;
              for (var i = 0; i < snapshot.data.length; i++){
                if (next_userId < int.parse(snapshot.data[i].userId))
                  next_userId = int.parse(snapshot.data[i].userId);
                if (snapshot.data[i].deviceId == deviceId){
                  checkInfo = 1;
                  userInfo.name = snapshot.data[i].name;
                  userInfo.periodStart = DateTime.parse(snapshot.data[i].lastDay);
                  userInfo.periodRange = int.parse(snapshot.data[i].howLong);
                  userInfo.cycle = int.parse(snapshot.data[i].cycle);
                  userInfo.userId = int.parse(snapshot.data[i].userId);
                  break;
                }
              }
              if (checkInfo == 1){
                return HomeScreen(userInfo: userInfo);
              }
              else {
                userInfo.userId = next_userId + 1;
                return Question1(userInfo: userInfo);
              }
            }
            else
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            // By default, show a loading spinner.
            return
              CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
