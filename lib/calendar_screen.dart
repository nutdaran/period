import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:period/color_memo_screen.dart';
import 'package:period/texture_memo_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Element/floating_bottom_nav_bar.dart';
import 'constants.dart';
import 'flow_memo_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Color color = primaryColor;
  String texture = "Texture";
  String flow = "Flow";
  int day = 0;

  @override
  void initState() {
    getDay();
    super.initState();
  }

  Future<void> getDay() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    day = (DateTime.now().day - DateTime.parse( pref.getString('date') as String).day) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      extendBody: true,
      bottomNavigationBar: const FloatingBottomNavBar(
        page: 2,
      ),
      body: DraggableHome(
        title: const Text("calendar"),
        appBarColor: primaryColor,
        headerWidget: calendarWidget(context),
        headerExpandedHeight: 0.5,
        body: [
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "Today",
                style: TextStyle(fontFamily: 'Lato', fontSize: 30),
              )),
          // listView(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 120,
                  height: 140,
                  child: ElevatedButton(
                      onPressed: () {
                        _addColor(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        alignment: Alignment.center,
                          child: Text("Color",
                        style:TextStyle(
                          color: mainBgColor,
                          fontSize: 20,
                          fontFamily: 'Lato'),)
                      )
                  )
              ),
              SizedBox(
                  width: 120,
                  height: 140,
                  child: ElevatedButton(
                      onPressed: () {
                        _addTexture(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Container(
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Text("$texture",
                            style:TextStyle(
                                color: mainBgColor,
                                fontSize: 20,
                                fontFamily: 'Lato'),)
                      )
                  )
              ),
              SizedBox(
                  width: 120,
                  height: 140,
                  child: ElevatedButton(
                      onPressed: () {
                        _addFlow(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Container(
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Text("$flow",
                            style:TextStyle(
                                color: mainBgColor,
                                fontSize: 20,
                                fontFamily: 'Lato'),)
                      )
                  )
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: const Text(
                "Day",
                style: TextStyle(fontFamily: 'Lato', fontSize: 25),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Text('$day',
                style: TextStyle(fontFamily: 'Lato', fontSize: 25),
              ),
            )
          ]),
        ],
      ),
    );
  }

  Widget calendarWidget(BuildContext context) {
    return Container(
        color: primaryColor,
        padding: EdgeInsets.only(top: 60, left: 30, right: 30),
        child: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2022, 01, 01),
          lastDay: DateTime.utc(2040, 01, 01),
        ));
  }

  _addColor(BuildContext context) async {
    final Color res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ColorMemoScreen()),
    );
    setState(() {
      color = res;
      print('color is updated');
    });
  }

  _addTexture(BuildContext context) async {
    final String res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TextureMemoScreen()),
    );
    setState(() {
      texture = res;
      print('texture is $texture');
    });
  }

  _addFlow(BuildContext context) async {
    final String res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FlowMemoScreen()),
    );
    setState(() {
      flow = res;
      print('flow is updated to $flow');
    });
  }
}
