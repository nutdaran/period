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
  static Color color = primaryColor;
  static String texture = "Texture";
  static String flow = "Flow";
  static Color flowColor = primaryColor;
  static int day = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    day = (DateTime.now().day - DateTime.parse( pref.getString('date') as String).day) + 1;

    if (pref.getString('flow') == null) {
      await pref.setString('flow', "Flow");
    }
    if (pref.getString('texture') == null) {
      await pref.setString('texture', "Texture");
    }
    if (pref.getString('color') == null) {
      await pref.setString('color', "primaryColor");
    }
    if (pref.getString('flowColor') == null) {
      await pref.setString('flowColor', "primaryColor");
    }
      flow = pref.getString('flow')??"Flow";
      texture = pref.getString('texture')??"Texture";
      color = {pref.getString('color')??"primaryColor"} as Color;
      flowColor = {pref.getString('flowColor')??"primaryColor"} as Color;
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
              /***
               * Color
               */
              SizedBox(
                  width: 120,
                  height: 140,
                  child: ElevatedButton(
                      onPressed: () {
                        _colorMemo(context);
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
              /***
               * Texture
               */
              SizedBox(
                  width: 120,
                  height: 140,
                  child: ElevatedButton(
                      onPressed: () {
                        _textureMemo(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
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
              /***
               * Flow
               */
              SizedBox(
                  width: 120,
                  height: 140,
                  child: ElevatedButton(
                      onPressed: () {
                        _flowMemo(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: flowColor,
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

  _flowMemo(BuildContext context) async {
    final List res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => FlowMemoScreen()),
    );
    setState(() {
      flow = res[0];
      flowColor = res[1];
      print('return value is $flow');
    });
  }

  _textureMemo(BuildContext context) async {
    final String res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => TextureMemoScreen()),
    );
    setState(() {
      texture = res;
      print('return value is $texture');
    });
  }

  _colorMemo(BuildContext context) async {
    final Color res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => ColorMemoScreen()),
    );
    setState(() {
      color = res;
    });
  }
}
