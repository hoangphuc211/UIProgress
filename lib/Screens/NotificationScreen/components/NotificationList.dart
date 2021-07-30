import 'package:app/constants.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  // const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {

  List<String> notiList = [];

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            child: DraggableScrollbar.semicircle(
              backgroundColor: Colors.white,
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: notiList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Card(
                  color: color_4,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ListTile(
                    title: Text(notiList[index]),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: color_0,
            onPressed: () =>
                setState(() => notiList.insert(0, DateTime.now().toString())),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
