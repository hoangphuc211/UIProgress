import 'package:app/Screens/TableCalendar/tableCalendar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:app/Screens/CommonComponents/AppBar/AppBarPicker.dart';
import 'package:app/Screens/CommonComponents/BottomNavigationBar/CustomBottomNavigationBar.dart';
import 'package:app/Screens/CommonComponents/Drawer/CustomDrawer.dart';
import 'package:app/DeviceInfo/symptomInfo.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/objects/info.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState(userInfo);

  UserInfo userInfo;
  HomeScreen({this.userInfo});
}

class _HomeScreenState extends State<HomeScreen> {
  UserInfo userInfo;
  _HomeScreenState(this.userInfo);

  var today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            today = today.add(Duration(days: 1));
            print(today);
          });
          print(today);
        },
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBarPicker(0, 'The Moon'),
      //Adding SpinCircleBottomBarHolder to body of Scaffold
      body: SafeArea(
        child: Container(
          height: 500,
          width: 500,
          // color: Colors.blue,
          child: Stack(
            children: [
              Center(
                child: CounterInterface(
                  // phần vòng tròn bên sau đây
                  beginCycle: userInfo.periodStart, // ngày ra máu người nhập vào ở đây
                  cycle: userInfo.cycle, // chu kì ở đây
                  periodLength: 3, // thời gian rụng trứng đây
                  today: today, // ngày hôm nay
                  beginLength: userInfo.periodRange, // khoảng thời gian ra máu
                ),
              ),
              Center(
                child: Content(
                  // nội dung bên trong vòng tròn is here
                  beginCycle: userInfo.periodStart,
                  cycle: userInfo.cycle,
                  periodLength: 3,
                  today: today,
                  userInfo: userInfo,
                  beginLength: userInfo.periodRange,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(0),
    );
  }
}

class Content extends StatelessWidget {
  final UserInfo userInfo;
  final DateTime today;
  final int cycle;
  final DateTime beginCycle;
  final int periodLength;
  final int beginLength;
  const Content({
    Key key,
    @required this.userInfo,
    @required this.today,
    @required this.cycle,
    @required this.beginCycle,
    @required this.periodLength,
    @required this.beginLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var time = today.difference(beginCycle).inDays; //  khoảng thời gian của ngày hôm nay so với ngày đã khai ban đâuf
    var todayIndex = time % cycle;  // tính xem ngày hôm nay là ngày thứ mấy trong chu kì
    return Container( // điều chỉnh kích cỡ vòng tròn phần content
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color
            : (0 <= todayIndex && todayIndex < beginLength) ? color_0
          : (beginLength + periodLength <= todayIndex && todayIndex < beginLength + periodLength + 5) ? color_3
          : (todayIndex == beginLength + 5 + periodLength) ? color_1
          : (beginLength + periodLength + 5 < todayIndex && todayIndex <= beginLength + periodLength + 10) ? color_3
          : color_4, // màu vòng tròn
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${DateFormat.yMMMMd().format(today)}", // dòng trên cùng, hiển thị ngày tháng
            style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 20,
                color
                    : ((0 <= todayIndex && todayIndex < beginLength) || (todayIndex == beginLength + 5 + periodLength)) ? Colors.white
                    : Colors.black,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            (0 <= todayIndex && todayIndex < beginLength) ? "Period:"
                : (beginLength <= todayIndex && todayIndex < beginLength + periodLength + 5) ? "Ovulation in:"
                : (todayIndex == beginLength + 5 + periodLength) ? "Prediction: day of"
                : "Period in",
            style: TextStyle(
              fontSize: 20,
              color
                  : ((0 <= todayIndex && todayIndex < beginLength) || (todayIndex == beginLength + 5 + periodLength)) ? Colors.white
                  : Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (0 <= todayIndex && todayIndex < beginLength) ? "Day "
                      : "",
                style: TextStyle(
                  fontSize : 40,
                  fontWeight: FontWeight.bold,
                  color
                      : ((0 <= todayIndex && todayIndex < beginLength) || (todayIndex == beginLength + 5 + periodLength)) ? Colors.white
                      : Colors.black,
                ),
              ),
              Text(
                "${(
                    (0 <= todayIndex && todayIndex < beginLength) ? todayIndex + 1
                        : (beginLength <= todayIndex && todayIndex < beginLength + periodLength + 5) ? beginLength + periodLength + 5 - todayIndex
                        : (todayIndex == beginLength + 5 + periodLength) ? "Ovulation"
                        : cycle - todayIndex
                    )}",// hiển thị thời gian còn lại hay là đang trong thời kì rụng trứng
                style: TextStyle(
                  fontSize : 40,
                  fontWeight: FontWeight.bold,
                  color
                      : ((0 <= todayIndex && todayIndex < beginLength) || (todayIndex == beginLength + 5 + periodLength)) ? Colors.white
                      : Colors.black,
                ),
              ),
              Text(
                (todayIndex == cycle - 1) ? " day"
                    : ((0 <= todayIndex && todayIndex < beginLength) || (todayIndex == beginLength + 5 + periodLength)) ? ""
                    : " days",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color
                            : ((0 <= todayIndex && todayIndex < beginLength) || (todayIndex == beginLength + 5 + periodLength)) ? Colors.white
                            : Colors.black,
                      ),
                    ),
            ],
          ),
          FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return SymptomsInfo(userInfo: userInfo);
                    }));
              },
              child: Text(
                (0 <= todayIndex && todayIndex < beginLength) ? "Edit period dates"
                : "Log period",
                style: TextStyle(
                    color
                        : (0 <= todayIndex && todayIndex < beginLength) ? color_0
                        : (todayIndex == beginLength + 5 + periodLength) ? color_1
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
          ),
          //Text("Cycle lasted ${cycle - todayIndex} days"),
        ],
      ),
    );
  }
}

