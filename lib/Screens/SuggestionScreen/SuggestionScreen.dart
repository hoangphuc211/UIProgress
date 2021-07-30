import 'package:app/Screens/CommonComponents/AppBar/AppBarPicker.dart';
import 'package:app/Screens/CommonComponents/BottomNavigationBar/CustomBottomNavigationBar.dart';
import 'package:app/Screens/CommonComponents/Drawer/CustomDrawer.dart';
import 'package:app/Screens/SuggestionScreen/components/body.dart';
import 'package:flutter/material.dart';

class SuggestionScreen extends StatefulWidget {
  // const SuggestionScreen({Key? key}) : super(key: key);

  @override
  _SuggestionScreenState createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBarPicker(0, "Suggestions"),
      drawer: CustomDrawer(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavigationBar(2),
    );
  }
}
