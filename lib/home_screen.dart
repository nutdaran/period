import 'package:flutter/material.dart';
import 'package:number_slide_animation/number_slide_animation.dart';
import 'package:period/constants.dart';
import 'package:period/Element/floating_bottom_nav_bar.dart';
import 'package:circular/circular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffdfd),
      extendBody: true,
      bottomNavigationBar: const FloatingBottomNavBar(), // input pageid
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
                  "Ovulation in",
                  style: TextStyle(
                      fontSize: 25, color: blackColor, fontFamily: 'Lato'),
                ),
              ])),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: CircularViewer(
              maxValue: 60,
              radius: 100,
              color: const Color(0xfffEEEEE),
              value: 5,
              //parameter = number of day before ovulation
              sliderColor: primaryColor,
              unSelectedColor: Colors.white38,
              textStyle: const TextStyle(
                  color: blackColor, fontSize: 30, fontFamily: 'Lato'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(-10, -10),
                        color: Colors.white,
                        blurRadius: 20,
                        spreadRadius: 1),
                    BoxShadow(
                        offset: Offset(10, 10),
                        color: Color.fromARGB(155, 158, 158, 158),
                        blurRadius: 15,
                        spreadRadius: 1)
                  ]),
            ),
          ),

          /***
           * Cycle Length
           */
          Container(
            margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: ElevatedButton(
              onPressed: () {
                print('load edit period screen');
                Navigator.pushNamed(context, '/editPeriod');
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
                          child: NumberSlideAnimation(
                            number: "5",
                            textStyle: TextStyle(
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
                print('load edit period screen');
                Navigator.pushNamed(context, '/editPeriod');
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
                          child: NumberSlideAnimation(
                            number: "4",
                            textStyle: TextStyle(
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
}
