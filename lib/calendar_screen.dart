import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Element/floating_bottom_nav_bar.dart';
import 'constants.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
        // fullyStretchable: true,
        body: [
          Text(
            "Today",
            style: TextStyle(fontFamily: 'Lato', fontSize: 30),
          ),
          // listView(),
          listView(),
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
              child: const Text(
                "1",
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
      padding: EdgeInsets.only(top:60, left:30, right: 30),
        child: TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2022, 01, 01),
      lastDay: DateTime.utc(2040, 01, 01),
    ));
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/memo');
          },
          child: Text("Lol"),
        ),
      ),
    );
  }
}
