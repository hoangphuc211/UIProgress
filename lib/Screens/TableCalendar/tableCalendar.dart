import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:app/Screens/CommonComponents/AppBar/AppBarPicker.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/TableCalendar/components/body/body.dart';
import 'package:app/Screens/AddSymptoms/addSymptoms.dart';
import 'package:app/objects/info.dart';

class TableCalender extends StatefulWidget {
  final void Function() callBack;
  final UserInfo userInfo;
  final List<SymptomInfo> symptomInfo;

  TableCalender({
    this.userInfo,
    this.symptomInfo,
    @required this.callBack,
  });

  @override
  _TableCalenderState createState() => _TableCalenderState();
}

class _TableCalenderState extends State<TableCalender> {
  int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBarPicker(1, 'Calendar'),
      body: Body(
        userInfo: widget.userInfo,
        symptomInfo: widget.symptomInfo,
        callBack: () {
          widget.callBack();
        },
      ),
    );
  }
}

Route _openSymptomScreen() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AddSymptoms(
      callBack: () {},
    ),
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
