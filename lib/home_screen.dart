import 'dart:async';

import 'package:flutter/material.dart';
import 'package:period/constants.dart';
import 'package:period/Element/floating_bottom_nav_bar.dart';
import 'package:period/edit_cycle_screen.dart';
import 'package:period/edit_period_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int cycleLength = 0;
  int periodLength = 0;
  late Duration countdownDay = Duration(days: cycleLength);
  Timer? timer;
  bool isItCome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffdfd),
      extendBody: true,
      bottomNavigationBar: const FloatingBottomNavBar(
        page: 1,
      ), // input pageid
      body: Column(
        children: <Widget>[
          /***
           * Period Tracker
           */
          Container(
            margin: const EdgeInsets.only(top: 120, left: 40, right: 40),
            child: Row(
              children: const [
                Text(
                  "Period tracker",
                  style: TextStyle(
                      fontSize: 50, color: blackColor, fontFamily: 'Tempestua'),
                ),
                Text(
                  ".",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 50,
                      fontFamily: 'Tempestua'),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
              child: Row(children: const [
                Text(
                  "Next Period in",
                  style: TextStyle(
                      fontSize: 25, color: blackColor, fontFamily: 'Lato'),
                ),
              ])),
          Container(
              margin: const EdgeInsets.only(top: 15),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${countdownDay.inDays}",
                    style: TextStyle(fontSize: 60,
                    fontFamily: 'Lato'),
                  ),
                ],
              ),
              ),

          /***
           * Cycle Length
           */
          Container(
            margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: ElevatedButton(
              onPressed: () {
                print('load edit cycle length screen');
                _editCycle(context);
                // countdownDay = Duration(days: cycleLength);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: SizedBox(
                width: 300,
                height: 80,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cycle Length",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 25,
                              fontFamily: 'Lato'),
                        ),
                        Container(
                          child: Text(
                            "$cycleLength",
                            style: const TextStyle(
                                color: blackColor,
                                fontSize: 30,
                                fontFamily: 'Lato'),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),

          /***
           * Period Length
           */
          Container(
            margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: ElevatedButton(
              onPressed: () {
                print('load edit period length screen');
                _editPeriod(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: SizedBox(
                width: 300,
                height: 80,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Period Length",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 25,
                              fontFamily: 'Lato'),
                        ),
                        Container(
                          child: Text(
                            "$periodLength",
                            style: const TextStyle(
                                color: blackColor,
                                fontSize: 30,
                                fontFamily: 'Lato'),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _editCycle(BuildContext context) async {
    final int res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => EditCycleScreen(
                cycleLength: cycleLength,
              )),
    );
    setState(() {
      cycleLength = res;
      print('return value is $cycleLength');
      countdownDay = Duration(days: res);
      print(countdownDay.inDays.toString());
      startCountdown();
    });
  }

  _editPeriod(BuildContext context) async {
    final int res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => EditPeriodScreen(periodLength: periodLength)),
    );
    setState(() {
      periodLength = res;
      print('return value is $periodLength');
    });
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(days: 1), (_) => dayCountdown());
  }

  void dayCountdown() {
    final reduceSec = 1;
    setState(() {
      final seconds = countdownDay.inDays - reduceSec;
      if (countdownDay.inDays == 0) {
        if(isItCome == false){
          countdownDay = Duration(days: periodLength);
          isItCome = true;
          startCountdown();

        } else {
          countdownDay = Duration(days: cycleLength);
          isItCome = false;
          startCountdown();
        }

        //noti
      } else {
        countdownDay = Duration(days: seconds);
      }
    });
  }

  void stopTime() {
    setState(() {
      timer!.cancel();
    });
  }

  void resetTime() {
    stopTime();
    setState(() {
      countdownDay = Duration(days: cycleLength);
    });
  }
}
