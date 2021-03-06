import 'package:app/DataFortesting/test.dart';
import 'package:app/Screens/TableCalendar/components/body/widgets/begin_range.dart';
import 'package:app/Screens/TableCalendar/components/body/widgets/chu_thich.dart';
import 'package:app/Screens/TableCalendar/components/body/widgets/end_range.dart';
import 'package:app/Screens/TableCalendar/components/body/widgets/in_range.dart';
import 'package:app/Screens/TableCalendar/components/body/widgets/selected_day.dart';
import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/TableCalendar/components/background.dart';
import 'package:app/Screens/AddSymptoms/addSymptoms.dart';
import 'package:app/models/getSymptoms.dart';

import 'package:app/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Body extends StatefulWidget {
  final void Function() callBack;
  UserInfo userInfo;
  List<SymptomInfo> symptomInfo;

  Body({
    this.userInfo,
    this.symptomInfo,
    @required this.callBack,
  });

  @override
  _BodyState createState() => _BodyState(userInfo, symptomInfo);
}

class _BodyState extends State<Body> {
  UserInfo userInfo;
  List<SymptomInfo> symptomInfo;
  _BodyState(this.userInfo, this.symptomInfo);

  Map<DateTime, List<Event>> selectedEvents;

  Map<DateTime, List<Event>> getEvent() {
    Map<DateTime, List<Event>> ans = {};
    for (var i in symptomInfo) {
      DateTime date = DateTime.parse(i.date);
      if (ans[DateTime(date.year, date.month, date.day)] == null) {
        ans.addAll({DateTime(date.year, date.month, date.day): []});
      }
      for (int j = 0; j < 6; j++) {
        ans[DateTime(date.year, date.month, date.day)].add(
          Event(
            title: Test.symptomTitle[j][int.parse(i.symptomLevel[j])],
            datetime: DateTime(date.year, date.month, date.day),
          ),
        );
      }
    }
    print("This                          is $ans");
    return ans;
  }

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedDay = DateTime.now();
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[DateTime(date.year, date.month, date.day)] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedEvents = getEvent();
    // Ph???n n??y thay v?? d??ng m???ng, class ????? d??? hi???u h??n

    var name = userInfo.name; // T??n ng?????i d??ng user name
    var periodStart =
        userInfo.periodStart; //date of users input their period start date
    var periodRange = userInfo
        .periodRange; // Kho???ng th???i gian h??nh kinh ng?????i d??ng ???? input(user input their period length)
    var cycle = userInfo
        .cycle; // Chu k?? kinh nguy???t m?? ng?????i d??ng input their cycle length

    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: <Widget>[
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(DateTime.now().year),
                lastDay: DateTime(DateTime.now().year + 1),
                calendarFormat: format,
                // thay d???i format c???a l???ch month -> 2 weeks -> week
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },

                // ng??y b???t ?????u  c???a tu???n start day of week
                startingDayOfWeek: StartingDayOfWeek.sunday,
                // hi???n th??? ti??u ????? c??c th??? trong tu???n showing the headline of day in week
                daysOfWeekVisible: true,

                holidayPredicate: (day) {
                  return day.difference(userInfo.periodStart).inDays ==
                      userInfo.cycle;
                },

                //thay ?????i ng??y - thay ?????i ng??y ch???n v?? ng??y focus change date and selected date
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    if (selectDay.compareTo(DateTime.now()).isNegative) {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                    }
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                // eventLoader: _getEventsfromDay,//

                //To style the calendar
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(shape: BoxShape.circle),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                ),

                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                ),

