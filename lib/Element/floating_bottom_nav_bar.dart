import 'package:flutter/material.dart';
import 'package:period/constants.dart';

class FloatingBottomNavBar extends StatelessWidget {
  const FloatingBottomNavBar({Key? key}) : super(key: key);
  // final int currentPage = 1;

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
                Navigator.pushNamed(context, '/');
                // currentPage = 1;
                },
              child: Icon(Icons.home,
                  size: 40,
                  // color: currentPage == 1 ? primaryColor : blackColor)
                color: blackColor,),
          ),
          GestureDetector(
              onTap: () {
                print('load the home screen');
                Navigator.pushNamed(context, '/calendar');
                // currentPage = 2;
                },
              child: Icon(Icons.calendar_today,
                  size: 38,
                  color: blackColor)
                  // color: currentPage == 2 ? primaryColor : blackColor)
          )
        ],
      ),
    ),
    );
  }
}
