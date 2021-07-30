import 'dart:convert';

import 'package:http/http.dart' as http;

List<postUserInfo> postUserInfoFromJson(String str) => List<postUserInfo>.from(json.decode(str).map((x) => postUserInfo.fromJson(x)));

String postUserInfoToJson(List<postUserInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class postUserInfo {
  postUserInfo({
    this.deviceId,
    this.name,
    this.cycle,
    this.userId,
    this.lastDay,
    this.howLong,
  });

  String deviceId;
  String name;
  String cycle;
  String userId;
  String lastDay;
  String howLong;

  factory postUserInfo.fromJson(Map<String, dynamic> json) => postUserInfo(
    deviceId: json["deviceId"],
    name: json["name"],
    cycle: json["cycle"],
    userId: json["userId"],
    lastDay: (json["lastDay"]),
    howLong: json["howLong"],
  );

  Map<String, dynamic> toJson() => {
    "deviceId": deviceId,
    "name": name,
    "cycle": cycle,
    "userId": userId,
    "lastDay": lastDay,
    "howLong": howLong,
  };
}

Future<postUserInfo> submitData(String name, String deviceId, String lastDay, String cycle, String userId, String howLong) async{
  var response = await http.post(
    Uri.parse(
        "https://bpaecpakqj.execute-api.us-east-2.amazonaws.com/user/info"
    ),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      //'Accept': 'application/json'
    },
    body: jsonEncode(<String, String>{
      "name": name,
      "deviceId": deviceId,
      "lastDay": lastDay,
      "cycle": cycle,
      "userId": userId,
      "howLong": howLong
    }
    ),
  );

  var data = response.body;
  print(data);

  if (response.statusCode == 201){
    String responseString = response.body;
    postUserInfoFromJson(responseString);
  }
  else
    return null;
}
