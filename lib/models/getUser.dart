import 'dart:convert';

import 'package:http/http.dart' as http;

class User{
  final String name, deviceId, lastDay, cycle, userId, howLong;
  User(
    this.name,
    this.deviceId,
    this.lastDay,
    this.cycle,
    this.userId,
    this.howLong
  );
}

Future getUser() async{
  var response = await http.get(Uri.parse("https://bpaecpakqj.execute-api.us-east-2.amazonaws.com/user/users"));

  var jsonData = jsonDecode(response.body);

  List<User> users = [];

  for (var u in jsonData){
    User user = User(
        u['name'],
        u['deviceId'],
        u['lastDay'],
        u['cycle'],
        u['userId'],
        u['howLong']
    );
    users.add(user);
  }
  return users;
}
