import 'package:flutter/material.dart';
import 'package:period/calendar_screen.dart';
import 'package:period/constants.dart';
import 'package:period/home_screen.dart';

class FloatingBottomNavBar extends StatelessWidget {
  const FloatingBottomNavBar({required this.page});

  final int page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30,left: 90,right: 90),
      // padding: const EdgeInsets.only(left: 50,right: 50),
      child: Container(
        padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: mainBgColor,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () {
                print('load the home screen');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                }));
                // currentPage = 1;
                },
              child: Icon(Icons.home,
                  size: 40,
                  color: page == 1 ? primaryColor : blackColor)
                ),
          GestureDetector(
              onTap: () {
                print('load the home screen');
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                {
                  return const CalendarScreen();
                }));
                // currentPage = 2;
                },
              child: Icon(Icons.calendar_today,
                  size: 38,
                  color: page == 2 ? primaryColor : blackColor)
          )
        ],
      ),
    ),
    );
  }
}
