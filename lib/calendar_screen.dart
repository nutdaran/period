import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
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
      bottomNavigationBar: const FloatingBottomNavBar(page: 2,),
      body: DraggableHome(
          title: Text("hello"),
          headerWidget: calendarWidget(context),
      body: [

      ],),
    );
  }

  Widget calendarWidget(BuildContext context){
    return Container(
      child: ElevatedButton(
          onPressed: () {
            print('save data and load the home screen');
            Navigator.pushNamed(context, '/memo');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: doneButtonColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const SizedBox(
            width: 300,
            height:60,
            child: Center(
              child: Text("Save",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Lato'),
              ),
            ),
          )),
    );
  }
}