//=======================================
                calendarBuilders: CalendarBuilders(
                  // highlight c??c ng??y m?? m??nh mu???n highlight the date
                  rangeHighlightBuilder: (context, day, isWithinRange) {
                    // t??nh kho???ng th???i gian so v???i ng??y h??nh kinh from user input; 0<= period <= chu k??
                    // calculate their cycle base on the user input
                    var period = (day.difference(periodStart).inDays) % cycle;
                    if (day.compareTo(periodStart).isNegative)
                      // nh???ng ng??y tr?????c khi khai kh??ng ???????c li???t k?? v??o, if user has not input

                      //the period start date then it will return blank container)

                      return Container();

                    // ng??y ?????u ti??n ra m??u (ng??y ?????u ti??n c???a chu k??) ~ periodStart
                    if (period == 0) {
                      return BeginRangeHighlight(
                        color: color_0,
                      );
                    }

                    // ng??y cu???i c??ng h??nh kinh
                    if (period == periodRange - 1)
                      return EndRangeHighlight(
                        color: color_0,
                      );

                    // kho???ng th???i gian h??nh khinh
                    if (0 < period && period < periodRange - 1)
                      return InRangeHighlight(
                        color: color_0,
                        day: day,
                      );

                    // ng??y th??? 13 t??nh t??? ng??y ra m??u ?????u ti??n (periodStart) -> ng??y b???t ?????u r???ng tr???ng
                    if (period == periodRange + 5)
                      return BeginRangeHighlight(
                        color: color_4,
                      );

                    // ng??y th??? 17 t??nh t??? ng??y ra m??u ?????u ti??n (periodStart)
                    if (period == periodRange + 11)
                      return EndRangeHighlight(
                        color: color_4,
                      );

                    // kho???ng th???i gian r???ng tr???ng
                    if (periodRange + 5 < period && period < periodRange + 11)
                      return InRangeHighlight(
                        color: color_4,
                        day: day,
                      );
                    return Container(); //Tr??? v??? container r???ng (size(0,0))
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    // Tr??? v??? cahs m??nh hi???n th??? khi m?? m??nh ch???n m???t ng??y n??o ????
                    return Selected(day: day);
                  },
//===============================================================================
                  //15/7/2021
                  defaultBuilder: (context, day, focusedDay) {
                    var eventDay = selectedEvents.keys.toList();
                    if (eventDay
                        .contains(day.subtract(Duration(hours: 7)).toLocal())) {
                      return Container(
                        child: Stack(
                          children: [
                            Center(child: Text("${day.day}")),
                            Positioned(
                              bottom: 7,
                              left: 0,
                              right: 0,
                              child: Container(
                                child: Center(
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return null;
                  },
//==============================================================================================
                ),

//============================================================================================
              ),
              SizedBox(
                height: 15,
              ),
              Note(
                // Guidance for the calendar
                colorNote: {
                  "Menstruation": color_0,
                  "Selected Day": color_3,
                  "Ovulation": color_4,
                },
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: color_3,
                onPressed: () {
                  userInfo.addSymptomDate = selectedDay.toString();
                  print(symptomInfo.length);
                  Navigator.of(context)
                      .push(_openSymptomScreen(userInfo, symptomInfo, () {
                    widget.callBack();
                  }));
                },
                child: Text(
                  "Edit symptoms",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              // FutureBuilder(
              //   future : getSymptom(userInfo.deviceId),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       for (var i = 0; i < snapshot.data.length; i++){
              //         SymptomInfo symptom = SymptomInfo(
              //             snapshot.data[i].date,
              //             snapshot.data[i].symptomLevel
              //         );
              //         symptomInfo.add(symptom);
              //       }
              //       return SizedBox(height: 0);
              //     }
              //     else
              //     if (snapshot.hasError) {
              //       return Text("${snapshot.error}");
              //     }
              //     // By default, show a loading spinner.
              //     return
              //       CircularProgressIndicator();
              //   },
              // ),
              ..._getEventsfromDay(selectedDay).map(
                (Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _openSymptomScreen(userInfo, symptomInfo, void Function() callBack) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AddSymptoms(
      userInfo: userInfo,
      symptomInfo: symptomInfo,
      callBack: callBack,
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

class Event {
  final String title;
  final DateTime datetime;
  Event({
    @required this.title,
    @required this.datetime,
  });

  String toString() => this.title;
}
