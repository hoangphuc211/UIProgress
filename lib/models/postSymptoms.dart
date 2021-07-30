import 'dart:convert';

import 'package:app/objects/info.dart';
import 'package:http/http.dart' as http;

class Tag {
  String date;
  String level;

  Tag(this.date, this.level);

  Map toJson() => {
        'date': date,
        'level': level,
      };
}

int checkInfo;

Future submitSymptom(UserInfo userInfo, List<SymptomInfo> symptomInfo) async {
  List<Tag> symptom = [];

  checkInfo = 0;

  for (var i = 0; i < symptomInfo.length; i++) {
    if (symptomInfo[i].date == userInfo.addSymptomDate) {
      checkInfo = 1;
      symptomInfo[i].symptomLevel = userInfo.addSymptomLevel;
    }
  }

  for (var i = 0; i < symptomInfo.length; i++) {
    symptom.add(Tag(symptomInfo[i].date, symptomInfo[i].symptomLevel));
  }

  print(checkInfo);

  if (checkInfo == 0)
    symptom.add(Tag(userInfo.addSymptomDate, userInfo.addSymptomLevel));

  Map<String, dynamic> jsonSymptom = {
    "deviceId": userInfo.deviceId,
    "symptom": symptom
  };

  await http.post(
    Uri.parse(
        "https://bpaecpakqj.execute-api.us-east-2.amazonaws.com/user/symptom"),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      //'Accept': 'application/json'
    },
    body: jsonEncode(jsonSymptom),
  );
  print("Done");
}
