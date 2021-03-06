import 'package:flutter/material.dart';

class Selected extends StatelessWidget {
  final DateTime day;
  const Selected({
    Key key,
    this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Center(
        child: Text(
          day.day.toString(),
        ),
      ),
    );
  }
}
