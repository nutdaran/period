import 'package:flutter/material.dart';
import 'package:period/constants.dart';
import 'package:period/Element/floating_bottom_nav_bar.dart';
import 'package:circular/circular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      extendBody: true,
      bottomNavigationBar: FloatingBottomNavBar(), // input pageid
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 160, left: 40, right: 40),
            child: Row(
              children: const [
                Text(
                  "Period tracker",
                  style: TextStyle(fontSize: 50, fontFamily: 'Tempestua'),
                ),
                CircularViewer(maxValue: maxValue, radius: radius, color: color, value: value, sliderColor: sliderColor, unSelectedColor: unSelectedColor)
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Row(children: [
                Container(
                    child: Text(
                  "Ovaluation",
                  style: TextStyle(fontSize: 25, fontFamily: 'Lato'),
                )),
              ])),
          Container(
              margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Row(children: [
                Container(
                  child: Text(
                    "Cycle Length",
                    style: TextStyle(fontSize: 25, fontFamily: 'Lato'),
                  ),
                ),
              ])),
          Container(
              margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Row(children: [
                Container(
                  child: Text(
                    "Period Length",
                    style: TextStyle(fontSize: 25, fontFamily: 'Lato'),
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
