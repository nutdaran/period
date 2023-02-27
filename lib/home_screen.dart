import 'dart:async';

import 'package:flutter/material.dart';
import 'package:period/constants.dart';
import 'package:period/Element/floating_bottom_nav_bar.dart';
import 'package:period/edit_cycle_screen.dart';
import 'package:period/edit_period_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int cycleLength = 0;
  static int periodLength = 0;
  static int countdownDay = 0;
  Duration countdown = Duration(days: 0);
  Timer? timer;
  bool isItCome = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await pref.clear();
    if (pref.getInt('cycleLength') == null) {
      await pref.setInt('cycleLength', 0);
    }
      cycleLength = pref.getInt('cycleLength')??0;
    if (pref.getInt('periodLength') == null) {
      await pref.setInt('periodLength', 0);
    }
      periodLength = pref.getInt('periodLength')??0;
    if (pref.getString('date') == null) {
      await pref.setString('date', DateTime.now().toString());
    }
    countdownDay = cycleLength - (DateTime.now().day - DateTime.parse( pref.getString('date') as String).day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffdfd),
      extendBody: true,
      bottomNavigationBar: const FloatingBottomNavBar(
        page: 1,
      ), // input page id
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
                boxShadow: [BoxShadow(
    color: Colors.grey.withOpacity(0.4),
    spreadRadius: 8,
    blurRadius: 7,
                  offset: Offset(0, 6),
                )
    ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$countdownDay",
                    style: TextStyle(fontSize: 50,
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
                setState(() {
                  countdownDay = cycleLength;
                  countdown = Duration(days: cycleLength);
                });
                // Navigator.push(context, MaterialPageRoute(builder: (_) ))
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
      countdownDay = cycleLength;
      print('return value is $cycleLength');
      // countdownDay = Duration(days: res);
      // print(countdownDay.inDays.toString());
      // startCountdown();
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
      final day = countdown.inDays - reduceSec;
      if (countdown.inDays == 0) {
        if(isItCome == false){
          countdown = Duration(days: periodLength);
          isItCome = true;
          startCountdown();
        } else {
          countdown = Duration(days: cycleLength);
          isItCome = false;
          startCountdown();
        }
        //noti
      } else {
        countdown = Duration(days: day);
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
      countdown = Duration(days: cycleLength);
    });
  }

  getCycle() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('cycleLength');
  }

  setDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('date', DateTime.now().toString());
  }
}
