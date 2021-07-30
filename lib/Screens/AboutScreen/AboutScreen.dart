import 'package:app/Screens/AboutScreen/components/AboutBody.dart';
import 'package:app/Screens/CommonComponents/AppBar/AppBarPicker.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  // const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPicker(1, "About"),
      body: AboutBody(),
    );
  }
}
