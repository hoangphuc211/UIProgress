import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class AboutBody extends StatelessWidget {
  // const AboutBody({Key? key}) : super(key: key);
  final String about =
      '"The Moon" is a period tracking app with a voice diary function.' +
          '\n\n' +
          'It was proposed by NFQ Asia and subsequently developed by Team TBD:' +
          '\n\n' +
          'Tan Do' +
          '\n' +
          'Thang Ta' +
          '\n' +
          'Phuc Nguyen' +
          '\n' +
          'and' +
          '\n' +
          'Ngoc Hoang' +
          '\n\n' +
          'as part of their Capstone Project for their Software Engineering and Information Technology undergraduate programs at RMIT University Vietnam.' +
          '\n\n' +
          'Overseeing Team TBD during the development process are:' +
          '\n\n' +
          'Academic Supervisor appointed by RMIT University:' +
          '\n' +
          'Ms. Anna Felipe' +
          '\n\n' +
          "Industry Mentor and NFQ Asia's Project Manager: " +
          '\n' +
          'Mr. Thanh Tran';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color_4,
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '"The Moon" is a period tracking app' +
                '\n' +
                'with a voice diary function.' +
                '\n\n\n\n',
            style: TextStyle(
              fontSize: 14,
              color: color_0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: 'It was proposed by NFQ Asia' +
                    '\n' +
                    'and subsequently developed by Team TBD:' +
                    '\n\n',
              ),
              TextSpan(
                text: 'Tan Do' +
                    '\n' +
                    'Thang Ta' +
                    '\n' +
                    'Phuc Nguyen' +
                    '\n' +
                    'Ngoc Hoang' +
                    '\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'as part of the Capstone Project in their' +
                    '\n' +
                    'Software Engineering and Information Technology' +
                    '\n' +
                    ' undergraduate programs at RMIT University Vietnam.' +
                    '\n\n\n\n',
              ),
              TextSpan(
                text: 'Overseeing Team TBD ' +
                    '\n' +
                    'during the development process are:' +
                    '\n\n',
              ),
              TextSpan(
                text: 'Ms. Anna Felipe' + '\n',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Academic Supervisor from RMIT University' + '\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Mr. Thanh Tran' + '\n',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: "Industry Mentor and Project Manager from NFQ Asia" +
                    '\n\n\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'All rights reserved ' +
                    '\n' +
                    'as specified by the WIL agreement between ' +
                    '\n' +
                    'Team TBD, RMIT University Vietnam and NFQ Asia.' +
                    '\n\n',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                  // fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: 'Icons made by Freepik from www.flaticon.com',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                  // fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
