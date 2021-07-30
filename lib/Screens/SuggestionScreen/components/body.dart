import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Screens/SuggestionScreen/components/background.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  List<String> suggestList = [
    "Suggestion Title 1",
    "Suggestion Title 2",
    "Suggestion Title 3"
  ];

  List<String> imageList = [
    "assets/images/symptoms/emotions/icon_emotions_moodSwings.png",
    "assets/images/symptoms/energy/icon_energy_energized.png",
    "assets/images/symptoms/sleep/icon_sleep_general.png"
  ];

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          Expanded(
            child: DraggableScrollbar.semicircle(
              backgroundColor: Colors.white,
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: suggestList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Card(
                  color: color_4,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ExpansionTile(
                    title: Text(suggestList[index]),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            imageList[index],
                            width: size.width * 0.15,
                          ),
                          Text(
                            "Description for suggestion",
                            style: TextStyle(
                              fontSize: 20
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          /*FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: () =>
                setState(() => suggestList.insert(0, DateTime.now().toString())),
            child: Icon(Icons.add),
          ),*/
        ],
      ),
    );
  }
}
