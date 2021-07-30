import 'dart:convert';

import 'package:http/http.dart' as http;

class Symptom {
  final String date, symptomLevel;

  Symptom(this.date, this.symptomLevel);
}

Future getSymptom(String deviceId) async {
  var url =
      "https://bpaecpakqj.execute-api.us-east-2.amazonaws.com/user/symptom?deviceId=" +
          deviceId;
  print(url);
  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);

  var jsonDataSymptom = jsonData['symptom'].toList();

  List<Symptom> symptoms = [];

  for (var u in jsonDataSymptom) {
    Symptom symptom = Symptom(u['date'], u['level']);
    symptoms.add(symptom);
  }
  return symptoms;
}