class CounterInterface extends StatelessWidget {
  final DateTime today;
  final int cycle;
  final DateTime beginCycle;
  final int periodLength;
  final int beginLength;
  const CounterInterface({
    Key key,
    @required this.today,
    @required this.cycle,
    @required this.beginCycle,
    @required this.periodLength,
    @required this.beginLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var time = today.difference(beginCycle).inDays;
    var todayIndex = time % cycle;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: Colors.blue,
      ),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: List.generate(cycle, (index) { // phần dựng các hình tròn xung quanh
              return Transform.rotate(
                angle: 3.141592 * 2 / cycle * (index + cycle / 4),
                child: Container(
                  // color: Colors.grey,
                  child: Container(
                    height: 40, // khoảng cách tối đa của các hình tròn xung quanh
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: index != todayIndex ? 10 : 0, // dùng để căn chỉnh vị trí các hình tròn so với tâm  , công thức thay thế sẽ là (bán kính hình tròn to - hình tròn nhỏ )/2 (vd ở đây là (40-20) /2 ), 40 và 20 lấy ở dòng 213
                        ),
                        (index == todayIndex)
                        // Change the color for selected day
                            ? SelectedDay(
                          color
                              : (0 <= index && index < beginLength) ? color_0
                              : (beginLength + periodLength <= index && index < beginLength + periodLength + 5) ? color_3
                              : (index == beginLength + 5 + periodLength) ? color_1
                              : (beginLength + periodLength + 5 < index && index <= beginLength + periodLength + 10) ? color_3
                              : color_4,
                        )
                            : Container(
                          //Below part
                          height: index != todayIndex ? 20 : 40, // nếu như là ngày thường thì đường kính là 20, nếu là ngày hôm nay thì đường kính là 40 (max ở trên)
                          width: index != todayIndex ? 20 : 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color
                                : (0 <= index && index < beginLength) ? color_0
                                : (beginLength + periodLength <= index && index < beginLength + periodLength + 5) ? color_3
                                : (index == beginLength + 5 + periodLength) ? color_1
                                : (beginLength + periodLength + 5 < index && index <= beginLength + periodLength + 10) ? color_3
                                : color_4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class SelectedDay extends StatelessWidget {
  const SelectedDay({
    Key key,
    @required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
